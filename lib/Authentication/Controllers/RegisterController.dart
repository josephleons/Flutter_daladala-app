import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vms/Authentication/model/userModel.dart';
import 'package:vms/screens/adminpage/ManageUser.dart';
import '../../Repository/user_repo.dart';
import '../../screens/users/users.dart';
import '../authUser/AuthRepositoryUser.dart';
class RegisterController extends GetxController{
  static RegisterController  get instance =>Get.find();

  // Text field to get data from user FieldForm
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();

final userRepo = Get.put(UserRepository());
  // register function to create user with email and password
  // void registerUser(String email, String password){
  //   // AuthRepositoryUser
  //   String? error = AuthRepositoryUser.instance.createUserWithEmailAndPassword(email, password)as String?;
  //       if(error!=null ){
  //         Get.showSnackbar(GetSnackBar(message:error.toString()));
  //       }
  //      }
  //
  // void createUser(UserModel user) {
  //   userRepo.createUser(user);
  //   Get.to(()=> const manageUser());
  // }
  //

}