import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SummaryFyLaunchScreen extends StatelessWidget {
  const SummaryFyLaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get the device dimensions
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/logo.png"),
              ),
              Gap(height * 0.20),
              // heading title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Capture and organize your thoughts, ideas,",
                    ),
                    TextSpan(
                      text: "and information with ease",
                    )
                  ],
                ),
              ),
              // button at bottom of app
              Gap(height * 0.40),
            ],
          ),
        ),
      ),
    );
  }
}
