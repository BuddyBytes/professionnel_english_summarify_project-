import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/db/summarize_text_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:gap/gap.dart';

class SummaryFyShowSummarizeText extends StatefulWidget {
  const SummaryFyShowSummarizeText({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<SummaryFyShowSummarizeText> createState() =>
      _SummaryFyShowSummarizeTextState();
}

class _SummaryFyShowSummarizeTextState
    extends State<SummaryFyShowSummarizeText> {
  late Box<SummarizeTextSave> summarizeBox;
  @override
  void initState() {
    super.initState();
    summarizeBox = Hive.box<SummarizeTextSave>("SumResult");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FluentIcons.arrow_step_back_20_regular)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Title : " +
                    summarizeBox.getAt(widget.index)!.summrizeTitle.toString(),
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Gap(60),
              Text(
                "The Summarized Text : \n\n" +
                    summarizeBox
                        .getAt(widget.index)!
                        .summarizeTextResult
                        .toString(),
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
