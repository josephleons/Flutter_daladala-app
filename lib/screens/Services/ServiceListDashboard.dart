import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/Home/parts_services.dart';
import 'package:vms/Repository/user_repo.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/appIconWidgets.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';

import '../../Authentication/model/userModel.dart';
import '../../Home/DetailService.dart';

class ServiceListDashboard extends StatefulWidget {
  const ServiceListDashboard({Key? key}) : super(key: key);

  @override
  State<ServiceListDashboard> createState() => _ServiceListDashboardState();
}

class _ServiceListDashboardState extends State<ServiceListDashboard> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRepository());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Service Management",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: const Icon(
                  LineAwesomeIcons.angle_left,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () => Navigator.pop(context)),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  LineAwesomeIcons.moon,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {}),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xff0A374C),
        ),
        //body//
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // to row service and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radiUs10),
                        color: AppColors.iconColor2.withOpacity(0.6),
                      ),
                      child: Row(
                        children: [
                          AppIcons(icon: LineAwesomeIcons.vector_square),
                          SizedBox(
                            width: Dimension.width10,
                          ),
                          Text("All Services")
                        ],
                      ),
                    ),
                    Container(
                      child: AppIcons(
                          icon: LineAwesomeIcons.edit,
                          iconColor: AppColors.iconColor2),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimension.height20,
                ),
                // Serching bar
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radiUs10),
                      color: AppColors.iconColor2.withOpacity(0.1)),
                  child: Row(
                    children: [
                      AppIcons(
                        icon: LineAwesomeIcons.search,
                        iconColor: AppColors.iconColor2,
                      ),
                      SizedBox(
                        width: Dimension.width10,
                      ),
                      BigText(text: 'Search'),
                    ],
                  ),
                ),
                // Content center
                SizedBox(
                  height: Dimension.height20,
                ),
                // pupulate service data all here
                Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<List<UserModel>>(
                          future: controller.getAllUser(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (c, index) {
                                      return Card(
                                        child: Slidable(
                                          endActionPane: ActionPane(
                                            motion: const StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                flex: 5,
                                                onPressed: ((context) {}),
                                                backgroundColor:
                                                    AppColors.deleteRed,
                                                icon: Icons.delete_sharp,
                                              ),
                                            ],
                                          ),
                                          child: ListTile(
                                            onTap: () {},
                                            iconColor: AppColors.iconColor2,
                                            tileColor: AppColors.cardColor,
                                            title: BigText(
                                                text: snapshot
                                                    .data![index].fullname),
                                            subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BigText(
                                                      text: snapshot
                                                          .data![index].mobile),
                                                  SmallText(
                                                      text: snapshot
                                                          .data![index].email),
                                                ]),
                                            leading: const CircleAvatar(
                                              child: AppIcons(
                                                  icon: Icons
                                                      .home_repair_service_sharp,
                                                  iconColor:
                                                      AppColors.iconColor2),
                                            ),
                                            trailing:
                                                Icon(LineAwesomeIcons.check),
                                          ),
                                        ),
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: BigText(
                                        text: snapshot.error.toString()));
                              } else {
                                return const Center(
                                    child:
                                        BigText(text: "Somethings went wrong"));
                              }
                            } else {
                              // load when connection is not stable
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.iconColor2,
          child: const Icon(LineAwesomeIcons.plus, color: AppColors.cardColor),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PartsService()));
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.barColor,
          items: [
            CurvedNavigationBarItem(
                icon: const Icon(Icons.home,
                    size: 30, color: AppColors.textColor),
                label: "Home"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.settings,
                    size: 30, color: AppColors.textColor),
                label: "Settings"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.person,
                    size: 30, color: AppColors.textColor),
                label: "Profile"),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
