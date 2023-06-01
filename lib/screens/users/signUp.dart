
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/Authentication/signIn.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import '../../widgets/bigtext_widget.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // text controller
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  Future<void> _signup() async {
    try {
      final String  fullName = _fullNameController.text.trim();
      final String  email   = _emailController.text.trim();
      final String  password = _passwordController.text.trim ();
      final String  address = _addressController.text.trim ();
      final String  mobile = _mobileController. text.trim ();

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential != null && userCredential.user != null) {
        // Store user email in Firebase Authentication
        final User? user = userCredential.user;
        await user?.updateEmail(email);
        final userId = user?.uid;
        // Store user data in Firestore
        final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
        // final userId = userCredential.user?.uid;
        final  userDoc = usersCollection.doc(email);
        await userDoc.set({
          // 'userId':userId,
          'fullName':fullName,
          'email': email,
          'address' :address,
          'mobile': mobile,
          'is_owner': false,
          'is_driver': true,
        });

        // Redirect to another page after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } catch (e) {
      print("Error signing up: $e");
      // Handle signup error
    }
  }

// validation
  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

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
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const BigText(
            text: "Registration Page",
            color: AppColors.cardColor,
          ),
          backgroundColor: AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        backgroundColor: AppColors.cardColor,
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height:Dimension.height20,),
                TextFormField(
                  controller:_fullNameController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(100)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(100),
                        borderSide:const BorderSide(width:2,color:AppColors.iconColor2)),
                    label:const BigText(text: "FullName"),prefixIcon:const Icon(LineAwesomeIcons.user),
                  ),
                  validator:validateText,
                ),
                SizedBox(height:Dimension.height20),
                TextFormField(
                  controller:_emailController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(100)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(100),
                        borderSide:const BorderSide(width:2,color:AppColors.iconColor2)
                    ),
                    label:const BigText(text: "E-Mail"),prefixIcon:const Icon(LineAwesomeIcons.mail_bulk),
                  ),
                  validator: validateEmail,
                ),
                SizedBox(height:Dimension.height20),

                TextFormField(
                  controller:_passwordController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(100)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(100),
                        borderSide:const BorderSide(width:2,color:AppColors.iconColor2)),
                    label:const BigText(text: "Password"),prefixIcon:const Icon(LineAwesomeIcons.phone),
                  ),
                  validator: validatePassword,
                  obscureText: true,
                ),
                SizedBox(height:Dimension.height20),
                TextFormField(
                  controller:_mobileController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(100)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(100),
                        borderSide:const BorderSide(width:2,color:AppColors.iconColor2)),
                    label:const BigText(text: "Mobile"),prefixIcon:const Icon(LineAwesomeIcons.fingerprint),
                  ),
                  validator: validateText,
                ),
                SizedBox(height:Dimension.height20),
                TextFormField(
                  controller:_addressController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(100)),
                    focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(100),
                        borderSide:const BorderSide(width:2,color:AppColors.iconColor2)),
                    label:const BigText(text: "Address"),prefixIcon:const Icon(LineAwesomeIcons.fingerprint),
                  ),
                  validator: validateText,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            if (_key.currentState!.validate()) {
              _signup();
            }
          },
        ),
      ),
    );
  }
}
