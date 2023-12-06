import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/colors/colors.dart';

class SummaryFySettingScreen extends StatelessWidget {
  const SummaryFySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "Search",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              color: SummaryfyColors.primaryColor.withOpacity(1),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: SummaryfyColors.primaryColor,
                decoration: InputDecoration(
                  hintText: "Search Term ...",
                  hintStyle: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
