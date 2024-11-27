import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCircularChart(
        // title: const ChartTitle(text: 'Sales by Category'),
        // legend: const Legend(isVisible: true),
        series: <PieSeries<_ChartData, String>>[
          PieSeries<_ChartData, String>(
            dataSource: getChartData(), // Provide the data source
            xValueMapper: (_ChartData data, _) => data.category,
            yValueMapper: (_ChartData data, _) => data.sales,
            dataLabelMapper: (_ChartData data, _) => '${data.category}: ${data.sales}',
            // dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  // Sample data
  List<_ChartData> getChartData() {
    return [
      _ChartData('Electronics', 35),
      _ChartData('Clothing', 28),
      _ChartData('Groceries', 34),
      _ChartData('Books', 18),
    ];
  }
}

// Data model class
class _ChartData {
  final String category;
  final double sales;

  _ChartData(this.category, this.sales);
}
