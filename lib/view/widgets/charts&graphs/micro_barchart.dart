import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MicroBarchart extends StatefulWidget {
  const MicroBarchart({super.key});

  @override
  State<MicroBarchart> createState() => _MicroBarchartState();
}

class _MicroBarchartState extends State<MicroBarchart> {
  List<_SalesData> dateTimeChartData = <_SalesData>[
    _SalesData(xval: DateTime(2018, 0), yval: 4),
    _SalesData(xval: DateTime(2018, 0, 2), yval: 4.5),
    _SalesData(xval: DateTime(2018, 0, 3), yval: 8),
    _SalesData(xval: DateTime(2018, 0, 4), yval: 7),
    _SalesData(xval: DateTime(2018, 0, 5), yval: 6),
    _SalesData(xval: DateTime(2018, 0, 8), yval: 8),
    _SalesData(xval: DateTime(2018, 0, 9), yval: 8),
    _SalesData(xval: DateTime(2018, 0, 10), yval: 6.5),
    _SalesData(xval: DateTime(2018, 0, 11), yval: 4),
    _SalesData(xval: DateTime(2018, 0, 12), yval: 5.5),
    _SalesData(xval: DateTime(2018, 0, 15), yval: 8),
    _SalesData(xval: DateTime(2018, 0, 16), yval: 6),
    _SalesData(xval: DateTime(2018, 0, 17), yval: 6.5),
    _SalesData(xval: DateTime(2018, 0, 18), yval: 7.5),
    _SalesData(xval: DateTime(2018, 0, 19), yval: 7.5),
    _SalesData(xval: DateTime(2018, 0, 22), yval: 4),
    _SalesData(xval: DateTime(2018, 0, 23), yval: 8),
    _SalesData(xval: DateTime(2018, 0, 24), yval: 6),
    _SalesData(xval: DateTime(2018, 0, 25), yval: 7.5),
    _SalesData(xval: DateTime(2018, 0, 26), yval: 4.5),
    _SalesData(xval: DateTime(2018, 0, 29), yval: 6),
    _SalesData(xval: DateTime(2018, 0, 30), yval: 5),
    _SalesData(xval: DateTime(2018, 0, 31), yval: 7),
  ];
  List<_SalesData> numericdata = <_SalesData>[
    _SalesData(xval: 1, yval: 190),
    _SalesData(xval: 2, yval: 165),
    _SalesData(xval: 3, yval: 158),
    _SalesData(xval: 4, yval: 175),
    _SalesData(xval: 5, yval: 200),
    _SalesData(xval: 6, yval: 180),
    _SalesData(xval: 7, yval: 210),
  ];
  List<_SalesData> categorydata = <_SalesData>[
    _SalesData(xval: 'Robert', yval: 60),
    _SalesData(xval: 'Andrew', yval: 65),
    _SalesData(xval: 'Suyama', yval: 70),
    _SalesData(xval: 'Michael', yval: 80),
    _SalesData(xval: 'Janet', yval: 55),
    _SalesData(xval: 'Davolio', yval: 90),
    _SalesData(xval: 'Fuller', yval: 75),
    _SalesData(xval: 'Nancy', yval: 85),
    _SalesData(xval: 'Margaret', yval: 77),
    _SalesData(xval: 'Steven', yval: 68),
    _SalesData(xval: 'Laura', yval: 96),
    _SalesData(xval: 'Elizabeth', yval: 57)
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SfSparkBarChart.custom(
            axisLineWidth: 0,
            dataCount: 7,
            xValueMapper: (int index) => numericdata[index].xval,
            yValueMapper: (int index) => numericdata[index].yval!,
            trackball: SparkChartTrackball(
                tooltipFormatter: (TooltipFormatterDetails details) {
              final String labelText = '${details.x} : \$${details.y}';
              return labelText;
            })));
    //------------------
    // Expanded(
    //   child: SfSparkBarChart.custom(
    //     axisLineWidth: 0,
    //     dataCount: 23,
    //     xValueMapper: (int index) => dateTimeChartData[index].xval,
    //     yValueMapper: (int index) => dateTimeChartData[index].yval!,
    //     trackball: const SparkChartTrackball(),
    //   ),
    // );
    //-------------------------
    //     Expanded(
    //   child: SfSparkBarChart.custom(
    //       axisLineWidth: 0,
    //       dataCount: 12,
    //       xValueMapper: (int index) => categorydata[index].xval,
    //       yValueMapper: (int index) => categorydata[index].yval!,
    //       trackball: SparkChartTrackball(
    //           tooltipFormatter: (TooltipFormatterDetails details) {
    //         final String labelText = '${details.x} : ${details.y}%';
    //         return labelText;
    //       })),
    // );
    //---------------
    // Expanded(
    //   child: SfSparkBarChart(
    //     axisLineWidth: 0,
    //     highPointColor: const Color.fromRGBO(20, 170, 33, 1),
    //     data: const <double>[10, 6, 8, 11, 5,  7, 6, 8, 10],

    //     trackball: const SparkChartTrackball(),
    //   ),
    // );
  }
}

class _SalesData {
  _SalesData({this.xval, this.yval});
  final dynamic xval;
  final double? yval;
}
