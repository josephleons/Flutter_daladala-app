import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vms/Home/DetailService.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/appIconWidgets.dart';
import 'package:vms/widgets/bigtext_widget.dart';

class CarRevenue extends StatefulWidget {
  const CarRevenue({Key? key}) : super(key: key);

  @override
  State<CarRevenue> createState() => _CarRevenueState();
}

class _CarRevenueState extends State<CarRevenue> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime _dateTime = DateTime.now();
  // DateTime
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference revenue =
        FirebaseFirestore.instance.collection("car_revenue");
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text(
          "Revenue History",
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
          //pop Up revenue form
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.defaulColor.withOpacity(0.6),
            ),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    await openDialog(context);
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const expandForm()));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    foregroundColor: AppColors.iconColor2,
                    side: const BorderSide(color: AppColors.iconColor2),
                    // padding:EdgeInsets.symmetric(vertical:Dimension.height10)
                  ),
                  child: const Icon(LineAwesomeIcons.plus),
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff0A374C),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.iconColor2.withOpacity(0.6),
                      padding: EdgeInsets.only(
                          left: Dimension.width10,
                          right: Dimension.width10,
                          top: Dimension.height20,
                          bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimension.radiUs10))),
                  //text button
                  child: Row(
                    children: [
                      const AppIcons(
                        icon: LineAwesomeIcons.car,
                        iconColor: AppColors.iconColor2,
                      ),
                      SizedBox(
                        width: Dimension.width10,
                      ),
                      const BigText(
                          text: "T2318ABC", color: AppColors.defaulColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          //revenue history
          Row(
            children: [
              const Icon(
                LineAwesomeIcons.hand_holding,
                size: 30,
                color: AppColors.iconColor2,
              ),
              SizedBox(
                width: Dimension.width20,
              ),
              const BigText(text: "All Revenue"),
            ],
          ),
          const SizedBox(
              height: 50,
              child: Divider(
                color: AppColors.iconColor2,
              )),
          // revenue history
          Container(
            height: 0,
            width: 0,
            color: Colors.amber,
            child: StreamBuilder(
                stream: revenue.orderBy('car').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView(
                    padding: EdgeInsets.only(
                        top: Dimension.height10,
                        left: Dimension.width10,
                        right: Dimension.width10),
                    children: snapshot.data!.docs.map((revenue) {
                      return Card(
                          child: Slidable(
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              flex: 5,
                              onPressed: ((context) {
                                revenue.reference.delete();
                              }),
                              backgroundColor: AppColors.deleteRed,
                              icon: Icons.delete_sharp,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: const Text("CarRevenue['Fullname']"),
                          subtitle: const Text("CarRevenue['email']"),
                          leading: const CircleAvatar(
                            child:
                                AppIcons(icon: LineAwesomeIcons.cash_register),
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
          )
        ],
      )),
      //bottom navigation
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.barColor,
        items: [
          CurvedNavigationBarItem(
              icon:
                  const Icon(Icons.home, size: 30, color: AppColors.textColor),
              label: "Home"),
          CurvedNavigationBarItem(
              icon: const Icon(Icons.settings,
                  size: 30, color: AppColors.textColor),
              label: "Settings"),
          CurvedNavigationBarItem(
              icon: const Icon(Icons.person,
                  size: 30, color: AppColors.textColor),
              label: "Accounts"),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
  // popUp revenue form
  Future<void> openDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController amountController = TextEditingController();
        final TextEditingController timeController = TextEditingController();
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Center(child: BigText(text: "Select Date")),
            content: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: false,
                    controller: timeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: AppColors.iconColor2)),
                      label: const Text("Select Date"),
                      hintText: _dateTime.toString(),
                      prefixIcon: IconButton(
                        onPressed: () {
                          _showDatePicker();
                        },
                        icon: const Icon(LineAwesomeIcons.calendar_with_day_focus),
                      ),
                    ),
                    validator: validateText,
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 2, color: AppColors.iconColor2)),
                      label: const BigText(text: "Enter Amount"),
                      prefixIcon: const Icon(LineAwesomeIcons.cash_register),
                    ),
                    validator: validateText,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const BigText(text: "cancel"),
              ),
              TextButton(
                child: const BigText(text: "save"),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      },
    );
  }

  void submit() {
    Navigator.of(context).pop();
  }

// validation form
  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required.';
    }
    return null;
  }
}
//
