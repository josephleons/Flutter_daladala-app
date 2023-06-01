import 'package:flutter/material.dart';
import 'package:vms/util/colors.dart';
import 'package:vms/widgets/bigtext_widget.dart';
import 'package:vms/widgets/smalltext_widget.dart';
import 'allservice.dart';
import 'carouse.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffeefcff),
      appBar:AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff0A374C),
        title: Text("VMAP"),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children:<Widget>[
          Expanded(child:SingleChildScrollView(
            child:Carosen(),
          )),
        ],
      ),
    );
  }
}
