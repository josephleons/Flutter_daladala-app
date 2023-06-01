import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vms/Home/ListService.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/util/dimension.dart';
import 'package:vms/widgets/appIconWidgets.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';

import 'DetailService.dart';

class Allservice extends StatefulWidget {
  const Allservice({Key? key}) : super(key: key);

  @override
  State<Allservice> createState() => _AllserviceState();
}

class _AllserviceState extends State<Allservice> {
  final List<ListService> ServiceList = [
    ListService(
      "joseph",
      DateTime.now(),
      "ABUD",
      1200000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdala",
      DateTime.now(),
      "KDC",
      3500000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "maija",
      DateTime.now(),
      "machame",
      4300000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "sakila",
      DateTime.now(),
      "mtei",
      3500000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "juma",
      DateTime.now(),
      "shabiby",
      1300000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdliah",
      DateTime.now(),
      "kilimanjaro Ex",
      1200000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdliah",
      DateTime.now(),
      "kilimanjaro Ex",
      1200000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdliah",
      DateTime.now(),
      "kilimanjaro Ex",
      1200000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdliah",
      DateTime.now(),
      "kilimanjaro Ex",
      1200000,
      const CircleAvatar().toString(),
    ),
    ListService(
      "abdliah",
      DateTime.now(),
      "kilimanjaro Ex",
      1200000,
      const CircleAvatar().toString(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(
          text: 'Service List',
          color: AppColors.cardColor,
        ),
        centerTitle: true,
        backgroundColor: AppColors.defaulColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(Dimension.radiUs10),
          ),
        ),
      ),
      body: _buildServiceList(context),
    );
  }

  ListView _buildServiceList(BuildContext context) {
    final service = ServiceList;
    return ListView.builder(
        itemCount: ServiceList.length,
        itemBuilder: (_, index) {
          // container outside card
          return Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            margin: EdgeInsets.only(
                left: Dimension.width20,
                right: Dimension.width30,
                bottom: Dimension.height15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff0A374C),
                  blurRadius: 12.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Color(0xffEEFCFF),
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Color(0xffEEFCFF),
                  offset: Offset(5, 0),
                ),
              ],
            ),
            // card carry each row of data
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BigText(text: ServiceList[index].username),
                          Text(
                            ServiceList[index].carname,
                            style: const TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                                color: AppColors.BigTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(ServiceList[index].serviceDate)
                                .toString(),
                          ),
                          BigText(
                            text:
                                "\$${ServiceList[index].budget.toStringAsFixed(2)}",
                            color: AppColors.iconColor1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DetailService()));
                              },
                              icon: const Icon(
                                Icons.rate_review_rounded,
                                color: AppColors.titleColor,
                              )),
                          const SmallText(
                            text: "View",
                            color: AppColors.buttonColor,
                            size: 18,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
