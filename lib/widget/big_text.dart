import 'package:flutter/cupertino.dart';


class BigText extends StatelessWidget {
  Color? color;
  final String text;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double size;
  BigText( {Key? key, this.color = const Color(0xFF1E1E1E),
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: 'San Francisco',
          color: color,
          fontSize: size==0?20:size,
        fontWeight: fontWeight
      ),
    );
  }
}