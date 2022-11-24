import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/big_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.15,
                  motion: BehindMotion(),
                  children: [
                    SlidableAction(
                        onPressed: (context){},
                        icon: Icons.delete_forever_rounded,
                        foregroundColor: Colors.red,
                        autoClose: true,
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                    )
                  ],
                ),
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.08),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(0,4)
                      )
                    ],
                  ),
                  child: BigText(text: "money money", size: 24, color: AppColors.textColor,),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
