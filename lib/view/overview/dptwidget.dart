import 'package:dashboard/constants/container_shape_decoration.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';

class DPTWidget extends StatelessWidget {
  const DPTWidget({
    super.key,
    required this.height,
    required this.width,
    required this.data,
  });

  final double height;
  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
 
    return
     data.isEmpty ? const Center(child: SizedBox(
      height: 45,
      width: 45,
      child:  CircularProgressIndicator(),),)
   :  SizedBox(
     height: height,
     width: MediaQuery.of(context).size.width * 0.98,
     child: Card(
       color: white,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
       elevation: 1,
       child: Padding(
         padding: const EdgeInsets.symmetric(
           vertical: 8.0,
           horizontal: 6,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 FittedBox(
                   child: Text(
                     data[0]["Block Name"],
                     style: TextStyle(
                       fontSize: 14,
                       color: textRed,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 const Spacer(),
                 Image.asset("assets/overview/Maximize.png",scale: 1.4,)
               ],
             ),
             const SizedBox(
               height: 6,
             ),
             Container(
               // height: height / 2,
               decoration: ShapeDecoration(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(3),
                 ),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   DACard1(
                     width: width,
                     height: height,
                     title:  data[0]["Metric"],
                     number1: data[0]["Value"],
                     text1: "Mobile",
                     number2: data[1]["Value"],
                     text2: "Website",
                     image: "assets/overview/Monitor.png",
                   ),
                   // const Spacer(),
                   const SizedBox(
                     width: 4,
                   ),
                   DACard1(
                     width: width,
                     height: height,
                     title:  data[2]["Metric"],
                     number1: data[2]["Value"],
                     text1: "Mobile",
                     number2: data[3]["Value"],
                     text2: "Website",
                     image: "assets/overview/Trendingup.png",
                   ),
                   const SizedBox(
                     width: 4,
                   ),
                   Column(
                     children: [
                       DACard(
                         height: height,
                         title: data[4]["Metric"],
                         number1: data[4]["Value"],
                         number2:  data[5]["Value"],
                         number3: data[6]["Value"],
                         image: "assets/overview/wallet.png",
                       ),
                       const SizedBox(
                         height: 4,
                       ),
                       DACard(
                         height: height,
                         title:  data[7]["Metric"],
                         number1: data[7]["Value"],
                         number2: data[8]["Value"],
                         number3:data[9]["Value"],
                         image: "assets/overview/calculator.png",
                       )
                     ],
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }
}

class DACard1 extends StatelessWidget {
  const DACard1({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.text1,
    required this.text2,
    required this.number1,
    required this.number2,
    required this.image,
  });

  final double height;
  final double width;
  final String number1;
  final String number2;
  final String title;
  final String text1;
  final String text2;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.32),
      height: MediaQuery.of(context).size.height * 0.2 - 12,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      scale: 1.6,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(
                      height: 39,
                      child: VerticalDivider(
                        color: Color(0xffd03788),
                        thickness: 2.4,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            number1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            text1,
                            style: const TextStyle(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 39,
                      child: VerticalDivider(
                        color: Color(0xff29afb4),
                        thickness: 2.4,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            number2,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            text2,
                            style: const TextStyle(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            // const Spacer(),

            const DonutChart()
          ],
        ),
      ),
    );
  }
}

class DACard extends StatelessWidget {
  const DACard({
    super.key,
    required this.height,
    required this.title,
    required this.number1,
    required this.number2,
    required this.number3,
    required this.image,
  });

  final double height;

  final String number1;
  final String number2;
  final String number3;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.32,
      height: (height / 3 + 5),
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 6, 12, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  scale: 1.6,
                ),
                const SizedBox(
                  width: 6,
                ),
                FittedBox(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        number1.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        "Total Value",
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                // const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        number2.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        "Digital Value",
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                // const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        number3.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        "Daily Average",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
            dataLabelMapper: (ChartData data, _) =>
                '${data.category}: ${data.sales}%',
            pointColorMapper: (ChartData data, _) => data.color,
            dataLabelSettings: const DataLabelSettings(
                // isVisible: true,
                labelPosition: ChartDataLabelPosition.inside),
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
      ChartData(
        'Last 90 Days',
        9.7,
        const Color(0xffd03788),
      ),
      ChartData('Last 30 Days', 3.8, const Color(0xff29afb4)),
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
