// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class BarGraphWithTooltip extends StatelessWidget {
//   const BarGraphWithTooltip({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Dummy Data
//     final List<BarData> data = [
//       BarData(category: 'Jan', value: 50, color: Colors.orange),
//       BarData(category: 'Feb', value: 70, color: Colors.orange),
//       BarData(category: 'Mar', value: 60, color: Colors.orange),
//       BarData(category: 'Apr', value: 80, color: Colors.orange),
//       BarData(category: 'May', value: 50, color: Colors.red),
//       BarData(category: 'Jun', value: 70, color: Colors.orange),
//       BarData(category: 'Jul', value: 90, color: Colors.orange),
//       BarData(category: 'Oct', value: 80, color: Colors.red),
//     ];

//     return Expanded(
//       child: SfCartesianChart(
//         plotAreaBorderWidth: 0,
//         // Enable tooltips
//         tooltipBehavior: TooltipBehavior(
//           enable: true,
//           canShowMarker: true, // Disable marker
//           format: 'point.x: point.y', // Format for tooltip
//           textStyle: const TextStyle(
//             color: Colors.black,
//             fontSize: 12,
//             fontFamily: 'Arial',
//           ),
//         ),
//         // X-axis
//         primaryXAxis: const CategoryAxis(
//           isVisible: false,
//           majorGridLines: MajorGridLines(color: Colors.transparent),
//           majorTickLines: MajorTickLines(color: Colors.transparent),
//           axisLine: AxisLine(color: Colors.transparent),
//         ),
//         // Hide Y-axis
//         primaryYAxis: const NumericAxis(
//           isVisible: false,
//         ),
//         // Series with border radius
//         series: <CartesianSeries>[
//           ColumnSeries<BarData, String>(
//             dataSource: data,
//             xValueMapper: (BarData data, _) => data.category,
//             yValueMapper: (BarData data, _) => data.value,
//             pointColorMapper: (BarData data, _) => data.color,
//             borderRadius: const BorderRadius.all(
//               Radius.circular(4), // Adjust the radius as needed
//             ),
//             dataLabelSettings: const DataLabelSettings(
//               isVisible: false, // Optional: disable data labels
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Data Model
// class BarData {
//   final String category;
//   final double value;
//   final Color color;

//   BarData({required this.category, required this.value, required this.color});
// }


import 'dart:convert';
import 'package:http/http.dart' as http;





import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BarChartGraph extends StatefulWidget {
  const BarChartGraph({super.key});

  @override
  State<BarChartGraph> createState() => BarChartGraphState();
}

class BarChartGraphState extends State<BarChartGraph> {
  late Future<List<SectorData>> _chartDataFuture;


// // Decode JSON response
//   Map<String, dynamic> decodedResponse = json.decode(response.body);

//   // Extract "clients_sectoral_analysis" data
//   List<dynamic> sectoralAnalysis = decodedResponse['clients_sectoral_analysis'];

//   // Extract sectors into a list, filtering out null values
//   List<String> sectors = sectoralAnalysis
//       .where((item) => item['sector'] != null)
//       .map((item) => item['sector'] as String)
//       .toList();

//   // Print the extracted sectors
//   print(sectors);

  
Future<List<SectorData>> fetchSectorData() async {
  final response = await http.post(
    Uri.parse("https://cw-stage.hasura.app/api/rest/indv-analysis"),
    headers: {
      "Content-Type": 'application/json',
      "x-hasura-admin-secret": "OD4xgAFVEehjLIKMEfVGHJlxX6z7O1dHccOBQEV8wT0zjtOLWebZqoqRbRNRyBcb",
    },
    body: jsonEncode({
      "client_id": "SANDEEPAAPPJ9197G",
    }),
  );

  // print(response.body);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> sectorDataJson = jsonResponse['clients_sectoral_analysis'];

    return sectorDataJson
        .map((item) => SectorData.fromJson(item))
        .where((item) => item.sector != null && item.analysisSectorHoldings != null)
        .toList();
  } else {
    throw Exception('Failed to load sector data: ${response.reasonPhrase}');
  }
}


  @override
  void initState() {
    super.initState();
    _chartDataFuture = fetchSectorData(); // Fetch API data
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<SectorData>>(
        future: _chartDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          // Render bar graph with fetched data
          return Expanded(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(

              ),
              // title: const ChartTitle(text: 'API Data Bar Chart'),
              series: <CartesianSeries>[
                ColumnSeries<SectorData, String>(
                  dataSource: snapshot.data!,
                  xValueMapper: (SectorData data, _) => data.sector,
                  yValueMapper: (SectorData data, _) => data.analysisSectorHoldings,
                  name: 'Values',
                  // color: Colors.blue,
                )
              ],
            ),
          );
        },
      
    );
  }
}


class SectorData {
  final String? sector;
  final double? analysisSectorHoldings;

  SectorData({required this.sector, required this.analysisSectorHoldings});

  factory SectorData.fromJson(Map<String, dynamic> json) {
    return SectorData(
      sector: json['sector'],
      analysisSectorHoldings: json['analysis_sector_holdings'] != null
          ? (json['analysis_sector_holdings'] as num).toDouble()
          : null,
    );
  }
}
