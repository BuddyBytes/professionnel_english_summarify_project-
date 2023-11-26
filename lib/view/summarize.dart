import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../common/button.dart';
import '../constants/colors/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class SummaryFySummarizeScreen extends StatelessWidget {
  const SummaryFySummarizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(25),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(FluentIcons.arrow_step_back_20_regular),
              ),
              Gap(15),
              Container(
                width: double.infinity,
                height: height * 0.75,
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLength: 10000,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Write your Text ... ",
                    hintStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(10),
              customButton(
                child: Text(
                  "Summarize",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: SummaryfyColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
