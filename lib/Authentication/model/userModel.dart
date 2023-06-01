import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String mobile;
  final String password;
  final String address;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.mobile,
    required this.password,
    required this.address,
  });
  toJson() {
    return {
      'Fullname': fullname,
      'email': email,
      'password': password,
      'mobile': mobile,
      'address': address,
    };
  }

  // Map user fetch from firebase to userModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
        id: document.id,
        fullname: data!['Fullname'],
        email: data['email'],
        mobile: data['mobile'],
        password: data['password'],
        address: data['address']);
  }
}
