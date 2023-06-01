import 'package:flutter/material.dart';
import 'package:vms/Authentication/signIn.dart';
import 'package:vms/screens/adminpage/ManageUser.dart';
import 'package:vms/screens/users/Vehicle_details/expnd.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';
import '../Authentication/authUser/AuthRepositoryUser.dart';
import '../screens/adminpage/adminDashboard.dart';
import '../screens/profile/profile.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildTopHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

// both widget receive data and display data of icon ,text and navigat
  Widget buildTopHeader(BuildContext context) => Material(
        color: AppColors.defaulColor,
        child: InkWell(
          onTap: () {
            // Navigator.pop(context);
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                SizedBox(height: Dimension.height10),
                const BigText(text: "VMMAP", color: AppColors.cardColor),
                const SmallText(
                    text: "Vehicle Monitoring Management Application",
                    color: AppColors.cardColor),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(26.0),
        child: Wrap(
          // runSpacing:16,
          children: [
            ListTile(
              iconColor: AppColors.iconColor2,
              leading: const Icon(Icons.person),
              title: const BigText(text: "Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            ListTile(
              iconColor: AppColors.iconColor2,
              leading: const Icon(Icons.home_outlined),
              title: const BigText(text: "Dashboard"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const adminDashboard()));
              },
            ),
            ListTile(
              iconColor: AppColors.iconColor2,
              leading: const Icon(Icons.person_pin),
              title: const BigText(text: "User management"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const manageUser()));
              },
            ),
            ListTile(
              iconColor: AppColors.iconColor2,
              leading: const Icon(Icons.home_repair_service_sharp),
              title: const BigText(text: "Services"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>const expend()));
              },
            ),
            ListTile(
              iconColor: AppColors.iconColor2,
              leading: const Icon(Icons.settings),
              title: const BigText(text: "Setting"),
              onTap: () {
              },
            ),
            const Divider(
              color: AppColors.defaulColor,
            ),
            const SizedBox(height: 150),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const BigText(
                text: "Logout",
                color: AppColors.iconColor2,
              ),
              onTap: () {
                AuthRepositoryUser.instance.Logout();
              }
            )
          ],
        ),
      );
}
