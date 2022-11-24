import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';
import 'news_page.dart';
import 'notification_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 120,
          toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
              margin: EdgeInsets.only(top: 10),
              child: BigText(text: "Notification and News", size: 20, fontWeight: FontWeight.w600,)
          ),
          leading: Container(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 63,
                height: 34,
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainColor
                ),
                child: Center(
                    child:Icon(Icons.arrow_back, color: Colors.white,)
                ),
              ),
            ),
          ),
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
            indicatorColor: AppColors.mainColor,
            tabs: [
              BigText(text: "Notifications", size: 16, color: AppColors.textColor,),
              BigText(text: "News Feed", size: 16, color: AppColors.textColor,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NotificationPage(),
            NewsPage()
          ],
        ),
      ),
    );
  }
}
