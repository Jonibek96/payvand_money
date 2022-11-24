import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';

class NewsPageAll extends StatefulWidget {
  const NewsPageAll({Key? key}) : super(key: key);

  @override
  _NewsPageAllState createState() => _NewsPageAllState();
}

class _NewsPageAllState extends State<NewsPageAll> {
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
            child: BigText(text: "News Feed", size: 20, fontWeight: FontWeight.w600,)
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BigText(text: "Latest Update", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width-10,
            height: 213,
            decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/dollar1.png"),
                  fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Dollar goes up 21.3%", size: 26, fontWeight: FontWeight.w600, textAlign: TextAlign.left,),
                    Image.asset("assets/icons/tag_plus.png")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 24,),
                    SizedBox(width: 10,),
                    BigText(text: "20/3/22 - 7:30 AM", size: 13, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),],
                ),
                SizedBox(height: 20,),
                Text.rich(
                    TextSpan(
                        text: 'By ',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textColorSmall),
                        children: [
                          TextSpan(
                              text: "Rues Dan",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.mainColor)
                          )
                        ]
                    )
                ),
              ],
            )
          ),
          SizedBox(height: 10,),
          BigText(
              text: "Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up,",
              size: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorSmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
