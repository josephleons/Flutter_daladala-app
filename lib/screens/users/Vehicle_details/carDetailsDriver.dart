import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarDetails extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  late User _user;
  late String _userId;
  late String _userEmail;
  Map<String, dynamic> _userData = {};
  Map<String, dynamic> _vehicleData = {};

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _userId = _user.uid;
    _userEmail = _user.email!;
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(_userEmail) // Use _userId or _userEmail here depending on your requirement
        .get();

    if (userSnapshot.exists) {
      setState(() {
        _userData = userSnapshot.data() as Map<String, dynamic>;
      });
      print("User data: $_userData");
      fetchVehicleData(_userData['vehicleId']);
    } else {
      // Handle the case when the user does not exist
    }
  }

  Future<void> fetchVehicleData(String vehicleId) async {
    String vehicleId = _userData['vehicleId'];
    print("Vehicle ID: $vehicleId");

    DocumentSnapshot vehicleSnapshot = await FirebaseFirestore.instance
        .collection("vehicle")
        .doc(vehicleId)
        .get();

    if (vehicleSnapshot.exists) {
      setState(() {
        _vehicleData = vehicleSnapshot.data() as Map<String, dynamic>;
      });
    } else {
      // Handle the case when the vehicle does not exist
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: _userData.isNotEmpty && _vehicleData.isNotEmpty
          ? UserWidget(userData: _userData, vehicleData: _vehicleData)
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic> vehicleData;

  UserWidget({required this.userData, required this.vehicleData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('User: ${userData['email']}'),
        Text('Vehicle: ${vehicleData['make']}'),
      ],
    );
  }
}
