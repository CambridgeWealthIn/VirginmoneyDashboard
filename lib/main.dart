import 'package:flutter/material.dart';


import 'view/dashboard.dart';
import 'view/widgets/charts&graphs/linegraph.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return   MaterialApp(
     debugShowCheckedModeBanner: false,
      // home:  LineGraph(),
      home:  DashBoard(),
      // home:  ApiCheck(),
    );
  }
}
