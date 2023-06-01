import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/NavigationDrawerWidget.dart';

import '../../util/colors.dart';
import '../../widgets/bigtext_widget.dart';
class adminDashboard extends StatefulWidget {
  const adminDashboard({Key? key}) : super(key: key);

  @override
  State<adminDashboard> createState() => _adminDashboardState();
}

class _adminDashboardState extends State<adminDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        scaffoldBackgroundColor:AppColors.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title:Row(
            children: [
                Expanded(
                  child: const BigText(
                  text: "Dashboard",
                  color: AppColors.cardColor,
            ),
                ),
               Expanded(child: Icon(Icons.person_pin_circle_outlined)),
            ],
          ),
          backgroundColor: AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(9),
            ),
          ),
        ),
        drawer:const NavigationDrawerWidget(),
        body:SafeArea(
          child:SingleChildScrollView(
            child:Padding(padding:EdgeInsets.all(Dimension.height20),
             child:Column(
               children: [
                 Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                   children: [
                     Expanded(
                       child: OutlinedButton(
                         style: OutlinedButton.styleFrom(
                           shape:RoundedRectangleBorder(
                             borderRadius:BorderRadius.only(
                               topLeft: Radius.circular(10.0),
                             )
                           ),
                           backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                           foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                           side: const BorderSide(
                               color: AppColors.iconColor2,),
                           padding: const EdgeInsets.all(20),
                         ),
                         onPressed: () {
                         },
                         child:Row(
                           children: [
                             Center(
                               child: Icon(
                                 LineAwesomeIcons.car,
                                 color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                 size: 40,
                               ),
                             ),
                             SizedBox(width:Dimension.width5,),
                             BigText(
                               text: "Vehicles",
                               color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                             ),
                           ],
                         )
                       ),
                     ),
                      SizedBox(width:Dimension.height10),
                      Expanded(
                        child: OutlinedButton(
                           style: OutlinedButton.styleFrom(
                             shape:RoundedRectangleBorder(
                                 borderRadius:BorderRadius.only(
                                   topLeft: Radius.circular(10.0),
                                 )
                             ),
                             backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                             foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                             side: const BorderSide(
                               color: AppColors.iconColor2,),
                             padding: const EdgeInsets.all(20),
                           ),
                           onPressed: () {
                           },
                           child:Row(
                             children: [
                               Center(
                                 child: Icon(
                                   LineAwesomeIcons.user_check,
                                   color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                   size: 40,
                                 ),
                               ),
                               SizedBox(width:Dimension.width5,),
                               BigText(
                                 text: "Driver",
                                 color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                               ),
                             ],
                           )
                        ),
                      ),
                     ]
                 ),
                 SizedBox(height: Dimension.height20,),
                 Row(
                   children: [
                     OutlinedButton(
                         style: OutlinedButton.styleFrom(
                           shape:RoundedRectangleBorder(
                               borderRadius:BorderRadius.only(
                                 topLeft: Radius.circular(10.0),
                               )
                           ),
                           backgroundColor: AppColors.cardColor.withOpacity(Dimension.opacity),
                           foregroundColor: AppColors.iconColor2.withOpacity(Dimension.opacity),
                           side: const BorderSide(
                             color: AppColors.iconColor2,),
                           padding: const EdgeInsets.all(20),
                         ),
                         onPressed: () {
                         },
                         child:Row(
                           children: [
                             Center(
                               child: Icon(
                                 LineAwesomeIcons.user_cog,
                                 color: AppColors.iconColor2.withOpacity(Dimension.opacity),
                                 size: 40,
                               ),
                             ),
                             SizedBox(width:Dimension.width5,),
                             BigText(
                               text: "Users",
                               color: AppColors.defaulColor.withOpacity(Dimension.opacity),
                             ),
                           ],
                         )
                     ),
                   ],
                 )
               ],
             ),
            ),
          ),
        ),























        //Bottom Navigation
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.barColor,
          items: [
            CurvedNavigationBarItem(
                icon: const Icon(Icons.home, size: 30,color:AppColors.textColor), label: "Home"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.settings, size: 30,color:AppColors.textColor), label: "Settings"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.person, size: 30,color:AppColors.textColor), label: "Accounts"),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        // BottomNavi(context);
      ),
    );
  }
}
