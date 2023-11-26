import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summarify/common/button.dart';
import 'package:summarify/constants/colors/colors.dart';
import 'package:summarify/view/create_workspace.dart';

class SummaryFyLaunchScreen extends StatelessWidget {
  const SummaryFyLaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get the device dimensions
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Gap(height * 0.05),
              Image(
                image: AssetImage("assets/images/logo.png"),
              ),
              Gap(height * 0.10),
              // heading title
              Text(
                "Summarize and organize your thoughts, ideas,",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(height * 0.015),
              Text(
                "and information with Summarify",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                ),
              ),
              // button at bottom of app
              Gap(height * 0.35),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SummaryFyWorkspace();
                    }),
                  );
                },
                child: customButton(
                  backgroundColor: SummaryfyColors.primaryColor,
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
