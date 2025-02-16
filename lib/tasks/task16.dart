import 'package:flutter/material.dart';

//task 16
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Hero Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );
          },
          child: Hero(
            tag: 'hero-tag',
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

//task 16
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' second screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-tag',
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
