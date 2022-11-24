import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/utils/app_colors.dart';
import 'package:payvand_money/widget/small_text.dart';

import 'big_text.dart';
import 'button_main.dart';

class ExpPin extends StatefulWidget {
  const ExpPin({Key? key}) : super(key: key);

  @override
  _ExpPinState createState() => _ExpPinState();
}

class _ExpPinState extends State<ExpPin> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 10];
  var inputText = '';
  var actives = [false, false, false, false, false];
  var clears = [false, false, false, false, false];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 63,
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 200,
                    alignment: Alignment.center,
                    child: BigText(
                      text: "Set Pin Code",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 160,
                child: SmallText(
                  overflow: TextOverflow.clip,
                  text: "Please set your own Pin Code",
                  size: 16,
                  color: Color(0xFFC4C4C4),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 170,
                child: SmallText(
                  overflow: TextOverflow.clip,
                  text: "Set Pin Code (5-digit)",
                  size: 14,
                  color: Color(0xFFC4C4C4),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < actives.length; i++)
                      AnimationBoxItem(
                        clear: clears[i],
                        active: actives[i],
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                primary: false,
                padding: EdgeInsets.all(20),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8 / 0.6,
                ),
                itemBuilder: (context, index) => Container(
                  //margin: EdgeInsets.all(20),
                  color: Colors.transparent,
                  child: Center(
                    child: index == 9 || index == 11
                        ? index == 9
                            ? Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                    child:
                                        Image.asset("assets/images/face.png")),
                              )
                            : Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Center(
                                    child: Image.asset(
                                        "assets/images/fingerprint.png")),
                              )
                        : MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              // if (index == 11) {
                              //   inputText = inputText.substring(
                              //       0, inputText.length - 1);
                              //   clears = clears.map((e) => false).toList();
                              //   setState(() {
                              //     currentIndex--;
                              //     clears[currentIndex] = true;
                              //     actives[currentIndex] = false;
                              //   });
                              //   return;
                              // } else
                              inputText +=
                                  numbers[index == 10 ? index - 1 : index]
                                      .toString();
                              if (inputText.length == 6) {
                                setState(() {
                                  clears = clears.map((e) => true).toList();
                                  actives = actives.map((e) => false).toList();
                                });
                                inputText = "";
                                currentIndex = 0;
                                return;
                              }
                              clears = clears.map((e) => false).toList();
                              setState(() {
                                actives[currentIndex] = true;
                                currentIndex++;
                              });
                            },
                            splashColor: AppColors.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                            color: Colors.white,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Text(
                                  "${numbers[index == 10 ? index - 1 : index]}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            )),
                  ),
                ),
                itemCount: 12,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Center(
                  child: ButtonMain(
                text: "Set",
              )),
            )
          ],
        ),
      ),
    );
  }
}

class AnimationBoxItem extends StatefulWidget {
  final clear;
  final active;

  const AnimationBoxItem({Key? key, this.clear = false, this.active = false})
      : super(key: key);

  @override
  _AnimationBoxItemState createState() => _AnimationBoxItemState();
}

class _AnimationBoxItemState extends State<AnimationBoxItem>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Container(
              margin: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textColorSmall),
                        shape: BoxShape.circle,
                        color:
                            widget.active ? AppColors.mainColor : Colors.white),
                  )
                ],
              ),
            ));
  }
}
