import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCircularChart(
        // title: const ChartTitle(text: 'Product Sales by Category'),
        // legend: const Legend(isVisible: true),
        series: <DoughnutSeries<ChartData, String>>[
          DoughnutSeries<ChartData, String>(
            dataSource: getChartData(), // Provide the data source
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.sales,
            dataLabelMapper: (ChartData data, _) => '${data.category}: ${data.sales}%',
             pointColorMapper: (ChartData data, _) => data.color, 
            dataLabelSettings: const DataLabelSettings(
            // isVisible: true, 
            labelPosition: 
            ChartDataLabelPosition.inside),
            innerRadius: '50%',
             // Adjust inner radius for donut effect
          ),
        ],
      ),
    );
  }

  // Sample data
  List<ChartData> getChartData() {
    return [
      ChartData('Last 90 Days', 9.7, Colors.orange),
      ChartData('Last 30 Days', 3.8, Colors.pink),

    ];
  }
}

// Data model class
class ChartData {
  final String category;
  final double sales;
  final Color color;

  ChartData(this.category, this.sales, this.color);
}
