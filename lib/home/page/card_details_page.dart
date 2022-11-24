import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/page/add_cards_page.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';
import 'package:payvand_money/widget/small_text.dart';

class CardDetailsPage extends StatefulWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        titleSpacing: 10,
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: 10),
            child: BigText(text: "Card Details", size: 20, fontWeight: FontWeight.w600,)
        ),
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            SingleChildScrollView(
              padding: EdgeInsets.only(right: 20),
              //physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(5, (index) =>
                      Container(
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 307,
                              height: 80,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(20)
                                  ),
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/group8.png",) ,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "VISA",size: 12, color: Colors.black, ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      BigText(text: "Master Card",size: 12, color: AppColors.textColorSmall, ),
                                      SizedBox(width: 10,),
                                      Icon(Icons.circle, size: 5, color: AppColors.textColorSmall,),
                                      BigText(text: "  6253",size: 12, color: AppColors.textColorSmall, ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              BigText(text: "\$2,85,856.20", size: 14, color: AppColors.mainColor, fontWeight: FontWeight.w700,),
                            ],
                    ),
                            ),
                            Positioned(
                                right: 15,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color:AppColors.mainColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: Icon(Icons.check, color: Colors.white, size: 15,),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                  )
              ),
            ),
            SizedBox(height:20,),
            Container(
              width: 300,
              height: 64,
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                //color: Color(0xFFF7F5F5).withOpacity(0.8),
                color: Colors.black12.withOpacity(0.08),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 96,
                    height: 46,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "USD", size: 14, color: Colors.white,),
                            Icon(Icons.south_west, color: Colors.white, size: 14,)
                          ],
                        ),
                        SmallText(text: "72.26", size: 12, color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    width: 96,
                    height: 46,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.iconColor1,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Euro", size: 14, color: Colors.white,),
                            Icon(CupertinoIcons.arrow_up_right, color: Colors.white, size: 14,)
                          ],
                        ),
                        SmallText(text: "34.26", size: 12, color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    width: 96,
                    height: 46,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.iconColor1,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Yen", size: 14, color: Colors.white,),
                            Icon(CupertinoIcons.arrow_up_right, color: Colors.white, size: 14,)
                          ],
                        ),
                        SmallText(text: "72.26", size: 12, color: Colors.white,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text(
                  "Add Card",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardsPage()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  elevation: 1,
                  primary: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Cash Back", size: 18, fontWeight: FontWeight.w500, color: Color(0xFF878787),),
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
            ),
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
      )
    );
  }
}
