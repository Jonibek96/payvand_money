import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        toolbarHeight: 40,
        centerTitle: true,
        titleSpacing: 10,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(top: 10),
            child: BigText(text: "Activity", size: 20, fontWeight: FontWeight.w600,)),
        leading: Container(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            child: Container(
              width: 63,
              height: 34,
              margin: EdgeInsets.only(left: 50),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30,),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(0xFF000000).withOpacity(0.25), fontSize: 18),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(20),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Overall Incomings", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
                TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        BigText(text: "See All", color: AppColors.mainColor, size: 14,),
                        Icon(Icons.keyboard_arrow_right, color: AppColors.mainColor, size: 16,)
                      ],
                    )
                )
              ],
            ),
            Container(
              height: 275,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage("assets/images/vector-activ.png"),
                  fit: BoxFit.contain,
                )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 39,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Image.asset("assets/icons/calendar.png")
                            ),
                          ),
                          SizedBox(width: 20,),
                          BigText(text: "09-13 May", size: 16, fontWeight: FontWeight.w500,)
                        ],
                      ),
                      Image.asset("assets/icons/chart.png", color: AppColors.mainColor,)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Overall Outgoing", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
                TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        BigText(text: "See All", color: AppColors.mainColor, size: 14,),
                        Icon(Icons.keyboard_arrow_right, color: AppColors.mainColor, size: 16,)
                      ],
                    )
                )
              ],
            ),
            Container(
              height: 275,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage("assets/images/vector-ac2.png"),
                    fit: BoxFit.contain,
                  )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 39,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                                child: Image.asset("assets/icons/calendar.png")
                            ),
                          ),
                          SizedBox(width: 20,),
                          BigText(text: "09-13 May", size: 16, fontWeight: FontWeight.w500,)
                        ],
                      ),
                      Image.asset("assets/icons/chart.png", color: AppColors.mainColor,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
