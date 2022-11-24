import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';
import '../widget/button_main.dart';
import '../widget/small_text.dart';

class SetPinCode extends StatefulWidget {
  const SetPinCode({Key? key}) : super(key: key);

  @override
  _SetPinCodeState createState() => _SetPinCodeState();
}

class _SetPinCodeState extends State<SetPinCode> {
  List<int> firstRow =[1,2,3], secondRow=[4,5,6], thirdRow=[7,8,9];
  int pinLength = 5;
  String pinEntered = '';
  String workingPin = '12345';
  bool colorNumber = false;
  numberClicked(int item){
    pinEntered = pinEntered + item.toString();
    //colorNumber = true;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 63,
                  height: 42,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: BigText(
                    text: "Set Pin Code",
                    size: 20, fontWeight:
                  FontWeight.w600,),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child:SizedBox(
                width: 160,
                child: SmallText(
                  overflow: TextOverflow.clip,
                  text: "Please set your own Pin Code",
                  size: 16, color: Color(0xFFC4C4C4),),
              ),),
            SizedBox(height: 30,),
            Center(
              child:SizedBox(
                width: 170,
                child: SmallText(
                  overflow: TextOverflow.clip,
                  text: "Set Pin Code (5-digit)",
                  size: 14, color: Color(0xFFC4C4C4),),
              ),),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        (pinEntered.length >=1)
                            ? Icon(Icons.circle, color: AppColors.mainColor,)
                            : Icon(Icons.circle_outlined, color: AppColors.textColorSmall,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        (pinEntered.length >=2)
                            ? Icon(Icons.circle, color: AppColors.mainColor,)
                            : Icon(Icons.circle_outlined, color: AppColors.textColorSmall,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        (pinEntered.length >=3)
                            ? Icon(Icons.circle, color: AppColors.mainColor,)
                            : Icon(Icons.circle_outlined, color: AppColors.textColorSmall,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        (pinEntered.length >=4)
                            ? Icon(Icons.circle, color: AppColors.mainColor,)
                            : Icon(Icons.circle_outlined, color: AppColors.textColorSmall,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        (pinEntered.length >=5)
                            ? Icon(Icons.circle, color: AppColors.mainColor,)
                            : Icon(Icons.circle_outlined, color: AppColors.textColorSmall,)
                      ],
                    ),
                   ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              //margin: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: firstRow.map((e) => _numberButton(e)).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: secondRow.map((e) => _numberButton(e)).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: thirdRow.map((e) => _numberButton(e)).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset("assets/images/face.png"),
                      ),
                      _numberButton(0),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Image.asset("assets/images/fingerprint.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(child: ButtonMain(text: "Set",))
          ],
        ),
      ),
    );
  }

  Widget _numberButton(int item) {
    return InkWell(
      onTap: (){
        numberClicked(item);
        setState(() {
          colorNumber = !colorNumber;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            //color: colorNumber ? AppColors.mainColor: Colors.transparent,
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle
                          ),
                          child: Center(child: BigText(text: item.toString(), size: 20,)),
                        ),
      ),
    );
  }
}
