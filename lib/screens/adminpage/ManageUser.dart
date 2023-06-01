import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vms/Authentication/Controllers/ProfileController.dart';
import 'package:vms/Repository/user_repo.dart';
import 'package:vms/widgets/smalltext_widget.dart';
import '../../Authentication/model/userModel.dart';
import '../../Home/DetailService.dart';
import '../../util/colors.dart';
import '../../widgets/appIconWidgets.dart';
import '../../widgets/bigtext_widget.dart';

class manageUser extends StatefulWidget {
  const manageUser({Key? key}) : super(key: key);

  @override
  State<manageUser> createState() => _manageUserState();
}

class _manageUserState extends State<manageUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRepository());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        scaffoldBackgroundColor:AppColors.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const BigText(text: 'User Record', color: AppColors.cardColor),
          backgroundColor: AppColors.defaulColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<List<UserModel>>(
                future: controller.getAllUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
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
                                    backgroundColor: AppColors.deleteRed,
                                    icon: Icons.delete_sharp,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                iconColor:AppColors.iconColor2,
                                tileColor:AppColors.cardColor,
                                title: BigText(
                                    text: snapshot.data![index].fullname),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: snapshot.data![index].mobile),
                                      SmallText(
                                          text: snapshot.data![index].email),
                                      SmallText(text: snapshot.data![index].address),
                                    ]),
                                leading: const CircleAvatar(
                                  child: AppIcons(icon: Icons.person,iconColor:AppColors.iconColor2),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DetailService()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.buttonColor,
                                    )),
                              ),
                            ));
                          });
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
                }),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.barColor,
          items: [
            CurvedNavigationBarItem(
                icon: const Icon(Icons.home, size: 30,color:AppColors.textColor), label: "Home"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.settings, size: 30,color:AppColors.textColor), label: "Settings"),
            CurvedNavigationBarItem(
                icon: const Icon(Icons.person, size: 30,color:AppColors.textColor), label: "Profile"),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
