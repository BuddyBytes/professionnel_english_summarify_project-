import 'package:flutter/material.dart';
import 'package:summarify/constants/colors/colors.dart';

Widget customInputField({
  required TextEditingController contentController,
  required String? checkFormstate(String? input),
}) {
  return TextFormField(
    validator: (value) {
      return checkFormstate(value);
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
    ),
  );
}
