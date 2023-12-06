import 'package:dio/dio.dart';
import 'dart:convert';

Future<Response> makeRequest({
  required String llmText,
}) async {
  Dio dio = Dio();
  var url = 'https://proeng.dadahoualid.repl.co/query';
  var data = {
    'inputs': llmText,
  };

  Response response = await dio.post(
    url,
    data: jsonEncode(data),
    options: Options(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ),
  );

  return response;
}
