import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
            margin: EdgeInsets.only(top: 10),
            child: BigText(text: "History", size: 20, fontWeight: FontWeight.w600,)
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          SizedBox(height: 20,),
          BigText(text: "Data", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined),
              SizedBox(width: 20,),
              BigText(text: "May", size: 18, fontWeight: FontWeight.w500,)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        BigText(text: "Transactions", size: 12, color: Colors.white,),
                        SizedBox(width: 5,),
                        Icon(Icons.south_west, size: 18, color: Colors.white,),
                      ],
                    ),
                    BigText(text: "\$200", size:16, fontWeight: FontWeight.w600, color: Colors.white,)
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.iconColor1,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        BigText(text: "Tickets", size: 12, color: Colors.white,),
                        SizedBox(width: 5,),
                        Icon(CupertinoIcons.arrow_up_right, size: 18, color: Colors.white,),
                      ],
                    ),
                    BigText(text: "\$200", size:16, fontWeight: FontWeight.w600, color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          BigText(text: "Today", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
          SizedBox(height: 20,),
          SingleChildScrollView(
            padding: EdgeInsets.all(5),
            primary: true,
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(3, (index) =>
                  Container(
                    height: 79,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(0,1)
                          ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                              color: AppColors.iconColor1,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Shoping", size: 18,),
                            SizedBox(height: 10,),
                            BigText(text: "4:34 PM", size: 10,),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.south_west, color: AppColors.textColorBig, size: 16,),
                            SizedBox(height: 10,),
                            BigText(text: "-\$5.84", size: 16, color: AppColors.textColorBig, fontWeight: FontWeight.w700, ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          BigText(text: "Yesterday", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
          SizedBox(height: 20,),
          SingleChildScrollView(
            padding: EdgeInsets.all(5),
            primary: true,
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(3, (index) =>
                  Container(
                    height: 79,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(0,1)
                          ),]
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                              color: AppColors.iconColor1,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Entertaiment", size: 18,),
                            SizedBox(height: 10,),
                            BigText(text: "4:34 PM", size: 10,),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(CupertinoIcons.arrow_up_right, color: AppColors.textColorBig, size: 16,),
                            SizedBox(height: 10,),
                            BigText(text: "-\$5.84", size: 16, color: AppColors.textColorBig, fontWeight: FontWeight.w700, ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
