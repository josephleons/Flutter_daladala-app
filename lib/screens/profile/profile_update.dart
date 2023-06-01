import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/Authentication/Controllers/ProfileController.dart';
import 'package:vms/Authentication/model/userModel.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';

import '../../util/colors.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                LineAwesomeIcons.angle_left,
              )),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xff0A374C),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
              future:controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Icon(
                                    LineAwesomeIcons.user,
                                    size: 100,
                                    color: AppColors.textColor,
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.defaulColor,
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: AppColors.cardColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimension.height20),
                        Form(
                            child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullname,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 2, color: AppColors.iconColor2)),
                                label: const BigText(text: "FullName"),
                                prefixIcon: const Icon(LineAwesomeIcons.user),
                              ),
                            ),
                            SizedBox(height: Dimension.height20),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 2, color: AppColors.iconColor2)),
                                label: const BigText(text: "E-Mail"),
                                prefixIcon:
                                    const Icon(LineAwesomeIcons.mail_bulk),
                              ),
                            ),
                            SizedBox(height: Dimension.height20),
                            TextFormField(
                              initialValue: userData.mobile,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 2, color: AppColors.iconColor2)),
                                label: const BigText(text: "Phone"),
                                prefixIcon: const Icon(LineAwesomeIcons.phone),
                              ),
                            ),
                            SizedBox(height: Dimension.height20),
                            TextFormField(
                              initialValue: userData.password,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 2, color: AppColors.iconColor2)),
                                label: const BigText(text: "Password"),
                                prefixIcon:
                                    const Icon(LineAwesomeIcons.fingerprint),
                              ),
                            ),
                            SizedBox(height: Dimension.height20),
                            SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      Get.to(() => const ProfileUpdate()),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.defaulColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const BigText(
                                    text: 'Edit Profile',
                                    color: AppColors.cardColor,
                                  ),
                                )),
                            SizedBox(
                              height: Dimension.height20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(TextSpan(
                                  text: 'Joined 24 May 2023',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.deleteRed
                                            .withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: AppColors.deleteRed,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none),
                                    child: const Text('Delete')),
                              ],
                            )
                          ],
                        ))
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: BigText(text: snapshot.error.toString()));
                  } else {
                    return const Center(
                        child: BigText(text: "Somethings went wrong"));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
