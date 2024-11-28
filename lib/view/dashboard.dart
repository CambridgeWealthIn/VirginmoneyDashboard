import 'package:dashboard/view/customer_registrations/customer_registrations.dart';
// import 'package:dashboard/view/overview.dart';
import 'package:dashboard/view/overview/overview.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int navValue = 0;

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

  List<dynamic> posts = []; // Variable to store posts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 40,
              color: red,
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 9,
                    ),
                    child: Image.asset('assets/overview/logo.png'),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/overview/bell.png",
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
                      "assets/overview/group.png",
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
            navValue == 0
                ? const Overview()
                : navValue == 1
                    ? const CustomerRegistrations()
                    : Container(
                        height: 100,
                        width: 100,
                        color: Colors.black45,
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
        vertical: 8,
      ),
      child: SizedBox(
        height: 24,
        child: Row(
          children: [
            // const SizedBox(
            //   width: 6,
            // ),
            const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 110,
              height: 24,
              child: DropdownButtonFormField<String>(
                value: selectedValueDropDown1, // Set the initial selected value
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueDropDown1 = newValue; // Update selected value
                  });
                },

                borderRadius: BorderRadius.circular(9),

                focusColor: grey,
                isDense: true,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.red,
                  size: 20,
                ),

                hint: const Text("Select an option"),
                decoration: InputDecoration(
                  fillColor: white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: grey,
                      width: 1.0,
                    ),
                  ),
                  // Border color after selection
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: selectedValueDropDown1 != null
                          ? grey // Green border when selected
                          : grey, // Grey border when not selected
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(6),
                ),

                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              width: 110,
              height: 24,
              child: DropdownButtonFormField<String>(
                value: selectedValueDropDown2, // Set the initial selected value
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueDropDown2 = newValue; // Update selected value
                  });
                },

                borderRadius: BorderRadius.circular(9),

                focusColor: grey,
                isDense: true,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.red,
                  size: 20,
                ),

                hint: const Text("Select an option"),
                decoration: InputDecoration(
                  fillColor: white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: grey,
                      width: 1.0,
                    ),
                  ),
                  // Border color after selection
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: selectedValueDropDown2 != null
                          ? grey // Green border when selected
                          : grey, // Grey border when not selected
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(6),
                ),

                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 0 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: FittedBox(
                child: Text(
                  "Overview",
                  style: TextStyle(
                    color: navValue == 0 ? white : textRed,
                  ),
                ),
              ),
            ),
            // SwitchTabButton(
            //   title: "Overview",
            //   isSelected: isSelected,
            //   navigation: const Overview(),
            // ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 1 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: Text(
                'Customers Registrations',
                style: TextStyle(
                  color: navValue == 1 ? white : textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 2;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 2 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: Text(
                'Activity',
                style: TextStyle(
                  color: navValue == 2 ? white : textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 3;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 3 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: Text(
                'Engagement',
                style: TextStyle(
                  color: navValue == 3 ? white : textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 4;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 4 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: Text(
                'Sales',
                style: TextStyle(
                  color: navValue == 4 ? white : textRed,
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  navValue = 5;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navValue == 5 ? red : white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: red),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
              ),
              child: FittedBox(
                child: Text(
                  'Payments & Transactions',
                  style: TextStyle(
                    color: navValue == 5 ? white : textRed,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Image.asset(
                "assets/overview/Filter.png",
                scale: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SwitchTabButton extends StatelessWidget {
  const SwitchTabButton({
    super.key,
    required this.title,
    required this.navigation,
    required this.isSelected,
  });

  final String title;
  final Widget navigation;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          title,
          style: TextStyle(
            color: white,
          ),
        ),
      ),
    );
  }
}
