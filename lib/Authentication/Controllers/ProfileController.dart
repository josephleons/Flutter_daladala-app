import 'package:get/get.dart';
import 'package:vms/Authentication/authUser/AuthRepositoryUser.dart';

import '../../Repository/user_repo.dart';
class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRep = Get.put(AuthRepositoryUser());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final email =_authRep.firebaseUser.value?.email;
    if(email!= null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }
}
