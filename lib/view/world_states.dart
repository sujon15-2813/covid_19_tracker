// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            PieChart(
              dataMap: {"Total": 20, "Recover": 15, "death": 5},
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: LegendOptions(legendPosition: LegendPosition.left),
              animationDuration: Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .06),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                    ReusableRow(title: 'Total', value: '200'),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff1aa260),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text('Track Countries'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
