import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vms/Authentication/signIn.dart';


class AuthRepositoryUser extends GetxController {
  static AuthRepositoryUser get instance => Get.find();


  //variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  /// setting initial screen when onLoad
  // }
// for Login user
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {

    } catch (_) {}
  }

  // for logout
  // Future<void>
  // logout() async => await _auth.signOut();

  Future<void> Logout() async {
    try {
      await _auth.signOut();
      // Additional logout logic or navigation can be implemented here
      Get.offAll(() => LoginPage());
    } catch (e) {
      print('Logout error: $e');
    }
  }
}