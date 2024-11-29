import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SpikeLinegraph extends StatelessWidget {
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

  SpikeLinegraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfSparkLineChart(
        trackball: const SparkChartTrackball(),
        marker: const SparkChartMarker(
            borderWidth: 3,
            displayMode: SparkChartMarkerDisplayMode.all,
            color: Colors.blue),
        axisLineWidth: 0,
        data: const <double>[5, 6, 5, 7, 4, 3, 9, 8],
      
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
      ),
    );
  }
}

// Data model for the sparkline chart
class SparkData {
  final int x;
  final double y;

  SparkData(this.x, this.y);
}
