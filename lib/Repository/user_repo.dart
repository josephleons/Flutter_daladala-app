import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:vms/Authentication/model/userModel.dart';
import 'package:vms/util/colors.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  /// create user function
  createUser(UserModel user) async {
    await _db
        .collection('users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "User account has been created",
              snackPosition: SnackPosition.TOP,
              backgroundColor: AppColors.buttonColor.withOpacity(0.1),
              colorText: AppColors.button),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.buttonColor.withOpacity(0.1),
          colorText: AppColors.deleteRed);
      print(error.toString());
    });
  }

  // fetch all user or user details?
  Future<UserModel>getUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email",isEqualTo:email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

// fetch Single UserDetails?
  Future<List<UserModel>>getAllUser() async {
    final snapshot = await _db.collection("users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
