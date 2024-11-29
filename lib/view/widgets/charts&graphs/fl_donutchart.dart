import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonutChartPage extends StatelessWidget {
  const DonutChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PieChart(
        
            PieChartData(
              
              borderData: FlBorderData(show: false), // No borders for the pie chart
              sectionsSpace: 0, // No space between sections
              centerSpaceRadius: 10, // Hole in the center (donut chart)
              sections: [
                PieChartSectionData(
                  value: 40,
                  title: '40%',
                  color: Colors.blue,
                  showTitle: true,
                  titleStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  radius: 18, 
                ),
                PieChartSectionData(
                  value: 30,
                  title: '30%',
                  color: Colors.green,
                  showTitle: true,
                  titleStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                   radius: 18, 
                ),
                PieChartSectionData(
                  value: 18,
                  title: '18%',
                  color: Colors.orange,
                  showTitle: true,
                  titleStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                   radius: 18, 
                ),
                PieChartSectionData(
                  value: 10,
                  title: '10%',
                  color: Colors.red,
                  showTitle: true,
                  titleStyle: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                   radius: 18, 
                ),
              ],
            //   centerWidget: const Text(
            //   'Total\n100%',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            ),
         
      ),
    );
  }
}
