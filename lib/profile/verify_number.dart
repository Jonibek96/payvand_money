import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';
import '../widget/button_main.dart';
import '../widget/small_text.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({Key? key}) : super(key: key);

  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  TextEditingController _verifyEditingController = TextEditingController();
  bool showSuffix = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyEditingController = TextEditingController();
    _verifyEditingController.addListener(() {
      if(_verifyEditingController.text.isEmpty || _verifyEditingController.text.length < 5){
        showSuffix = false;
      }else{
        showSuffix = true;
      }
      setState(() {

      });
    });
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
                    text: "Verify your Number",
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
                  text: "Please verify your Phone Number",
                  size: 16, color: Color(0xFFC4C4C4),),
              ),),
            SizedBox(height: 100,),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "Enter Verification Code (5-digit)" , color: showSuffix?AppColors.mainColor:Color(0xFF878787),),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _verifyEditingController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      //FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(

                      suffixIcon: showSuffix
                          ? Icon(Icons.check_circle_rounded,  color: AppColors.mainColor, )
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "54321",
                      hintStyle: TextStyle(color: Color(0xFFB1B1B1)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.mainColor)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(child: ButtonMain(text: "Verify",))
          ],
        ),
      ),
    );
  }
}
