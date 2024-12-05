import 'package:dashboard/view/overview/dptwidget.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dawidget.dart';
import 'dcrwidget.dart';
import 'dewidget.dart';
import 'dswidget.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  void initState() {
    super.initState();
    fetchPosts(); // Fetch posts when the widget is initialized
  }

  // final response = await http.get(Uri.parse('http://192.168.238.154:5000/api/excel-data'));
  // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  // Create separate lists for each block
  List<Map<String, dynamic>> customerRegistrations = [];
  List<Map<String, dynamic>> digitalActive = [];
  List<Map<String, dynamic>> digitalEngagement = [];
  List<Map<String, dynamic>> paymentTransactions = [];
  List<Map<String, dynamic>> digitalSales = [];

  Future<void> fetchPosts() async {
    log('-----Fetching Data----------');
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/data'));

    List<dynamic> data = json.decode(response.body);

    // Loop through each item in the data
    for (var item in data) {
      switch (item['Block Name']) {
        case 'Customer Registrations':
          customerRegistrations.add(item);
          break;
        case 'Digital Activity':
          digitalActive.add(item);
          break;
        case 'Digital Engagement':
          digitalEngagement.add(item);
          break;
        case 'Digital Payment & Transactions':
          paymentTransactions.add(item);
          break;
        case 'Digital Sales':
          digitalSales.add(item);
          break;
      }
    }

    setState(() {
      customerRegistrations;
    });
    // Output the lists
    // print('Customer Registrations: ${customerRegistrations[1]}');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.25;
    double width = (MediaQuery.of(context).size.width - 30) / 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          Row(
            children: [
              DCRWidget(
                height: height,
                width: width,
                data: customerRegistrations,
              ),
              DAWidget(
                height: height,
                width: width,
                data: digitalActive,
              )
            ],
          ),
          Row(
            children: [
              DEWidget(
                data: digitalEngagement,
              ),
              DSWidget(
                width: width,
                data: digitalSales,
              )
            ],
          ),
          DPTWidget(
            height: height,
            width: width,
            data: paymentTransactions,
          )
        ],
      ),
    );
  }
}
