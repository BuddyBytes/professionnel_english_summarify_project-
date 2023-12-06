// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summarify/common/button.dart';
import 'package:summarify/constants/colors/colors.dart';
import 'package:summarify/view/Nav%20Bar%20Screen/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:summarify/view/bottom_controller.dart';

class SummaryFyWorkspace extends StatefulWidget {
  const SummaryFyWorkspace({super.key});

  @override
  State<SummaryFyWorkspace> createState() => _SummaryFyWorkspaceState();
}

class _SummaryFyWorkspaceState extends State<SummaryFyWorkspace> {
  TextEditingController contentController = TextEditingController();
  final _formValidatorKey = GlobalKey<FormState>();
  late Box workspaceBox;

  @override
  void initState() {
    super.initState();
    workspaceBox = Hive.box('workspace');
  }

  String? checkUserWorkspaceInput({required String? userInput}) {
    if (userInput == null || userInput.isEmpty) {
      return 'This filed is required';
    } else if (userInput.length > 8) {
      return 'Maximum 6 characters allowed';
    } else if (userInput.contains(" ")) {
      return 'No space allowed';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              Gap(height * 0.02),
              Text(
                "Create a workspace to continue",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Gap(height * 0.17),
              Text(
                "New Workspace ! ",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Gap(height * 0.05),
              Container(
                child: Form(
                  key: _formValidatorKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: TextFormField(
                    validator: (value) {
                      return checkUserWorkspaceInput(
                        userInput: value,
                      );
                    },
                    controller: contentController,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: SummaryfyColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: "Workspace Name ...",
                      hintStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 13,
                        color: Colors.grey,
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
                color: Colors.grey.withOpacity(0.06),
              ),
              Gap(height * 0.05),
              GestureDetector(
                onTap: () {
                  if (_formValidatorKey.currentState!.validate()) {
                    workspaceBox.put(
                      "Workspace Name",
                      contentController.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SummaryFyBottomNavBarController();
                      }),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please Fill correctly the field"),
                        backgroundColor: SummaryfyColors.color_1,
                        duration: Duration(
                          seconds: 1,
                        ),
                      ),
                    );
                  }
                },
                child: customButton(
                  child: Text(
                    "Create Workspace",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: SummaryfyColors.primaryColor,
                ),
              ),
              Gap(height * 0.17),
              Text(
                "By tapping continue, you accept our Terms and",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Gap(height * 0.01),
              Text(
                "Conditions and Privacy Policy",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
