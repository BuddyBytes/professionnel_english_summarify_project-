import 'package:flutter/material.dart';
import 'package:summarify/view/Nav%20Bar%20Screen/home.dart';
import 'package:summarify/view/Nav%20Bar%20Screen/profile.dart';
import 'package:summarify/view/Nav%20Bar%20Screen/search.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '../constants/colors/colors.dart';

class SummaryFyBottomNavBarController extends StatefulWidget {
  const SummaryFyBottomNavBarController({super.key});

  @override
  State<SummaryFyBottomNavBarController> createState() =>
      _SummaryFyBottomNavBarControllerState();
}

class _SummaryFyBottomNavBarControllerState
    extends State<SummaryFyBottomNavBarController> {
  int _currentIndex = 0;

  List<Widget> summaryFyScreen = [
    const SummaryFyHomeScreen(),
    const SummaryFySettingScreen(),
    const SummaryFyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: summaryFyScreen[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(FluentIcons.home_database_24_regular),
            title: Text(
              "Home",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            selectedColor: SummaryfyColors.primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(FluentIcons.search_square_24_regular),
            title: Text(
              "Search",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            selectedColor: SummaryfyColors.primaryColor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(FluentIcons.person_12_regular),
            title: Text(
              "Profile",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
