import 'package:flutter/material.dart';
import 'package:summarify/constants/colors/colors.dart';

Widget customButton({
  required Text child,
  required Color backgroundColor,
}) {
  return Container(
    width: 300,
    height: 45,
    child: Center(
      child: child,
    ),
    decoration: BoxDecoration(
      color: SummaryfyColors.primaryColor,
      borderRadius: BorderRadius.circular(11),
    ),
  );
}
