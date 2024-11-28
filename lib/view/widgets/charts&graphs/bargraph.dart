import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraphWithTooltip extends StatelessWidget {
  const BarGraphWithTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<BarData> data = [
      BarData(category: 'Jan', value: 50, color: Colors.orange),
      BarData(category: 'Feb', value: 70, color: Colors.orange),
      BarData(category: 'Mar', value: 60, color: Colors.orange),
      BarData(category: 'Apr', value: 80, color: Colors.orange),
      BarData(category: 'May', value: 50, color: Colors.red),
      BarData(category: 'Jun', value: 70, color: Colors.orange),
      BarData(category: 'Jul', value: 90, color: Colors.orange),
      BarData(category: 'Oct', value: 80, color: Colors.red),
    ];

    return Expanded(
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        // Enable tooltips
        tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: true, // Disable marker
          format: 'point.x: point.y', // Format for tooltip
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Arial',
          ),
        ),
        // X-axis
        primaryXAxis: const CategoryAxis(
          isVisible: false,
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
            dataLabelSettings: const DataLabelSettings(
              isVisible: false, // Optional: disable data labels
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
