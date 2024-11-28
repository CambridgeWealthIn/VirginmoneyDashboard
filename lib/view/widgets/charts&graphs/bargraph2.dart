import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<BarData> data = [
      BarData(category: 'Jan', value: 50, color: Colors.orange),
      BarData(category: 'Feb', value: 70, color: Colors.orange),
      BarData(category: 'Mar', value: 90, color: Colors.red),
      BarData(category: 'Apr', value: 80, color: Colors.orange),
    ];

    return Expanded(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(
          enable: true,
          format: 'point.x: point.y', // Tooltip content format
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        // X-axis
        primaryXAxis: const CategoryAxis(
          isVisible: true,
          majorGridLines: MajorGridLines(color: Colors.transparent),
          majorTickLines: MajorTickLines(color: Colors.transparent),
          axisLine: AxisLine(color: Colors.transparent),
        ),
        // Hide Y-axis
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
        // Series with border radius
        series: <CartesianSeries>[
          ColumnSeries<BarData, String>(
            dataSource: data,
            xValueMapper: (BarData data, _) => data.category,
            yValueMapper: (BarData data, _) => data.value,
            pointColorMapper: (BarData data, _) => data.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(4), // Adjust the radius as needed
            ),
          ),
        ],
      ),
    );
  }
}

// Data Model
class BarData {
  final String category;
  final double value;
  final Color color;

  BarData({required this.category, required this.value, required this.color});
}
