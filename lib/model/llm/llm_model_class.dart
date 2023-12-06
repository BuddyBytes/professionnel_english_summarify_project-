class SummaryResponse {
  final String summaryText;

  SummaryResponse({required this.summaryText});

  factory SummaryResponse.fromJson(Map<String, dynamic> json) {
    return SummaryResponse(
      summaryText: json['summary_text'],
    );
  }
}
