import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/widget/small_text.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';
import 'cards_color_page.dart';

class AddCardsPage extends StatefulWidget {
  const AddCardsPage({Key? key}) : super(key: key);

  @override
  _AddCardsPageState createState() => _AddCardsPageState();
}

class _AddCardsPageState extends State<AddCardsPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  late bool showSuffix = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumberController = TextEditingController();
    nameController = TextEditingController();
    expiryController = TextEditingController();
    cvvController = TextEditingController();

    cardNumberController.addListener(() {
      if(cardNumberController.text.isEmpty || cardNumberController.text.length < 12){
        showSuffix =false;
      }else{
        showSuffix = true;
      };
      setState(() {});
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
              child: BigText(text: "Add Cards", size: 20, fontWeight: FontWeight.w600,)
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
                    text: "To add a new card, please fill out the fields below carefully in order to add card successfully.",
                    size: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColorSmall,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Card Number" , size: 14, color: AppColors.mainColor, fontWeight: FontWeight.w600,),
                      TextField(
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: showSuffix
                              ? Icon(Icons.check_circle_rounded,  color: AppColors.mainColor, )
                              : null,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(color: Color(0xFFB1B1B1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      BigText(text: "Holder's Name" , size: 14, color: AppColors.mainColor, fontWeight: FontWeight.w600,),
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(color: Color(0xFFB1B1B1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      BigText(text: "Expiry Date" , size: 14, color: AppColors.mainColor, fontWeight: FontWeight.w600,),
                      TextField(
                        controller: expiryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(color: Color(0xFFB1B1B1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      BigText(text: "CVV" , size: 14, color: AppColors.mainColor, fontWeight: FontWeight.w600,),
                      TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(color: Color(0xFFB1B1B1)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CardsColorPage()));
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
