import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

getDescWhite(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 10.0),
          Condition.equals(name: TABLET, value: 12.0),
          Condition.equals(name: DESKTOP, value: 14.0),
          Condition.largerThan(name: MOBILE, value: 16.0),
        ],
        defaultValue: 10.0,
      ).value,
      color: Colors.white);
}

getDescBlack(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 10.0),
          Condition.equals(name: TABLET, value: 12.0),
          Condition.equals(name: DESKTOP, value: 14.0),
          Condition.largerThan(name: MOBILE, value: 16.0),
        ],
        defaultValue: 10.0,
      ).value,
      color: Colors.black);
}

getBodyBlack(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 12.0),
          Condition.equals(name: TABLET, value: 14.0),
          Condition.equals(name: DESKTOP, value: 16.0),
          Condition.largerThan(name: MOBILE, value: 18.0),
        ],
        defaultValue: 12.0,
      ).value,
      color: Colors.black);
}

getBodyWhite(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 12.0),
          Condition.equals(name: TABLET, value: 14.0),
          Condition.equals(name: DESKTOP, value: 16.0),
          Condition.largerThan(name: MOBILE, value: 18.0),
        ],
        defaultValue: 12.0,
      ).value,
      color: Colors.white);
}
