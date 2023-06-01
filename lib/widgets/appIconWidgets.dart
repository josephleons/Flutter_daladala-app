import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final Color backgroudColor;
  final double iconSize;

  const AppIcons(
      {Key? key,
      required this.icon,
      this.iconColor = const Color(0xff797777),
      this.backgroudColor = const Color(0xffF1F3F3),
      this.iconSize = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:iconSize,
      width: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(iconSize/2),
        color:backgroudColor,
      ),
      child:Icon(
        icon,
        color: iconColor,
        size:18
      ),
    );
  }
}
