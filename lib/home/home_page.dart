import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/home/page/activity_page.dart';
import 'package:payvand_money/home/page/card_details_page.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';
import 'package:payvand_money/widget/small_text.dart';

import '../page/my-wallet/my_wallet.dart';
import '../page/statistics/statistics.dart';
import '../profile/profile_settings_page.dart';
import 'history/history_page.dart';
import 'notification/notification.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectPageIndex = 0;
  List<Widget> _page = [
    HomePageState(),
    CardDetailsPage(),
    ActivityPage(),
    ProfileSettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: selectPageIndex == 0 ? AppBar(
        toolbarHeight: 45,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
              onPressed: (){
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black,)
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                    },
                    icon: Icon(Icons.notifications_none, color: Colors.black,)
                ),
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
                    },
                    icon: Icon(Icons.history_toggle_off, color: Colors.black,)
                ),
              ],
            ),
          ),
        ],
      ): null,
      drawer: Drawer(
        //elevation: 0,
        backgroundColor: Colors.transparent,
        width: 297,
        child: Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                decoration:BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                ) ,
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/profile-image.png"),
                          BigText(text: "William Simmit", size: 24, fontWeight: FontWeight.w600, color: AppColors.textColor,),
                          SmallText(text: "william.smith@gmail.com", size: 16, color: Color(0xFF838080))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyWallet()));
                          },
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset("assets/icons/wallet.png"),
                          title: BigText(text: "My Wallet", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColor,),
                        ),
                        ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset("assets/icons/user_2.png"),
                          title: BigText(text: "Profile", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColor,),
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Statistics()));
                          },
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset("assets/icons/chart.png"),
                          title: BigText(text: "Statistics", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColor,),
                        ),
                        ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset("assets/icons/transfer.png"),
                          title: BigText(text: "Transfer", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColor,),
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
                          },
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.settings, color: AppColors.iconColor1,),
                          title: BigText(text: "Settings", size: 18, fontWeight: FontWeight.w500, color: AppColors.textColor,),
                        ),
                      ],
                    ),
                    SizedBox(height: 130,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/logout.png"),
                              SizedBox(width: 10,),
                              Text(
                                "Log out",
                                style: TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          elevation: 1,
                          primary: AppColors.mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

      ),
      body: _page[selectPageIndex],
      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.center,
        color: Colors.transparent,
         margin: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Container(
            height: 70,
            margin: EdgeInsets.only(top: 13),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 5,
                    offset: Offset(0,1)
                ),]
            ),
            ),
            BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/home.png", color: AppColors.iconColor1,),
                  activeIcon: Container(
                      width: 44,
                      height: 59,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          color: AppColors.mainColor
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/icons/home.png", color: Colors.white,),
                      )
                  ),
                  label: "Главная",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/wallet.png", color: AppColors.iconColor1,),
                  label: "Главная",
                  activeIcon: Container(
                      width: 44,
                      height: 59,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          color: AppColors.mainColor
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/icons/wallet.png", color: Colors.white,),
                      )
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/chart.png", color: AppColors.iconColor1,),
                  label: "Главная",
                  activeIcon: Container(
                      width: 44,
                      height: 59,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          color: AppColors.mainColor
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/icons/chart.png", color: Colors.white,),
                      )
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/user_2.png", color: AppColors.iconColor1,),
                  label: "Главная",
                  activeIcon: Container(
                      width: 44,
                      height: 59,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          color: AppColors.mainColor
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/icons/user_2.png", color: Colors.white,),
                      )
                  ),
                ),
              ],
              currentIndex: selectPageIndex,
              onTap: (index){
                setState(() {
                  selectPageIndex = index;
                  // if(index == 1){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailsPage()));
                  // }
                });
              },
            ),
          ]
        ),
      )
    );
  }
}

class HomePageState extends StatefulWidget {
  const HomePageState({Key? key}) : super(key: key);

  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 20),
            //physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(5, (index) => Container(
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
                ),)
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Incoming Transaction", size: 18, color: AppColors.textColorSmall,),
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
          SizedBox(height: 10,),
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 20),
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(5, (index) =>
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 20),
                      width: 157,
                      height: 198,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/mask1.png")
                        ),
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  child: Image.asset("assets/images/person.png")
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.south_west, size: 16, color: AppColors.iconColor1,),
                                  BigText(text: "+\$54.23" ,size: 16, color: AppColors.iconColor1,)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          SmallText(text: "From", size: 10,),
                          BigText(text: "Johny", size: 12,),
                          BigText(text: "Bairstow", size: 12,),
                          Spacer(),
                          SmallText(text: "12 December 2020", size: 12,)

                        ],
                      ),
                    ),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Outgoing Transaction", size: 18, color: AppColors.textColorSmall,),
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
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 20),
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(5, (index) =>
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 20),
                      width: 157,
                      height: 198,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/mask3.png")
                        ),
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  child: Image.asset("assets/images/person.png")
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(CupertinoIcons.arrow_up_right, size: 16, color: AppColors.textColorBig, ),
                                  BigText(text: "+\$54.23" ,size: 16, color: AppColors.textColorBig, fontWeight: FontWeight.w700,)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          SmallText(text: "From", size: 10,),
                          BigText(text: "Johny", size: 12,),
                          BigText(text: "Bairstow", size: 12,),
                          Spacer(),
                          SmallText(text: "12 December 2020", size: 12,)

                        ],
                      ),
                    ),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Other Transaction", size: 18, color: AppColors.textColorSmall,),
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
          Container(
            width: 308,
            height: 79,
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
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
                    BigText(text: "23 December 2020", size: 10,),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(CupertinoIcons.arrow_up_right, color: AppColors.textColorBig, size: 16,),
                    SizedBox(height: 10,),
                    BigText(text: "-\$396.84", size: 16, color: AppColors.textColorBig, fontWeight: FontWeight.w700, ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
