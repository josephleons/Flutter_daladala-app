import 'package:flutter/cupertino.dart';
class SmallText extends StatefulWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  final TextOverflow overflow;

  const SmallText({
    Key? key,
    required this.text, // using the `required` keyword to make sure `text` is non-null
    this.size = 14,
    this.height = 1.2,
    this.color = const Color(0xff0A374C),
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  State<SmallText> createState() => _SmallTextState();
}

class _SmallTextState extends State<SmallText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget
          .text, // using `widget.text` to access the `text` property from the widget's state
      style: TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontWeight: FontWeight.w200,
        height: widget.height,
      ),
    );
  }
}
