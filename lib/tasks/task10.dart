import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task8 extends StatefulWidget {
  const Task8({super.key});

  @override
  State<Task8> createState() => _Task8State();
}

class _Task8State extends State<Task8> {
  String sample = "Loading...";

  Future<void> fetchAllProducts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        setState(() {
          sample = response.body;
        });
      } else {
        setState(() {
          sample = "Error: ${response.reasonPhrase}";
        });
      }
    } catch (e) {
      setState(() {
        sample = "Failed to load data: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async real example using Postman"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(sample),
        ),
      ),
    );
  }
}
