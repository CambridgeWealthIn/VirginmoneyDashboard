import 'package:dashboard/view/widgets/dptwidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/colors.dart';
import 'widgets/dawidget.dart';
import 'widgets/dcrwidget.dart';
import 'widgets/dewidget.dart';
import 'widgets/dswidget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // List of items in the dropdown
  final List<String> items = [
    'All Products',
    'All channels',
    'Option 3',
    'Option 4',
  ];

  // Initial selected value
  String? selectedValueDropDown1 = 'All Products';
  String? selectedValueDropDown2 = 'All channels';

  bool isSelected = true;

  List<dynamic> posts = []; // Variable to store posts

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
    print('-----Fetching Data----------');
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
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 45,
              color: red,
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 9),
                    child: Image.asset('assets/logo.png'),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/bell.png",
                      color: white,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/group.png",
                      color: white,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            topBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  DCRWidget(
                      height: height,
                      width: width,
                      data: customerRegistrations),
                  DAWidget(
                    height: height,
                    width: width,
                    data: digitalActive,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
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
            ),
            DPTWidget(
              height: height,
              width: width,
              data: paymentTransactions,
            )
          ],
        ),
      ),
    );
  }

  Padding topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 5,
      ),
      child: SizedBox(
        height: 24,
        child: Row(
          children: [
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(
              width: 9,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              width: 110,
              height: 40,
              child: DropdownButton<String>(
                value: selectedValueDropDown1,
                isExpanded: true, // Add this property
                onChanged: (newValue) {
                  setState(() {
                    selectedValueDropDown1 = newValue;
                  });
                },

                // padding: const EdgeInsets.only(bottom: 15),
                // decoration: const InputDecoration(
                //   border:
                //       InputBorder.none, // Removes the bottom stroke/underline
                // ),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text is still too long
                    ),
                  );
                }).toList(),
                hint: const Text('Select an option'),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Container(
              width: 110,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: DropdownButton<String>(
                value: selectedValueDropDown2,
                isExpanded: true, // Add this property
                onChanged: (newValue) {
                  setState(() {
                    selectedValueDropDown2 = newValue;
                  });
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text is still too long
                    ),
                  );
                }).toList(),
                hint: const Text('Select an option'),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? red : white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: red),
                  ),
                ),
                child: FittedBox(
                  child: Text(
                    'Overview',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
              ),
              child: Text(
                'Customers Registrations',
                style: TextStyle(
                  color: textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
              ),
              child: Text(
                'Activity',
                style: TextStyle(
                  color: textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
              ),
              child: Text(
                'Engagement',
                style: TextStyle(
                  color: textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
              ),
              child: Text(
                'Sales',
                style: TextStyle(
                  color: textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
              ),
              child: Text(
                'Payments & Transactions',
                style: TextStyle(
                  color: textRed,
                ),
              ),
            ),
           const Spacer(),
             Padding(
               padding: const EdgeInsets.only(right:12.0),
               child: Image.asset("assets/Filter.png", scale: 1.5,),
             )
          ],
        ),
        

      ),
    );
  }
}
