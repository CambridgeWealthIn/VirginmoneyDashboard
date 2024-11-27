// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class LineGraph extends StatefulWidget {
//   const LineGraph({super.key});

//   @override
//   State<LineGraph> createState() => _LineGraphState();
// }

// class _LineGraphState extends State<LineGraph> {
//   late TrackballBehavior _trackballBehavior;

//   @override
//   void initState() {
//     // Initialize trackball behavior with tooltip settings
//     _trackballBehavior = TrackballBehavior(
//       enable: true,
//       activationMode: ActivationMode.singleTap,
//       lineType: TrackballLineType.vertical,
//       lineWidth: 2,
//       lineColor: Colors.grey.shade400,
//       lineDashArray: const [3, 3],
//       tooltipSettings: const InteractiveTooltip(
//         enable: true,
//         textStyle: TextStyle(
//           color: Colors.black,
//           fontFamily: "Arial",
//           fontSize: 13,
//         ),
//         format: 'point.x : point.y', // Tooltip format
//         color: Colors.white,
//       ),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Line graph');

//     // Dummy Data
//     final List<NiftyGraph> data = [
//       NiftyGraph(date: "2023-01-01", price: 10000),
//       NiftyGraph(date: "2023-02-01", price: 10100),
//       NiftyGraph(date: "2023-03-01", price: 10300),
//       NiftyGraph(date: "2023-04-01", price: 11000),
//       NiftyGraph(date: "2023-05-01", price: 11500),
//       NiftyGraph(date: "2023-06-01", price: 11700),
//       NiftyGraph(date: "2023-07-01", price: 11200),
//       NiftyGraph(date: "2023-08-01", price: 11100),
//       NiftyGraph(date: "2023-09-01", price: 12800),
//       NiftyGraph(date: "2023-10-01", price: 12500),
//       NiftyGraph(date: "2023-11-01", price: 13000),
//     ];

//     double minYValue =
//         data.map((point) => point.price!).reduce((a, b) => a < b ? a : b);
//     double maxYValue =
//         data.map((point) => point.price!).reduce((a, b) => a > b ? a : b);

//     String minDate = data.map((point) => point.date).reduce(
//           (current, next) =>
//               DateTime.parse(current).isBefore(DateTime.parse(next))
//                   ? current
//                   : next,
//         );

//     return Column(
//       children: [
//         Expanded(
//           child: SfCartesianChart(
//             plotAreaBorderColor: Colors.transparent,
//             trackballBehavior:
//                 _trackballBehavior, // Trackball behavior for tooltips

//             primaryXAxis: DateTimeAxis(
//               minimum: DateTime.parse(minDate),
//               maximum: DateTime.now(),
//               desiredIntervals: 11,
//               intervalType: DateTimeIntervalType.months,
//               majorGridLines: const MajorGridLines(color: Colors.transparent),
//               minorTickLines: const MinorTickLines(color: Colors.transparent),
//               majorTickLines: const MajorTickLines(color: Colors.transparent),
//               axisLine: const AxisLine(color: Colors.transparent),
//               labelStyle: const TextStyle(color: Colors.transparent),
//             ),
//             primaryYAxis: NumericAxis(
//               minimum: minYValue,
//               maximum: maxYValue,
//               interval: 1000,
//               majorGridLines: const MajorGridLines(color: Colors.transparent),
//               axisLine: const AxisLine(color: Colors.transparent),
//               majorTickLines:
//                   const MajorTickLines(width: 0, color: Colors.transparent),
//               labelStyle: const TextStyle(color: Colors.transparent),
//             ),
//             series: <CartesianSeries>[
//               SplineAreaSeries<NiftyGraph, DateTime>(
//                 animationDuration: 3000,
//                 borderWidth: 2,
//                 borderColor: Colors.green.shade700,
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.green.shade300.withOpacity(0.3),
//                     Colors.green.shade700,
//                   ],
//                   stops: const [0.1, 1.0],
//                   transform: const GradientRotation(270 * 3.14 / 180),
//                 ),
//                 dataSource: data,
//                 xValueMapper: (NiftyGraph data, _) => DateTime.parse(data.date),
//                 yValueMapper: (NiftyGraph data, _) => data.price,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Dummy Data Model
// class NiftyGraph {
//   final String date;
//   final double? price;

//   NiftyGraph({required this.date, required this.price});
// }

// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';

// // class LineGraph extends StatelessWidget {
// //   const LineGraph({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return  SfCartesianChart(

// //         // title: ChartTitle(text: 'Sales Over Time'),
// //         // legend: Legend(isVisible: true),
// //         tooltipBehavior: TooltipBehavior(enable: true),
// //         primaryXAxis: const CategoryAxis(
// //           majorGridLines: MajorGridLines(color: Colors.transparent, width: 0),
// //           // minorTickLines: const MinorTickLines(color: Colors.transparent),
// //           majorTickLines: MajorTickLines(color: Colors.transparent),
// //           axisLine: AxisLine(color: Colors.transparent, width: 0),
// //           labelStyle: TextStyle(color: Colors.transparent),
// //         ),
// //         primaryYAxis: const NumericAxis(labelFormat: '{value}K',
// //         majorGridLines:  MajorGridLines(color: Colors.transparent, width: 0),
// //           axisLine:  AxisLine(color: Colors.transparent, width: 0),
// //           majorTickLines:
// //                MajorTickLines(width: 0, color: Colors.transparent),
// //           labelStyle:  TextStyle(color: Colors.transparent),
// //         ),
// //         series: <CartesianSeries>[

// //           AreaSeries<SalesData, String>(
// //        gradient:  LinearGradient(
// //             colors: [Colors.green.shade300.withOpacity(0.3),
// //                 Colors.green.shade700,],
// //             stops: const [0.1, 1.0],
// //               transform: const GradientRotation(270 * 3.14 / 180),

// //           ),
// //             name: 'Sales',
// //             dataSource: getChartData(),
// //             xValueMapper: (SalesData sales, _) => sales.year,
// //             yValueMapper: (SalesData sales, _) => sales.sales,
// //             dataLabelSettings: const DataLabelSettings(isVisible: true),

// //           ),
// //         ],

// //     );
// //   }

// //   List<SalesData> getChartData() {
// //     return [
// //       SalesData('2017', 25),
// //       SalesData('2018', 38),
// //       SalesData('2019', 34),
// //       SalesData('2020', 52),
// //       SalesData('2021', 40),
// //     ];
// //   }
// // }

// // class SalesData {
// //   SalesData(this.year, this.sales);
// //   final String year;
// //   final double sales;
// // }

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class LineGraph extends StatelessWidget {
//   // Sample data for the chart
//   final List<ChartData> data1 = [
//     ChartData(1, 35),
//     ChartData(2, 28),
//     ChartData(3, 34),
//     ChartData(4, 32),
//     ChartData(5, 40),
//   ];

//   final List<ChartData> data2 = [
//     ChartData(1, 55),
//     ChartData(2, 48),
//     ChartData(3, 60),
//     ChartData(4, 53),
//     ChartData(5, 70),
//   ];

//   final List<ChartData> data3 = [
//     ChartData(1, 25),
//     ChartData(2, 18),
//     ChartData(3, 22),
//     ChartData(4, 28),
//     ChartData(5, 30),
//   ];

//   LineGraph({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       // color: Colors.pink,
//       // width: 250,
//       // height: 300,
//       child: Expanded(
//         child: SfCartesianChart(
//           primaryXAxis: const CategoryAxis(
//             isVisible: false,
//             majorGridLines: MajorGridLines(color: Colors.transparent),
//             majorTickLines: MajorTickLines(color: Colors.transparent),
//             axisLine: AxisLine(color: Colors.transparent),
//           ),
//           primaryYAxis: const NumericAxis(
//             majorGridLines: MajorGridLines(width: 0),
//             axisLine: AxisLine(width: 0),
//             isVisible: false,
//           ),
//           plotAreaBorderWidth: 0,
//           borderWidth: 0,
//           // legend: Legend(isVisible: true),
//           tooltipBehavior: TooltipBehavior(enable: true),
//           series: <LineSeries<ChartData, int>>[
//             // First line series
//             LineSeries<ChartData, int>(
//               dataSource: data1,
//               xValueMapper: (ChartData data, _) => data.x,
//               yValueMapper: (ChartData data, _) => data.y,
//               name: 'Line 1',
//               markerSettings: const MarkerSettings(isVisible: true),
//             ),
//             // Second line series
//             LineSeries<ChartData, int>(
//               dataSource: data2,
//               xValueMapper: (ChartData data, _) => data.x,
//               yValueMapper: (ChartData data, _) => data.y,
//               name: 'Line 2',
//               markerSettings: const MarkerSettings(isVisible: true),
//             ),
//             // Third line series
//             LineSeries<ChartData, int>(
//               dataSource: data3,
//               xValueMapper: (ChartData data, _) => data.x,
//               yValueMapper: (ChartData data, _) => data.y,
//               name: 'Line 3',
//               markerSettings: const MarkerSettings(isVisible: true),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChartData {
//   final int x;
//   final double y;

//   ChartData(this.x, this.y);
// }




import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class LineGraph extends StatelessWidget {
  // Sample data for three lines
  final List<SparkData> data1 = [
    SparkData(1, 35),
    SparkData(2, 28),
    SparkData(3, 34),
    SparkData(4, 32),
    SparkData(5, 40),
    SparkData(6, 60),
    SparkData(7, 55),
    SparkData(8, 48),
  ];

  final List<SparkData> data2 = [
    SparkData(1, 55),
    SparkData(2, 48),
    SparkData(3, 60),
    SparkData(4, 53),
    SparkData(5, 70),
    SparkData(6, 85),
    SparkData(7, 95),
    SparkData(8, 80),
  ];

  final List<SparkData> data3 = [
    SparkData(1, 25),
    SparkData(2, 18),
    SparkData(3, 22),
    SparkData(4, 28),
    SparkData(5, 30),
    SparkData(6, 35),
    SparkData(7, 40),
    SparkData(8, 45),
  ];

  @override
  Widget build(BuildContext context) {
    return 
             SfSparkLineChart(
                      trackball: const SparkChartTrackball(),
                      marker: const SparkChartMarker(
                          borderWidth: 3,
                          displayMode: SparkChartMarkerDisplayMode.all,
                          color: Colors.blue),
                      axisLineWidth: 0,
                      data: const <double>[
                        5,
                        6,
                        5,
                        7,
                        4,
                        3,
                        9,
                 
                        8
                      ],
                    
                   
              
                     
             
                         // Second sparkline chart
                         // Container(
                         //   padding: EdgeInsets.symmetric(vertical: 8.0),
                         //   child: SfSparkLineChart(
                         //     data: data2,
                         //     xValueMapper: (SparkData data, _) => data.x,
                         //     yValueMapper: (SparkData data, _) => data.y,
                         //     lineWidth: 2,
                         //     color: Colors.green, // Line color for the second chart
                         //   ),
                         // ),
                         // // Third sparkline chart
                         // Container(
                         //   padding: EdgeInsets.symmetric(vertical: 8.0),
                         //   child: SfSparkLineChart(
                         //     data: data3,
                         //     xValueMapper: (SparkData data, _) => data.x,
                         //     yValueMapper: (SparkData data, _) => data.y,
                         //     lineWidth: 2,
                         //     color: Colors.red, // Line color for the third chart
                         //   ),
                         // ),
             );
          
    
  }
}

// Data model for the sparkline chart
class SparkData {
  final int x;
  final double y;

  SparkData(this.x, this.y);
}
