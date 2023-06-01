import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/screens/profile/profile_update.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color of hone app
      backgroundColor: const Color(0xffeefcff),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const Icon(LineAwesomeIcons.angle_left,
                color: Colors.white,
                size: 27,
              ),
    onPressed: ()=> Navigator.pop(context)),
        ),
        actions: [
          IconButton(
              icon: const Icon(LineAwesomeIcons.moon,
                color: Colors.white,
                size: 27,
              ),
              onPressed: () {}),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff0A374C),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column (
            children:[
            Stack(
              children: [
                SizedBox(
                    width:120,
                    height:120,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child:const Icon(LineAwesomeIcons.user,size:100,color:AppColors.textColor,)),
                ),
                Positioned(
                  bottom:0,
                  right:0,
                  child: Container(
                    width:35,height: 35,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color:AppColors.defaulColor,
                    ),
                    child:const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color:AppColors.cardColor,
                    size:20,),
                  ),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(height:20),
            const BigText(text: "Joseph leonard"),
            const SmallText(text:"josephleonard809@gmail.com"),
          SizedBox(width: 200,
          child:ElevatedButton(
            onPressed: ()=> Get.to(()=>const ProfileUpdate()),
            style:ElevatedButton.styleFrom(
              backgroundColor:AppColors.defaulColor,side:BorderSide.none,shape:const StadiumBorder(),
            ),
            child:const BigText(text: 'Edit Profile',color:AppColors.cardColor,),
          ),
          ),
              const SizedBox(height:30),
              const Divider(),
              const SizedBox(height:10),
              //MENU
              ProfileMenuWidget(title:'Notification',icon:LineAwesomeIcons.bell, onPress:(){}),
              ProfileMenuWidget(title:'Billing Details',icon:LineAwesomeIcons.wallet, onPress:(){}),
              ProfileMenuWidget(title:'User Management',icon:LineAwesomeIcons.wallet, onPress:(){}),
              ProfileMenuWidget(title:'Information',icon:LineAwesomeIcons.info, onPress:(){}),
              const SizedBox(height:10),
              const Divider(color:AppColors.defaulColor,),
              ProfileMenuWidget(
                  title:'Logout',
                  icon:LineAwesomeIcons.alternate_sign_out,
                  endIcon:false,
                  onPress:(){}),
            ],
        ),
      ),
    ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.endIcon = true,
    required this.onPress,
  }):super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onPress,
      leading:Container(
        width:40,height: 40,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:AppColors.defaulColor.withOpacity(0.1),
        ),
        child:Icon(icon , color:AppColors.defaulColor),
      ),
      title:BigText(text:title),
      trailing:endIcon? Container(
        width:30,height: 30,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:AppColors.defaulColor.withOpacity(0.1),
        ),
        child:const Icon(
            LineAwesomeIcons.angle_right,
            color:AppColors.textColor)):null,
    );
  }
}
