import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/widgets/smalltext_widget.dart';

class IconTextWidget extends StatefulWidget {
  final String text;
  final Color iconColor;
  const IconTextWidget( {Key? key,
    required this.text,
   required this.iconColor}) : super(key: key);

  @override
  State<IconTextWidget> createState() => _IconTextWidgetState();
}

class _IconTextWidgetState extends State<IconTextWidget> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         Icon(Icon as IconData?,color:widget.iconColor),
         const SizedBox(width: 5,),
        SmallText(text:widget.text),
      ],
    );
  }
}
