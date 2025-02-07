import 'package:black_network/pages/bottomNavigationBar.dart';
import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Black Network',
      theme: lightMode,
      home: const MyHomePage(),
    );
  }
}

