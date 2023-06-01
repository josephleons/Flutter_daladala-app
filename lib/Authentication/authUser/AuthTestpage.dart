// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:vms/Authentication/login.dart';
// import 'package:vms/Wecome.dart/welcomepage.dart';
// import '../../screens/users/dashboardscreen.dart';
// import '../../screens/admin/admindashboardscreen.dart';
// import 'exception/sign_in_email_password.dart';
//
// class AuthRepositoryUser extends GetxController {
//   static AuthRepositoryUser get instance => Get.find();
//
//   // Variables
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//
//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }
//
//   /// Setting initial screen when onLoad
//   _setInitialScreen(User? user) {
//     if (user == null) {
//       Get.offAll(() => const WelcomePage());
//     } else {
//       _redirectBasedOnRole(user.uid);
//     }
//   }
//
//   // Redirect based on user role
//   _redirectBasedOnRole(String userId) async {
//     // Implement your logic to check the user's role,
//     // e.g., by reading from a user database or Firestore
//     // and checking a field that represents the user's role.
//     // You can use Firebase Firestore or any other database
//     // to store and manage user roles.
//
//     // Assuming you have a collection called 'users' in Firestore,
//     // and each user document has a 'role' field.
//     final userDoc = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .get();
//
//     final role = userDoc.data()?['role'];
//     if (role == 'admin') {
//       Get.offAll(() => const AdminDashboard());
//     } else {
//       Get.offAll(() => const UserDashboard());
//     }
//   }
//
//   // For creating a user
//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       final user = _auth.currentUser;
//       if (user != null) {
//         _redirectBasedOnRole(user.uid);
//       } else {
//         Get.offAll(() => const WelcomePage());
//       }
//     } on FirebaseAuthException catch (e) {
//       final ex = SignWithEmailPasswordFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     } catch (_) {
//       const ex = SignWithEmailPasswordFailure();
//       print('EXCEPTION - ${ex.message}');
//       throw ex;
//     }
//   }
//
//   // For logging in a user
//   Future<void> loginWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       final user = _auth.currentUser;
//       if (user != null) {
//         _redirectBasedOnRole(user.uid);
//       }
//     } on FirebaseAuthException catch (e) {
//       // Handle login errors
//     } catch (_) {
//       // Handle login errors
//     }
//   }
//
//   // For logging out
//   Future<void> logout() async => await _auth.signOut();
// }
