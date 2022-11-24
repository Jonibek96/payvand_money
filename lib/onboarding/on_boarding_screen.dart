import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/models/data_boarding.dart';


import '../models/data_boarding.dart';
import '../utils/app_colors.dart';
import '../utils/dimensions.dart';
import '../widget/big_text.dart';
import '../widget/small_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  var _currentPageValue = 0.0;


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: data_boarding.length,
            controller: pageController,
            itemBuilder: ( context, index) {
              return Container(
                child: _page(context, data_boarding[index]),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 180),
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              onTap: (index){
                pageController.jumpToPage(index.toInt());
              },
              position: _currentPageValue,
              dotsCount: data_boarding.length,
              decorator: DotsDecorator(
                color: Color(0xFF8EDFEB),
                activeColor: AppColors.mainColor,
                size: const Size.square(6.0),
                activeSize: const Size(6.0, 6.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: (){
                setState(() {
                  _currentPageValue = pageController.page!;
                });
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/sign/");
                },
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
                        ]),
                    child: Center(
                        child: BigText(
                          text: "Continue",
                          size: 22,
                          color: Colors.white,
                        ))),
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget _page(BuildContext context, DataBoarding dataBoarding) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 50),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(child: Image.asset(dataBoarding.image),),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: BigText(
              text: dataBoarding.title,
              size: 35,
              textAlign: TextAlign.center,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Dimensions.height20,),
          Padding(
            padding: const EdgeInsets.only(left: 51, right: 51),
            child: SmallText(
              text: dataBoarding.commentText,
              color: AppColors.textColorSmall,
              size: 13,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
