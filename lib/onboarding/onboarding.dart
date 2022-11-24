import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/utils/dimensions.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';
import '../widget/small_text.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BoardingGetStartWidget(
        titleText: "Welcome to",
        commentText: "Your Best Money Payvand Partner.",
        image1: "assets/images/elipse127.png",
        image2: "assets/images/ellipse128.png",
      ),
    );
  }
}
class BoardingGetStartWidget extends StatelessWidget {
  final String titleText;
  final String commentText;
  final String image1;
  final String image2;
  const BoardingGetStartWidget({
    Key? key, required this.titleText, required this.commentText, required this.image1, required this.image2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90),
      child: Column(
          children: [
            Expanded(
              child: Center(
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
                    SizedBox(height: Dimensions.height30,),
                    Padding(
                      padding:  EdgeInsets.only(left: Dimensions.width13, right: Dimensions.width13),
                      child: BigText(text: titleText, size: 45, color: AppColors.textColor,),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: Dimensions.width13, right: Dimensions.width13),
                      child: BigText(text: "Payvand.", size: 40, color: AppColors.mainColor,),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                      padding:  EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                      child: SmallText(text: commentText, color: AppColors.textColorSmall, size: 13,),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/boarding/");
              },
              child: Center(
                child: Container(
                    width: 201,
                    height: 59,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.mainColor.withOpacity(0.2),
                              blurRadius: 60.0,
                              spreadRadius: 60,
                              offset: Offset(0, -50)),
                          BoxShadow(
                              color: AppColors.mainColor.withOpacity(0.2),
                              blurRadius: 60.0,
                              spreadRadius: 60,
                              offset: Offset(0, 50)),
                        ]
                    ),
                    child: Center(
                        child: BigText(text: "Get Started", size: 22, color: Colors.white,)
                    )
                ),
              ),
            )
          ],
        ),
    );
  }
}