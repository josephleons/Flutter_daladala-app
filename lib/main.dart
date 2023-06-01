import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms/screens/users/signUp.dart';
import 'Authentication/authUser/AuthRepositoryUser.dart';
import 'Authentication/signIn.dart';


void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
      ).then((value) => Get.put(AuthRepositoryUser()));
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
