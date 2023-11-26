import 'package:flutter/material.dart';
import 'package:summarify/view/launch_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.openBox("Workspace");

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
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          )),
      //home
      home: SummaryFyLaunchScreen(),
    );
  }
}
