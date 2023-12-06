import 'package:hive/hive.dart';

part 'summarize_text_model.g.dart';

@HiveType(typeId: 1)
class SummarizeTextSave extends HiveObject {
  @HiveField(0)
  String summrizeTitle;
  @HiveField(1)
  String summarizeTextResult;

  SummarizeTextSave({
    required this.summrizeTitle,
    required this.summarizeTextResult,
  });
}
