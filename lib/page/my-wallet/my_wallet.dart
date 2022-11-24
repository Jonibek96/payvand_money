import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/my_wallet_products.dart';
import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
            child: BigText(text: "My Wallet", size: 20, fontWeight: FontWeight.w600,)
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
              margin: EdgeInsets.only(left: 40),
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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Current Balance", size: 18, color: AppColors.textColorSmall,),
                  SizedBox(height: 10,),
                  BigText(text: "\$2,85,856.20", size: 35, color: AppColors.mainColor, fontWeight: FontWeight.w700,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 10,
                    spacing: 10,
                    children: my_walletItem.map((e) => Container(
                      width: 109,
                      height: 112,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF000000).withOpacity(0.08),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0,4)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(e.icons),
                          SizedBox(height: 10,),
                          Text(e.title, style: TextStyle(fontSize: 12, color: Color(0xFF001A4D), fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )).toList()
                    )
              ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "My Cards", size: 18, fontWeight: FontWeight.w600, color: AppColors.textColor,),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add_circle_outline, color: AppColors.mainColor,)
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 310,
              height: 171,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Color(0xFF8CD9E9),
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
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
