// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/screens/adminpage/adminDashboard.dart';
import 'package:vms/screens/users/userDashboard.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/smalltext_widget.dart';

import '../screens/users/signUp.dart';
import '../util/colors.dart';
import '../widgets/bigtext_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  // Take user field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



// user error message
  void _showErrorSnackbar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }
//check user and role
  Future<void> _login() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential != null && userCredential.user != null) {
        final User? user = userCredential.user;

        // Retrieve user data from Firestore
        final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
        final DocumentSnapshot userSnapshot = await usersCollection.doc(email).get();

        if (userSnapshot.exists) {
          final userData = userSnapshot.data() as Map<String, dynamic>;

          // Check user role
          final bool is_owner = userData['is_owner'];
          final bool is_driver = userData['is_driver'];
          if (is_owner) {
            // User is an admin
            // Redirect to admin page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const adminDashboard()),
            );
          } else if (is_driver) {
            // User is a regular user
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const userDashboard()),
            );
            // Redirect to regular user page
          }
        } else {
        // User record does not exist
        _showErrorSnackbar("User record not found");
      }
        _emailController.clear();
        _passwordController.clear();
      }

    } catch (e) {
      print("Error logging in: $e");
      // Handle login error
    }
  }

  // Function validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        secondaryHeaderColor: AppColors.defaulColor,
      ),
      home: Scaffold(
        backgroundColor: AppColors.defaulColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Email address field
                      TextFormField(
                        autofocus: true,
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.cardColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: AppColors.iconColor2)),
                          label: const BigText(text: "E-Mail"),
                          prefixIcon: const Icon(
                            LineAwesomeIcons.mail_bulk,
                            color: AppColors.iconColor2,
                          ),
                        ),
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autofocus: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.cardColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  width: 2, color: AppColors.iconColor2)),
                          label: const BigText(text: "Password"),
                          prefixIcon: const Icon(
                            LineAwesomeIcons.user_lock,
                            color: AppColors.iconColor2,
                          ),
                        ),
                        validator: validatePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      // Login Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColors.iconColor2,
                                  side: const BorderSide(
                                      color: AppColors.iconColor2),
                                  padding: const EdgeInsets.all(16)),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(const Duration(seconds: 54),(){
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                                if (_key.currentState!.validate()) {
                                  _login();
                                }
                              },
                              child: isLoading? Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  SmallText(text: "Loading",color:AppColors.cardColor,),
                                  SizedBox(width: Dimension.width10,),
                                  CircularProgressIndicator(color:AppColors.cardColor,),
                                ],
                              ):const BigText(text: 'Login'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimension.height10),
                        child: const Center(
                          child: SmallText(
                            text: "Forgot Password ?",
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimension.height10,
                            bottom: Dimension.height10),
                        child: const Center(
                          child: BigText(
                            text: 'Or',
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                      // button for Sign Up users
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: BigText(
                            text: "Create an Account",
                            color: AppColors.cardColor,
                          )),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: AppColors.cardColor,
                                foregroundColor: AppColors.iconColor2,
                                side: const BorderSide(
                                    color: AppColors.iconColor2),
                                padding: const EdgeInsets.all(16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const signUp()));
                              },
                              child: const BigText(text: 'Sign Up'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
