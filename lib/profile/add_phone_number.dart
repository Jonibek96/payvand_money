import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';
import '../widget/button_main.dart';
import '../widget/small_text.dart';



class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  _AddPhoneNumberState createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  TextEditingController _phoneEditingController = TextEditingController();
  bool showSuffix = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneEditingController = TextEditingController();
    _phoneEditingController.addListener(() {
      if(_phoneEditingController.text.isEmpty || _phoneEditingController.text.length < 13){
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
                        text: "Phone Number",
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
                    text: "Please add your mobile phone number",
                    size: 16, color: Color(0xFFC4C4C4),),
                ),),
              SizedBox(height: 100,),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: "* Phone Number" , color: showSuffix?AppColors.mainColor:Color(0xFF878787),),
                    TextField(
                     keyboardType: TextInputType.phone,
                      controller: _phoneEditingController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9 \\ +]')),
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(

                        suffixIcon: showSuffix
                            ? Icon(Icons.check_circle_rounded,  color: AppColors.mainColor, )
                            : null,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "+992933031819",
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
              Center(child: ButtonMain(text: "Confirm",))
            ],
          ),
        ),
      );
  }
}
