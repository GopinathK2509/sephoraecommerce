import 'package:flutter/material.dart';
import 'package:sephora/Screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sephora",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
