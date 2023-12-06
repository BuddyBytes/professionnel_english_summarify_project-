part of 'summarize_text_model.dart';

class SummarizeTextSaveAdapter extends TypeAdapter<SummarizeTextSave> {
  @override
  final int typeId = 1;

  @override
  SummarizeTextSave read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SummarizeTextSave(
      summrizeTitle: fields[0] as String,
      summarizeTextResult: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SummarizeTextSave obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.summrizeTitle)
      ..writeByte(1)
      ..write(obj.summarizeTextResult);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SummarizeTextSaveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
