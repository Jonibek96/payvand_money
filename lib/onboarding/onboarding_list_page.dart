import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/models/data_boarding.dart';

import '../utils/app_colors.dart';
import '../utils/dimensions.dart';
import '../widget/big_text.dart';
import '../widget/small_text.dart';

class OnboardingListPage extends StatefulWidget {

  const OnboardingListPage({Key? key,

  }) : super(key: key);

  @override
  _OnboardingListPageState createState() => _OnboardingListPageState();
}

class _OnboardingListPageState extends State<OnboardingListPage> {
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
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: data_boarding.length,
                    itemBuilder: (context, position) {
                      return buildColumn(context, data_boarding[position]);
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: DotsIndicator(
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
            Center(
              child: GestureDetector(
                onTap: (){

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
            )
          ],
        ),
      )
    );
  }
  Widget buildColumn(BuildContext context, DataBoarding dataBoarding) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Image.asset(dataBoarding.image),
        ),
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
        SizedBox(
          height: Dimensions.height20,
        ),
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
    );
  }
}

