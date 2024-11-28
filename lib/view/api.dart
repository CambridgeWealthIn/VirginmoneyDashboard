import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiCheck extends StatefulWidget {
  const ApiCheck({super.key});

  @override
  State<ApiCheck> createState() => _ApiCheckState();
}

class _ApiCheckState extends State<ApiCheck> {
  List<dynamic> posts = [];  // Variable to store posts

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Fetch posts when the widget is initialized
  }

  // Function to fetch posts from API
  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('http://10.10.10.160:5000/data'));
    // final response = await http.get(Uri.parse('http://192.168.238.154:5000/api/excel-data'));
    // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body); // Decode and set posts
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const  Center(child: CircularProgressIndicator())
        : Material(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index]['title']),
                  subtitle: Text(posts[index]['body']),
                );
              },
            ),
        );
  }
}
