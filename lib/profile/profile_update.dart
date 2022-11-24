

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';
import 'package:payvand_money/widget/small_text.dart';

import '../widget/button_main.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

    late bool showSuffix1 = false;
    late bool showSuffix2 = false;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();

    _firstNameController.addListener(() {
      if(_firstNameController.text.isEmpty || _firstNameController.text.length < 2){
        showSuffix1 =false;
      }else{
        showSuffix1 = true;
      };
      setState(() {});
    });
    _lastNameController.addListener(() {
      if(_lastNameController.text.isEmpty || _lastNameController.text.length < 2){
        showSuffix2 = false;
      }else{
        showSuffix2 = true;
      }
      setState(() {});
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();

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
                   child: BigText(text: "Profile", size: 20, fontWeight: FontWeight.w600),
                 ),
               ],
             ),
             SizedBox(height: 30,),
             Center(child:SmallText(text: "Please set up your profile", size: 16, color: Color(0xFFC4C4C4),),),
             SizedBox(height: 20,),
             Center(
               child: Container(
                 width: 134,
                 height: 134,
                 child: CircleAvatar(
                   radius: 70,
                   backgroundColor: AppColors.mainColor,
                   child: Icon(Icons.ios_share, color: Colors.white,),
                 )
               ),
             ),
             SizedBox(height: 50,),
             Container(
             padding: EdgeInsets.all(20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SmallText(text: "First name" , color: showSuffix1?AppColors.mainColor:Color(0xFF878787),),
                 TextField(
                   controller: _firstNameController,
                   decoration: InputDecoration(
                     suffixIcon: showSuffix1
                         ? Icon(Icons.check_circle_rounded,  color: AppColors.mainColor, )
                         : null,
                     floatingLabelBehavior: FloatingLabelBehavior.always,
                     hintText: "Micheil",
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
             Container(
             padding: EdgeInsets.all(20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SmallText(text: "Last name" , color: showSuffix2?AppColors.mainColor:Color(0xFF878787),),
                 TextField(
                   controller: _lastNameController,
                   decoration: InputDecoration(
                     suffixIcon: showSuffix2
                         ? Icon(Icons.check_circle_rounded,  color: AppColors.mainColor, )
                         : null,
                     floatingLabelBehavior: FloatingLabelBehavior.always,
                     hintText: "Starc",
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
             Center(child: ButtonMain(text: "Set",))
           ],
         ),
       ),
    );
  }
}
