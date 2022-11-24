
import 'dart:io';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../widget/big_text.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
   PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
   bool _switchValue=true;
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
              child: BigText(text: "Profile Settings", size: 20, fontWeight: FontWeight.w600,)
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Center(
                child: BigText(text: "Your Profile Information", size: 18, color: AppColors.textColorSmall,),
              ),
              SizedBox(height: 20,),
              Center(
                child: Stack(
                  children: [
                    _imageFile == null
                    ?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    )
                    :CircleAvatar(
                      radius: 64,
                      backgroundImage:FileImage(File(_imageFile!.path))
                    ),
                    Positioned(
                      bottom: 10,
                        right: 5,
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet())
                            );
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              shape: BoxShape.circle
                            ),
                            child: Image.asset("assets/icons/add_image.png"),
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              BigText(text: "Personal Information", size: 22, fontWeight: FontWeight.w700, color: Color(0xFF5164BF).withOpacity(0.8),),
              SizedBox(height: 10,),
              buildContainer("Account Number", "12512154"),
              buildContainer("Email", "jonibek@gmail.com"),
              buildContainer("Mobile Phone", "12512154"),
              buildContainer("Address", "12512154"),
              SizedBox(height: 10,),
              BigText(text: "Security", size: 22, fontWeight: FontWeight.w700, color: Color(0xFF5164BF).withOpacity(0.8),),
              SizedBox(height: 10,),
              Container(
              height: 38,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 20,),
              decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Change Pin", size: 12, color: AppColors.mainColor, fontWeight: FontWeight.w500,),
                  Icon(Icons.arrow_forward_ios, color:Color(0xFF001A4D).withOpacity(0.4)),
                ],
              ),
            ),
              Container(
                height: 38,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 20,),
                decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Change Password", size: 12, color: AppColors.mainColor, fontWeight: FontWeight.w500,),
                    Icon(Icons.arrow_forward_ios, color:Color(0xFF001A4D).withOpacity(0.4)),
                  ],
                ),
              ),
              Container(
                height: 38,
                padding: EdgeInsets.symmetric(horizontal: 20,),
                decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Change Password", size: 12, color: AppColors.mainColor, fontWeight: FontWeight.w500,),
                    CupertinoSwitch(
                      activeColor: AppColors.mainColor,
                      trackColor: Color(0xFF001A4D).withOpacity(0.4),
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              BigText(text: "Other", size: 22, fontWeight: FontWeight.w700, color: Color(0xFF5164BF).withOpacity(0.8),),
            ],
          ),
        )
    );
  }

  Container buildContainer(String suffix, String prefix) {
    return Container(
              height: 38,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 20,),
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: suffix, size: 12, color: AppColors.mainColor, fontWeight: FontWeight.w500,),
                  BigText(text: prefix, size: 12, color: Color(0xFF001A4D).withOpacity(0.4), fontWeight: FontWeight.w400,),
                ],
              ),
            );
  }
   void takePhoto(ImageSource source) async {
     final pickedFile = await _picker.getImage(source: source);
     setState(() {
       _imageFile = pickedFile;
     });
   }
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          BigText(text: "Choose profile photo", size: 20,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: (){
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")
              ),
              TextButton.icon(
                  onPressed: (){
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallery")
              ),
            ],
          )

        ],
      ),
    );
  }
}
