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
        series: <PieSeries<ChartData, String>>[
          PieSeries<ChartData, String>(
            dataSource: getChartData(), // Provide the data source
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.sales,
            dataLabelMapper: (ChartData data, _) =>
                '${data.category}: ${data.sales}',
            // dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  // Sample data
  List<ChartData> getChartData() {
    return [
      ChartData('Electronics', 35),
      ChartData('Clothing', 28),
      ChartData('Groceries', 34),
      ChartData('Books', 18),
    ];
  }
}

// Data model class
class ChartData {
  final String category;
  final double sales;

  ChartData(this.category, this.sales);
}
