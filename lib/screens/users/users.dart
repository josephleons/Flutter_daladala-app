import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vms/Home/DetailService.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/appIconWidgets.dart';
import 'package:vms/widgets/bigtext_widget.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const BigText(text: 'User Records', color: AppColors.cardColor),
        backgroundColor: AppColors.defaulColor,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: users.orderBy('Fullname').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                padding: EdgeInsets.only(
                    top: Dimension.height10,
                    left: Dimension.width10,
                    right: Dimension.width10),
                children: snapshot.data!.docs.map((users) {
                  return Card(
                      child: Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          flex: 5,
                          onPressed: ((context) {
                            users.reference.delete();
                          }),
                          backgroundColor: AppColors.deleteRed,
                          icon: Icons.delete_sharp,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(users['Fullname']),
                      subtitle: Text(users['email']),
                      leading: const CircleAvatar(
                        child: AppIcons(icon: Icons.person),
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
                }).toList(),
              );
            }),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const FormValidation()));
          // },
        }
      ),
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
    );
  }
}
