import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

/*User Info for Dashboard*/
class User {
  String name;
  String UID;
  double balance;
  User({this.name, this.UID, this.balance});
}

final User user1 =
    User(name: "Johnson Su", UID: "527 932 673", balance: 17348.00);

class Transaction {
  String type; //deposit or withdraw
  DateTime dateAndTime;
  double amount;
  Transaction({this.type, this.dateAndTime, this.amount});
}

/*Transaction Info*/
DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss"); // for transactions

List<Transaction> transactions = [
  Transaction(
      type: "Deposit",
      dateAndTime: DateTime.utc(2021, 3, 20, 9, 33, 27),
      amount: 1523.45),
  Transaction(
      type: "Withdraw",
      dateAndTime: DateTime.utc(2021, 3, 12, 15, 27, 05),
      amount: 142.45),
  Transaction(
      type: "Withdraw",
      dateAndTime: DateTime.utc(2021, 3, 10, 1, 20, 09),
      amount: 572.45),
];

/*Graph Data*/

final List<Color> gradientColors = [
  const Color(0xff1AB08D),
  const Color(0xff50EE5E),
  const Color(0xffffffff)
];

LineChartData sampleData() {
  return LineChartData(
    minX: 0.0,
    maxX: 6.0, //one week
    minY: 0.0,
    maxY: 2000.0,
    lineBarsData: mockData(),
    gridData: FlGridData(show: false),
    borderData: FlBorderData(show: false),
    lineTouchData: LineTouchData(handleBuiltInTouches: true),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        margin: 16,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'M';
            case 1:
              return 'T';
            case 2:
              return 'W';
            case 3:
              return 'T';
            case 4:
              return 'F';
            case 5:
              return 'S';
            case 6:
              return 'S';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(
        showTitles: false,
      ),
    ),
  );
}

List<LineChartBarData> mockData() {
  final LineChartBarData data = LineChartBarData(
    spots: [
      FlSpot(0, 500),
      FlSpot(1, 350),
      FlSpot(2, 900),
      FlSpot(3, 700),
      FlSpot(4, 1532),
      FlSpot(5, 1200),
      FlSpot(6, 1700),
    ],
    barWidth: 5,
    isStrokeCapRound: true,
    colors: <Color>[Color(0xff1AB08D)],
    isCurved: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      gradientColorStops: const [0.2, 0.5, 0.95],
      gradientFrom: const Offset(0.5, 0.2),
      gradientTo: const Offset(0.5, 1),
    ),
  );
  return [data];
}
