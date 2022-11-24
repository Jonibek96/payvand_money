import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class ButtonMain extends StatelessWidget {
  final String text;
  const ButtonMain({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //padding: EdgeInsets.only(top: Dimensions.height30),
      child: TextButton(
        onPressed: () {
        },
        child: Container(
            width: 201,
            height: 59,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.18),
                      blurRadius: 60.0,
                      spreadRadius: 60.0,
                      offset: Offset(0, -50)),
                  BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.158),
                      blurRadius: 60.0,
                      spreadRadius: 60.0,
                      offset: Offset(0, 50)),
                ]),
            child: Center(
                child: BigText(
                  text: text,
                  size: 22,
                  color: Colors.white,
                ))),
      ),
    );
  }
}

