import 'package:dashboard/constants/container_shape_decoration.dart';
import 'package:dashboard/view/widgets/charts&graphs/bargraph2.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DEWidget extends StatelessWidget {
  const DEWidget({
    super.key,
    required this.data,
  });
  final List data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    // double width = MediaQuery.of(context).size.width ;
    data[0]["Value"];
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
                  borderRadius: BorderRadius.circular(8),),
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
                        Image.asset(
                          "assets/Maximize.png",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    0.13,
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                decoration: containerShapeDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12.0,),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const FittedBox(
                                        child: Text(
                                          "HVJs Count",
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Spacer(),
                                      FittedBox(
                                          child: Text(
                                        data[0]["Value"],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      BarGraph()
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                decoration: containerShapeDecoration(),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width *
                                    0.13,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 4, 4, 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          data[3]["Metric"],
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          8.0,
                                          0,
                                          8,
                                          12,
                                        ),
                                        child: SizedBox(
                                          height: 10,
                                          child: Tooltip(
                                            message:
                                                "${data[3]["Value"].toString()}%",
                                            child: LinearProgressIndicator(
                                              value: 0.86,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 181, 181, 181),
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DECard1(
                                    title: data[1]["Metric"],
                                    number: data[1]["Value"],
                                    percent: "1.4%",
                                    image: "/containmentRate.png",
                                  ),
                                  // const Spacer(),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  DECard1(
                                    title: data[4]["Metric"],
                                    number: data[4]["Value"],
                                    percent: "3.2%",
                                    image: "/CheckSquare.png",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              DECard(
                                height: height,
                                title: "PCA",
                                number: "1.87Mn",
                                data: data,
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

class DECard1 extends StatelessWidget {
  const DECard1({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.percent,
  });

  final String number;
  final String title;
  final String image;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      height: MediaQuery.of(context).size.height * 0.4 / 2 - 10,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 9),
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    FittedBox(
                      child: Text(
                        percent,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

class DECard extends StatelessWidget {
  const DECard({
    super.key,
    required this.height,
    required this.title,
    required this.number,
    required this.data,
  });

  final double height;

  final String number;
  final String title;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: height / 3 + 5,
      decoration: containerShapeDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ratings",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/appstore.png',
                      scale: 1.6,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'App Store Rating',
                      style: TextStyle(
                        fontSize: 10,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data[2]["Value"].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RatingBarIndicator(
                            rating: data[2]["Value"],
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            unratedColor: Colors.orange.withAlpha(50),
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: grey,
                    width: 1,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/playstore.png',
                      scale: 1.6,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Play Store Rating',
                      style: TextStyle(
                        fontSize: 10,
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          data[5]["Value"].toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RatingBarIndicator(
                          rating: data[5]["Value"],
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          unratedColor: Colors.orange.withAlpha(50),
                          direction: Axis.horizontal,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
