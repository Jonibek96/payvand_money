import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  final int? maxLines;
  SmallText({Key? key, this.color = const Color(0xFF878787),
    required this.text,
    this.size = 13,
    this.height = 1.2,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: TextAlign.center,
      maxLines: maxLines,
      style: TextStyle(
          fontFamily: 'San Francisco',
          color: color,
          fontSize: size,
          height: height
      ),
    );
  }
}
