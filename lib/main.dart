import 'package:flutter/material.dart';
import 'package:summarify/view/launch_screen.dart';

void main() {
  runApp(
    const SummaryFyApp(),
  );
}

class SummaryFyApp extends StatelessWidget {
  const SummaryFyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),

      //home
      home: SummaryFyLaunchScreen(),
    );
  }
}
