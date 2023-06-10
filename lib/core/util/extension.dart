import 'package:flutter/material.dart';

extension AppX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  Future<dynamic> push(Widget screen) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  Future<dynamic> pushAndRemoveUntil(Widget screen) =>
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => screen), (_) => false);
}
