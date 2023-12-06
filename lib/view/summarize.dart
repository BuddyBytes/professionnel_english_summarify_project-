import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summarify/model/db/summarize_text_model.dart';
import 'package:summarify/model/llm/llm_model.dart';
import 'package:summarify/view/bottom_controller.dart';
import '../common/button.dart';
import '../constants/colors/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:hive/hive.dart';

import '../model/llm/llm_model_class.dart';

class SummaryFySummarizeScreen extends StatefulWidget {
  const SummaryFySummarizeScreen({super.key});

  @override
  State<SummaryFySummarizeScreen> createState() =>
      _SummaryFySummarizeScreenState();
}

class _SummaryFySummarizeScreenState extends State<SummaryFySummarizeScreen> {
  TextEditingController summarizeController = TextEditingController();
  TextEditingController filecontroller = TextEditingController();
  bool isLoading = false;
  final _formValidatorKey = GlobalKey<FormState>();

  String? checkUserWorkspaceInput({required String? userInput}) {
    if (userInput == null || userInput.isEmpty) {
      return 'This filed is required';
    } else if (userInput.length > 15) {
      return 'Maximum 10 characters allowed';
    }
    return null;
  }

  void getLLMresponse({
    required String llmText,
  }) async {
    try {
      var response = await makeRequest(
        llmText: llmText,
      );

      if (response.data is List) {
        for (var item in response.data) {
          var summaryResponse = SummaryResponse.fromJson(item);
          setState(() {
            isLoading = true;
            summarizeController.text = summaryResponse.summaryText;
          });
        }
      } else if (response is Map) {
        var summaryResponse = SummaryResponse.fromJson(response.data);
        setState(() {
          isLoading = true;
          summarizeController.text = summaryResponse.summaryText;
        });
      } else {
        print("error");
      }
    } catch (e) {
      throw "error";
    }
  }

  late Box<SummarizeTextSave> summarizeBox;
  @override
  void initState() {
    summarizeBox = Hive.box<SummarizeTextSave>("SumResult");
    super.initState();
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(FluentIcons.arrow_step_back_20_regular),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (summarizeController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("There is nothing to save yet "),
                            backgroundColor: SummaryfyColors.color_1,
                            duration: Duration(
                              seconds: 1,
                            ),
                          ),
                        );
                      } else {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          elevation: 0,
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Container(
                                  height: height * 0.4,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          "Enter A title",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            child: Form(
                                              key: _formValidatorKey,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              child: TextFormField(
                                                validator: (value) {
                                                  return checkUserWorkspaceInput(
                                                    userInput: value,
                                                  );
                                                },
                                                controller: filecontroller,
                                                style: TextStyle(
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                cursorColor: SummaryfyColors
                                                    .primaryColor,
                                                decoration: InputDecoration(
                                                  hintText: "file name ...",
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            color:
                                                Colors.grey.withOpacity(0.06),
                                          ),
                                        ),
                                        Gap(height * 0.02),
                                        GestureDetector(
                                          onTap: () {
                                            if (_formValidatorKey.currentState!
                                                .validate()) {
                                              summarizeBox
                                                  .add(
                                                SummarizeTextSave(
                                                  summrizeTitle:
                                                      filecontroller.text,
                                                  summarizeTextResult:
                                                      summarizeController.text,
                                                ),
                                              )
                                                  .then((value) {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return SummaryFyBottomNavBarController();
                                                }));
                                              });
                                            }
                                          },
                                          child: customButton(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            backgroundColor:
                                                SummaryfyColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Icon(FluentIcons.save_copy_20_regular),
                  ),
                ],
              ),
              Gap(15),
              Container(
                width: double.infinity,
                height: height * 0.75,
                child: TextFormField(
                  controller: summarizeController,
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

              Gap(20),
              // Add this line
              GestureDetector(
                onTap: () {
                  if (summarizeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("There is nothing to summarize "),
                        backgroundColor: SummaryfyColors.color_1,
                        duration: Duration(
                          seconds: 1,
                        ),
                      ),
                    );
                  } else {
                    getLLMresponse(
                      llmText: summarizeController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "please wait while process your requests ... "),
                        backgroundColor: SummaryfyColors.primaryColor,
                        duration: Duration(
                          seconds: 1,
                        ),
                      ),
                    );
                    if (isLoading == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Done"),
                          backgroundColor: SummaryfyColors.primaryColor,
                          duration: Duration(
                            seconds: 1,
                          ),
                        ),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                child: customButton(
                  child: Text(
                    "Summarize",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: SummaryfyColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
