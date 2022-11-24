import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payvand_money/home/home_page.dart';
import 'package:payvand_money/home/notification/notification.dart';
import 'package:payvand_money/page/statistics/statistics.dart';
import 'package:payvand_money/profile/add_phone_number.dart';
import 'package:payvand_money/profile/profile_settings_page.dart';
import 'package:payvand_money/profile/profile_update.dart';
import 'package:payvand_money/profile/set_pin_code.dart';
import 'package:payvand_money/profile/verify_number.dart';
import 'package:payvand_money/splash/splash_screen.dart';
import 'package:payvand_money/widget/exp_pin.dart';



import 'auth/sign_up.dart';
import 'home/history/history_page.dart';
import 'home/notification/news_page_all.dart';
import 'onboarding/on_boarding_screen.dart';
import 'onboarding/onboarding.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Payvand App',
      //home: HistoryPage(),

       initialRoute: "/",
      routes: {
        "/":(context) => SplashScreen(),
        "/boarding/":(context) => OnBoardingScreen(),
        "/sign/":(context) => SignUp()
      },
    );
  }
}

