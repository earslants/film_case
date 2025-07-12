import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;

  EdgeInsets symmetricPadding(double? vertical, double? horizontal) =>
      EdgeInsets.symmetric(
          vertical: vertical ?? 0, horizontal: horizontal ?? 0);
}
