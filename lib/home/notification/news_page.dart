import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';

import 'news_page_all.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BigText(text: "Latest Update", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),
          ),
          SizedBox(height: 20,),
          Column(
            children: List.generate(5, (index) =>
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPageAll()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 187,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Image.asset("assets/images/news_image.png"),
                          SizedBox(width: 20,),
                          Container(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 120,
                                    child: BigText(text: "Dollar goes up 21.3%", size: 26, fontWeight: FontWeight.w600, textAlign: TextAlign.left,)
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today_outlined, size: 24,),
                                    SizedBox(width: 10,),
                                    BigText(text: "20/3/22 - 7:30 AM", size: 13, fontWeight: FontWeight.w500, color: AppColors.textColorSmall,),],
                                ),
                                SizedBox(height: 10,),
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
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
