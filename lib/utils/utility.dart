// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class Utility {
  final Color? color;
  Utility({
    this.color,
  });

  Widget alignedCircle(
      BuildContext context, double start, double y, double divisionFactor) {
    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: MediaQuery.of(context).size.width / divisionFactor,
        width: MediaQuery.of(context).size.width / divisionFactor,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  Widget backDropFilter(double x, double y) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
      child: Container(),
    );
  }

  Widget passwordIndicator( {required BuildContext context, required bool containsUpperCase,
  required bool containsLowerCase,
  required bool containsNumber ,
  required bool containsSpecialChar ,
  required bool contains8Length }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "⚈  1 uppercase",
              style: TextStyle(
                  color: containsUpperCase
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              "⚈  1 lowercase",
              style: TextStyle(
                  color: containsLowerCase
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              "⚈  1 number",
              style: TextStyle(
                  color: containsNumber
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "⚈  1 special character",
              style: TextStyle(
                  color: containsSpecialChar
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              "⚈  8 minimum character",
              style: TextStyle(
                  color: contains8Length
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ],
    );
  }
}
