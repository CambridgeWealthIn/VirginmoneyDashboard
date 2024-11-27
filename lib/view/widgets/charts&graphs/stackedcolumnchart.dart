import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedColumnChart extends StatefulWidget {
  const StackedColumnChart({super.key});

  @override
  _StackedColumnChartState createState() => _StackedColumnChartState();
}

class _StackedColumnChartState extends State<StackedColumnChart> {
  // Sample data for the chart
  final List<ChartData> chartData = [
    ChartData('2020', 10, 10),
    ChartData('2021', 11, 20),
    ChartData('2022', 12, 23),
    ChartData('2023', 14, 16),
    ChartData('2024', 13, 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCartesianChart(
        // title: const ChartTitle(text: 'Sales Analysis by Quarter'),
        // legend: const Legend(isVisible: true),
        borderWidth: 0,
        borderColor: Colors.transparent,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}Mn',
          // title: AxisTitle(text: 'Sales (in millions)'),
        ),
        series: <StackedColumnSeries<ChartData, String>>[
          StackedColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,
            name: 'New Customer',
            width: 0.15,
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffff5c3b),
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2,
            name: 'Current Customers',
            width: 0.15,
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xff9b005b),
          ),
        ],
      ),
    );
  }
}

// Model class for chart data
class ChartData {
  final String x;
  final double y1;
  final double y2;

  ChartData(
    this.x,
    this.y1,
    this.y2,
  );
}
