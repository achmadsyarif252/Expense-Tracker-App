// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'chart_bar.dart';
//
// import '../models/latihan.dart';
//
// class Chart extends StatelessWidget {
//   final List<Latihan> recentLatihan;
//   Chart(this.recentLatihan);
//   List<Map<String, Object>> get getGroupedLatihan {
//     return List.generate(7, (index) {
//       final weekDay = DateTime.now().subtract(Duration(days: index));
//       var totalSum = 0.0;
//       for (var i = 0; i < recentLatihan.length; i++) {
//         if (recentLatihan[i].waktu.day == weekDay.day &&
//             recentLatihan[i].waktu.month == weekDay.month &&
//             recentLatihan[i].waktu.year == weekDay.year) {
//           totalSum += recentLatihan[i].jam;
//         }
//       }
//       print(DateFormat.E().format(weekDay));
//       print(totalSum);
//       return {
//         'day': DateFormat.E().format(weekDay).substring(0, 1),
//         'amount': totalSum,
//       };
//     }).reversed.toList();
//   }
//
//   double get totalSpending {
//     return getGroupedLatihan.fold(0, (sum, item) {
//       return sum + (item['jam'] as double);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 6,
//       margin: const EdgeInsets.all(20.0),
//       child: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: getGroupedLatihan.map(
//             (data) {
//               return Flexible(
//                 fit: FlexFit.tight,
//                 child: ChartBar(
//                     data['day'] as String,
//                     data['amount'] as double,
//                     totalSpending == 0.0
//                         ? 0.0
//                         : (data['amount'] as double) / totalSpending),
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }
