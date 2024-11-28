import 'package:dashboard/constants/container_shape_decoration.dart';
import 'package:dashboard/view/widgets/charts&graphs/donutchart.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
// import 'charts&graphs/barchart.dart';

class DAWidget extends StatelessWidget {
  const DAWidget({
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
    return data.isEmpty
        ? const Center(
            child: SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(),
            ),
          )
        : Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: height,
                    width: MediaQuery.of(context).size.width * 0.55,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          DACard1(
                                            width: width,
                                            height: height,
                                            title: data[0]["Metric"],
                                            number: data[0]["Value"],
                                            percent: "1.9%",
                                            image: "assets/overview/LogIn.png",
                                          ),
                                          // const Spacer(),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          DACard1(
                                            width: width,
                                            height: height,
                                            title: data[1]["Metric"],
                                            number: data[1]["Value"],
                                            percent: "1.2%",
                                            image: "assets/overview/Smartphone.png",
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      DACard(
                                        width: width,
                                        height: height,
                                        title: data[2]["Metric"],
                                        number: data[2]["Value"],
                                        image: "assets/overview/LogIn.png",
                                        child:  Image.asset("assets/overview/businessbargraph.png"),
                                        
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: ((MediaQuery.of(context).size.width *
                                                0.55) /
                                            2) -
                                        12,
                                    height: MediaQuery.of(context).size.height *
                                            0.2 -
                                        12,
                                    decoration: containerShapeDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        12,12,12,6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/overview/Activity.png",
                                                    scale: 1.6,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      data[3]["Metric"],
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              const Row(
                                                children: [
                                                  SizedBox(
                                                    height: 39,
                                                    child: VerticalDivider(
                                                      color: Colors.orange,
                                                      thickness: 2.4,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      FittedBox(
                                                        child: Text(
                                                          "9.7Mn",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          "Last 90 Days",
                                                          style: TextStyle(
                                                            fontSize: 7,
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
                                              const Row(
                                                children: [
                                                  SizedBox(
                                                    height: 39,
                                                    child: VerticalDivider(
                                                      color: Colors.pink,
                                                      thickness: 2.4,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      FittedBox(
                                                        child: Text(
                                                          "3.8Mn",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          "Last 30 Days",
                                                          style: TextStyle(
                                                            fontSize: 7,
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
  }
}

class DACard1 extends StatelessWidget {
  const DACard1({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.number,
    required this.percent,
    required this.image,
  });

  final double height;
  final double width;
  final String number;
  final String title;
  final String percent;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.55) / 4) - 8.7,
      height: height / 3 + 5,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB( 8.0,12,8,6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      percent,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 3,),
                    const Icon(
                  Icons.arrow_upward,
                  color: Colors.green,
                  size: 12,
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

class DACard extends StatelessWidget {
  const DACard({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.number,
    required this.image,
    required this.child,
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
      width: ((MediaQuery.of(context).size.width * 0.55) / 2) - 12,
      height: height / 3 + 5,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 3),
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
