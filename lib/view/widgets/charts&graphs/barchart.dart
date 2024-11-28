import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCartesianChart(
        // title: const ChartTitle(text: 'Product Sales by Category'),
        // legend: const Legend(isVisible: true),
        borderWidth: 0,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0), 
        ), // X-axis for categories
        primaryYAxis: const NumericAxis(
        //   labelFormat: '{value}',
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0), 
        ), // Y-axis with numeric values
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            dataSource: getChartData(),
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.sales,
            name: 'Sales',
            // color: Colors.blue, // Custom bar color
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  // Sample data
  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 35),
      ChartData('Feb', 28),
      ChartData('Mar', 22),
      ChartData('Apr', 18),
    ];
  }
}

// Data model class
class ChartData {
  final String category;
  final double sales;

  ChartData(this.category, this.sales);
}
