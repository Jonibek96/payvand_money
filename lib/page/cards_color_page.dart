import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';

class CardsColorPage extends StatefulWidget {
  const CardsColorPage({Key? key}) : super(key: key);

  @override
  _CardsColorPageState createState() => _CardsColorPageState();
}

class _CardsColorPageState extends State<CardsColorPage> {
  Color cardBackgroundColor = Color(0xFF8CD9E9);
  List<Color> colors = [
    Color(0xFF8CD9E9),
    Color(0xFF34A853),
    Color(0xFF0166FF),
    Color(0xFFF59D31),
    Color(0xFFFC6020),
    Color(0xFF009CDE),
    Color(0xFFE80B26),
    Color(0xFFFBBC05),
    Color(0xFF979797),
    Color(0xFF1E1E1E),
    Color(0xFF000000),
    Color(0xFF003087),
    Color(0xFF001A4D),
    Color(0xFF392993),
    Color(0xFF6875E2),
    Color(0xFFFFFFFF),
  ];
  void changeColor(Color changeToColor) {
    setState(() {
      cardBackgroundColor = changeToColor;
    });
  }
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
              child: BigText(text: "Card Color", size: 20, fontWeight: FontWeight.w600,)
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(right: 50),
                child: BigText(
                  text: "Please, select a color to differentiat this card from other cards you have attached and organize your cards better.",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColorSmall,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 310,
                height: 171,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  //color: Color(0xFF8CD9E9),
                  color: cardBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF001A4D).withOpacity(0.15),
                      blurRadius: 15,
                      spreadRadius: 0,
                      offset: Offset(0,4)
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/images/card_vec.png"),
                    fit: BoxFit.fitWidth
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Jonibek", size: 12, fontWeight: FontWeight.w500, color: Colors.white,),
                            BigText(text: "A Debit Card", size: 12, fontWeight: FontWeight.w500, color: Colors.white,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "2423 3521 9503 2412", size: 16, fontWeight: FontWeight.w700, color: Colors.white,),
                            BigText(text: "21/25", size: 16, fontWeight: FontWeight.w700, color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Your balance", size: 12, fontWeight: FontWeight.w500, color: Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "\$3,100.30", size: 22, fontWeight: FontWeight.w700, color: Colors.white,),
                            BigText(text: "Visa", size: 12, fontWeight: FontWeight.w500, color: Colors.white,),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Stack(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 30,
                      runSpacing: 20,
                      children: colors.map((e){
                        return GestureDetector(
                          onTap: (){
                            changeColor(e);
                            },
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                                color: e,
                                shape: BoxShape.circle
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      right: 25,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: (){
                          showDialog(
                              context: context,
                               builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Pick Color"),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: cardBackgroundColor,
                                      onColorChanged: (Color color){
                                        setState(() {
                                          cardBackgroundColor = color;
                                        });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        child: Text(
                                          "Done",
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          elevation: 1,
                                          primary: AppColors.mainColor,

                                        ),
                                      ),
                                    ),
                                  ],
                                );
                               }
                          );
                        },
                        child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0,2)
                            )
                          ]
                  ),
                          child: Icon(Icons.add_circle_outline, color: AppColors.mainColor,),
                ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => CardsColorPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    elevation: 1,
                    primary: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
