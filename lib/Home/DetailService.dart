
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/bigtext_widget.dart';

import '../util/colors.dart';
import '../widgets/BottomNav.dart';

class DetailService extends StatefulWidget {
  const DetailService({Key? key}) : super(key: key);

  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const BigText(text:"Details",color:AppColors.cardColor,),
          backgroundColor:AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
          backgroundColor: AppColors.background,
          body:Column(
            children:<Widget> [
              Row(
                children: const [
                  Center(
                      child: BigText(text:"Single User data"),
                  ),
                ],
              ),
            ],
          ),













          //bottom navigator
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: AppColors.barColor,
            items: [
              CurvedNavigationBarItem(
                  icon: Icon(Icons.home, size: 30,color:AppColors.textColor), label: "Home"),
              CurvedNavigationBarItem(
                  icon: Icon(Icons.settings, size: 30,color:AppColors.textColor), label: "Settings"),
              CurvedNavigationBarItem(
                  icon: Icon(Icons.person, size: 30,color:AppColors.textColor), label: "Accounts"),
            ],
            onTap: (index) {
              //Handle button tap
            },
          ),
       );
  }
}
