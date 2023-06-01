//
// import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import '../util/colors.dart';
//
// class BottomNav extends StatefulWidget {
//  final String label;
//  final Color iconColor;
//  final IconData icon;
//  final Color backgroudColor;
//  final double iconSize;
//
//  const BottomNav(
//      {Key? key,
//        required this.icon,
//        this.iconColor = const Color(0xff797777),
//        this.backgroudColor = const Color(0xffF1F3F3),
//        this.iconSize = 45, required this.label})
//      : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.blueAccent,
//         items: [
//           CurvedNavigationBarItem(icon: Icon(Icons.add, size: 30), label: "Add"),
//           CurvedNavigationBarItem(icon: Icon(Icons.list, size: 30), label: "List"),
//           CurvedNavigationBarItem(icon: Icon(Icons.compare_arrows, size: 30), label: "Compare"),
//         ],
//         onTap: (index) {
//           //Handle button tap
//         },
//       ),
//
//     );
//    }
//   }
