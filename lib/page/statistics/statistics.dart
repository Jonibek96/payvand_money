import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_colors.dart';
import '../../widget/big_text.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}
class _StatisticsState extends State<Statistics> {
  final  _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime today = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  int currentMonth = 0;
  void _onDaySelected(DateTime day, DateTime focusDay){
    setState(() {
      today = day;
      currentMonth = day.month -1;
    });
  }
  List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _dialogCalendar(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 0,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder:
          (context, setState){
            return Container(
                height: 500,
                padding: const EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 30,
                        child: Divider(
                          thickness: 5,
                          color: Color(0xFFB2B2B2),
                        ),
                      ),
                    ),
                    TableCalendar(
                      locale: "en_US",
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(1995, 10 ,16),
                      lastDay: DateTime(2025, 3, 14),
                      availableGestures: AvailableGestures.all,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      sixWeekMonthsEnforced: true,
                      calendarFormat: format,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        headerMargin: EdgeInsets.all(10),
                      ),
                      selectedDayPredicate: (DateTime day) {
                        return isSameDay(day, today);
                      },
                      onDaySelected: (day, focusDay) {
                        setState(() {
                          _onDaySelected(day, focusDay);
                        });
                      }
                    )
                  ],
                ));
          });
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
              child: BigText(text: "Statistics", size: 20, fontWeight: FontWeight.w600,)
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _dialogCalendar(context);
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 10,),
                    BigText(text: "${today.day} ${months[currentMonth]} ${today.year} - ${today.day} ${months[currentMonth]} ${today.year}", size: 16, fontWeight: FontWeight.w500,),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 -30,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
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
                        Icon(Icons.south_west, size: 24, color: AppColors.iconColor1,),
                        BigText(text: "Income", size: 18, color: AppColors.iconColor1, fontWeight: FontWeight.w700,),
                        BigText(text: "\$ 5,000", size: 24, color: AppColors.iconColor1, fontWeight: FontWeight.w700,),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
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
                        Icon(CupertinoIcons.arrow_up_right, size: 24, color: AppColors.textColorBig, ),
                        BigText(text: "Expense", size: 18, color: AppColors.mainColor, fontWeight: FontWeight.w700,),
                        BigText(text: "\$ 1000", size: 24, color: AppColors.mainColor, fontWeight: FontWeight.w700,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              LineChartSample2(),
              SizedBox(height: 20,),
              BigText(text: "Highest Expense", size: 16, fontWeight: FontWeight.w600,),
              SizedBox(height: 20,),
              Column(
                children: List.generate(5, (index) => Container(
                  height: 76,
                  margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.08),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0,4)
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/person.png", width: 46, height: 46,),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "Transfer to Alex", size: 16, fontWeight: FontWeight.w600,),
                          SizedBox(height: 5,),
                          BigText(text: "15th March, 2021", size: 12, fontWeight: FontWeight.w400,)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(CupertinoIcons.arrow_up_right, size: 24, color: AppColors.textColorBig, ),
                          SizedBox(height: 10,),
                          BigText(text: "-\$96.84", size: 16, fontWeight: FontWeight.w700, textAlign: TextAlign.right, color: AppColors.textColorBig,)
                        ],
                      )
                    ],
                  ),
                )
                ),
              )
            ],
          ),
        )
    );
  }
}
class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff8EDFEB).withOpacity(0.6),
    const Color(0xff8EDFEB).withOpacity(0.58),
    const Color(0xff8EDFEB).withOpacity(0.45),
    const Color(0xff8EDFEB).withOpacity(0.38),
    const Color(0xff8EDFEB).withOpacity(0.25),
    const Color(0xff8EDFEB).withOpacity(0.15),
    const Color(0xff8EDFEB).withOpacity(0.1),
  ];
  List<Color> gradientColors1 = [
    const Color(0xff8EDFEB),
    const Color(0xff8EDFEB),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.10,
          child: Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.08),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0,4)
                )
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                top: 50,
                bottom: 10,
              ),
              child: LineChart(
                 mainData(),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BigText(text: "Expenses Trends", size: 18, fontWeight: FontWeight.w700,)
          ,
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('20', style: style);
        break;
      case 7:
        text = const Text('21', style: style);
        break;
      case 12:
        text = const Text('22', style: style);
        break;
      case 17:
        text = const Text('23', style: style);
        break;
      case 22:
        text = const Text('24', style: style);
        break;
      case 27:
        text = const Text('24', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Container(
      alignment: Alignment.center,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '\$ 500';
        break;
      case 3:
        text = '\$ 1000';
        break;
      case 5:
        text = '\$ 2000';
        break;
      case 7:
        text = '\$ 2000';
        break;
      case 9:
        text = '\$ 2000';
        break;
      default:
        return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 10),
        child: Text(text, style: style, textAlign: TextAlign.left)
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 50,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 45,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: AppColors.mainColor),
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 8.5),
            FlSpot(1, 7.85),
            FlSpot(1.1, 6.85),
            FlSpot(2.4, 4),
            FlSpot(5, 6),
            FlSpot(8, 2),
            FlSpot(10, 3),
            FlSpot(13, 5),
            FlSpot(16, 4),
            FlSpot(18.5, 2.5),
            FlSpot(21.5, 6),
            FlSpot(25, 4.2),
            FlSpot(30, 7),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors1,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.center,
              end: Alignment.bottomCenter
            ),
          ),
        ),
      ],
    );
  }

}