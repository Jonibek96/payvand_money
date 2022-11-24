import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';
import 'package:payvand_money/widget/small_text.dart';

import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }
  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=> OnBoarding(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewWidget(
        titleText: "Payvand",
        commentText: "Your Best Money Payvand Partner.",
        image1: "assets/images/elipse127.png",
        image2: "assets/images/ellipse128.png",
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallText(text: "Secured by ", color: AppColors.textColorSmall, size: 16,),
            SmallText(text: "Payvand.", color: AppColors.mainColor, size: 16,),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String titleText;
  final String commentText;
  final String image1;
  final String image2;
  const NewWidget({
    Key? key, required this.titleText, required this.commentText, required this.image1, required this.image2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 83,
                height: 83,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image1)
                    )
                ) ,
              ),
              Container(
                width: 83,
                height: 83,
               margin: EdgeInsets.only(left: 53),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image2)
                    )
                ) ,
              ),
            ],
          ),
          SizedBox(height: 30,),
          BigText(text: titleText, size: 54, color: AppColors.mainColor,),
          SizedBox(height: 15,),
          SmallText(text: commentText, color: AppColors.mainColor, size: 13,),
        ],
      ),
    );
  }
}
