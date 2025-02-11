import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/view/product_view_provider.dart';
import 'package:tasks/tasks/task1.dart';

import 'provider/product_provder.dart';
//import 'tasks/task10.dart';
import 'tasks/task11.dart';
import 'tasks/task5.dart';
import 'tasks/task6.dart';
import 'tasks/task8.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductViewWidget(),
    );
  }
}
