import 'package:dashboard/constants/container_shape_decoration.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../widgets/charts&graphs/stackedcolumnchart.dart';

class DSWidget extends StatelessWidget {
  const DSWidget({
    super.key,
    required this.width,
    required this.data,
  });

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;

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
                          horizontal: 9,
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
                                Image.asset(
                                  "assets/overview/Maximize.png",
                                  scale: 1.4,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          DSCard1(
                                            width: width,
                                            height: height,
                                            title: data[1]["Metric"],
                                            number: data[1]["Value"],
                                          ),
                                          // const Spacer(),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          DSCard2(
                                            width: width,
                                            height: height,
                                            title: data[2]["Metric"],
                                            number: data[2]["Value"],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          DSCard(
                                            width: width,
                                            height: height,
                                            text1: "Highest Sale ",
                                            text2: "by region",
                                            text3: "(N England)",
                                            number: data[3]["Value"],
                                            image: "assets/overview/Globe.png",
                                            // child: const BarChart(),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          DSCard(
                                            width: width,
                                            height: height,
                                            text1: "Highest Sale ",
                                            text2: "by Income ",
                                            text3: "(\u20AC250k-\u20AC2100k)",
                                            number: data[4]["Value"],
                                            image: "assets/overview/poundsign.png",
                                            // child: const BarChart(),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          DSCard(
                                            width: width,
                                            height: height,
                                            text1: "Highest Sale ",
                                            text2: "by Age ",
                                            text3: "(30-49) ",
                                            number: data[5]["Value"],
                                            image: "assets/overview/Users.png",
                                            // child: const BarChart(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: ((MediaQuery.of(context).size.width *
                                                0.55) /
                                            2) -
                                        16,
                                    height: MediaQuery.of(context).size.height *
                                            0.34 -
                                        3,
                                    decoration: containerShapeDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/overview/Package.png",
                                                scale: 1.6,
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              const FittedBox(
                                                child: Text(
                                                  "New & Current Customers",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor:
                                                            Color(0xff9500b5),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          "Current Customer",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 7,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor:
                                                            Color(0xffff5c3b),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          "New Customer",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 7,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const StackedColumnChart()
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

class DSCard1 extends StatelessWidget {
  const DSCard1({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.number,
  });

  final double height;
  final double width;
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.55) / 4) - 8.7,
      height: (MediaQuery.of(context).size.height * 0.34 - 7) / 2,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/overview/Tag.png",
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
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FittedBox(
                      child: Text(
                        "Digital - \u20AC20.6Mn ",
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const FittedBox(
                      child: Text(
                        "Non Digital - \u20AC7.2Mn ",
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    FittedBox(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    )
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

class DSCard2 extends StatelessWidget {
  const DSCard2({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.number,
  });

  final double height;
  final double width;
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.55) / 4) - 8.7,
      height: (MediaQuery.of(context).size.height * 0.34 - 7) / 2,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/overview/Smartphone-1.png",
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
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    )
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

class DSCard extends StatelessWidget {
  const DSCard({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.number,
  });
  final String image;
  final double height;
  final double width;
  final String number;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(context).size.width * 0.085)),
      height: (MediaQuery.of(context).size.height * 0.34 - 7) / 2,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12,
        ),
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
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      text3,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    FittedBox(
                      child: Text(
                        number.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    )
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
