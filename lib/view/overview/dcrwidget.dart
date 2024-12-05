import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/container_shape_decoration.dart';
import '../widgets/charts&graphs/fl_donutchart.dart';
import '../widgets/charts&graphs/linegraph.dart';
import '../widgets/charts&graphs/micro_barchart.dart';
import '../widgets/charts&graphs/spike_linegraph.dart';
import 'expanded_dcr_widget.dart';

class DCRWidget extends StatelessWidget {
  const DCRWidget({
    super.key,
    required this.data,
    required this.height,
    required this.width,
  });

  final List data;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Center(
            child: SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width * 0.43,
            child: Card(
              color: white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LineGraph(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/overview/Maximize.png",
                            scale: 1.4,
                          ),
                        )
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DCRCard(
                                width: width,
                                height: height,
                                title: data[0]["Metric"],
                                number: data[0]["Value"].toString(),
                                image: "assets/overview/Downloadcloud.png",
                                child: Image.asset(
                                    "overview/digitalprimacydonut.png"),
                              ),
                              const Spacer(),
                              DCRCard(
                                width: width,
                                height: height,
                                title: data[1]["Metric"],
                                number: data[1]["Value"].toString(),
                                image: "assets/overview/User.png",
                                child:const MicroBarchart(),
                                // child: Image.asset(
                                //     "assets/overview/pcabargraph.png"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DCRCard(
                                width: width,
                                height: height,
                                title: data[2]["Metric"],
                                number: data[2]["Value"].toString(),
                                image: "assets/overview/building.png",
                                child: const DonutChartPage(),
                                // child: Image.asset("assets/overview/businessbargraph.png"),
                              ),
                              const Spacer(),
                              DCRCard(
                                width: width,
                                height: height,
                                title: data[3]["Metric"],
                                number: data[3]["Value"].toString(),
                                image: "assets/overview/CreditCard.png",
                                child: SpikeLinegraph(),
                                // child:  Image.asset("assets/linegraph.png"),
                              ),
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

class DCRCard extends StatelessWidget {
  const DCRCard({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.number,
    required this.child,
    required this.image,
  });

  final double height;
  final double width;
  final String number;
  final String title;
  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.205,
      height: height / 3 + 5,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12, 12, 12),
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
                      width: 3,
                    ),
                    FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FittedBox(
                    child: Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
            const Spacer(),
            child
          ],
        ),
      ),
    );
  }
}
