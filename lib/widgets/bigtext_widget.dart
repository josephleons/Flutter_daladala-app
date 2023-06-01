
import 'package:flutter/cupertino.dart';
class BigText extends StatefulWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    required this.text, // using the `required` keyword to make sure `text` is non-null
    this.size =18,
    // dafult color of bigtext
    this.color = const Color(0xff0A374C),
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  State<BigText> createState() => _BigTextState();
}

class _BigTextState extends State<BigText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text, // using `widget.text` to access the `text` property from the widget's state
      overflow: widget.overflow,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontFamily:'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}


