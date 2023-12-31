import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:summarify/constants/colors/colors.dart';
import 'package:gap/gap.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:summarify/view/summarize.dart';
import 'package:summarify/view/summarize_show.dart';

import '../../model/db/summarize_text_model.dart';

class SummaryFyHomeScreen extends StatefulWidget {
  const SummaryFyHomeScreen({super.key});

  @override
  State<SummaryFyHomeScreen> createState() => _SummaryFyHomeScreenState();
}

class _SummaryFyHomeScreenState extends State<SummaryFyHomeScreen> {
  List<String> chipLabels = [
    "All Files",
  ];

  late Box<SummarizeTextSave> summarizeBox;
  late Box workspaceBox;

  @override
  void initState() {
    super.initState();
    summarizeBox = Hive.box<SummarizeTextSave>("SumResult");
    workspaceBox = Hive.box('workspace');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 70,
          left: 25,
          right: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150,
              // color: SummaryfyColors.seconderyColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Workspace Name :\n\n " + workspaceBox.getAt(0),
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(height * 0.05),
                    Text(
                      "Summarize Number :\t\t\t" +
                          summarizeBox.values.length.toString(),
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: SummaryfyColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Gap(height * 0.05),
            Container(
              width: double.infinity,
              height: height * 0.05,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: chipLabels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 11.0,
                    ), // Adjust the value as needed
                    child: Chip(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: SummaryfyColors.color_1,
                      label: Text(
                        chipLabels[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: summarizeBox.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SummaryFyShowSummarizeText(index: index);
                          }),
                        );
                      },
                      child: ListTile(
                        leading: Text(
                          summarizeBox.getAt(index)!.summrizeTitle.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              summarizeBox.deleteAt(index).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Item Deleted Successfully",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    duration: Duration(seconds: 1),
                                    backgroundColor:
                                        SummaryfyColors.primaryColor,
                                  ),
                                );
                              });
                            });
                          },
                          child: Icon(
                            FluentIcons.delete_lines_20_filled,
                            color: Colors.white,
                          ),
                        ),
                        tileColor: SummaryfyColors.color_1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SummaryFySummarizeScreen();
          }));
        },
        elevation: 0,
        backgroundColor: SummaryfyColors.primaryColor,
        child: Icon(
          FluentIcons.add_square_multiple_24_regular,
        ),
        foregroundColor: Colors.white,
      ),
    );
  }
}
