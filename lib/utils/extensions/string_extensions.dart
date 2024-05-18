import 'package:flutter/cupertino.dart';

extension CustomStringExtensions on String {
  String? capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get convertRoutePathToRouteName => replaceAll("/", "");
}

extension StringValidations on String? {
  bool get isTextNullAndEmpty => this == null || this?.isEmpty == true;

  bool get isTextNotNullAndNotEmpty =>
      this != null && this?.isNotEmpty == true && !(this!.contains("null"));

  String? validateEmpty(BuildContext context) {
    String text = this != null ? this!.trim() : '';

    if (this == null || text.isEmpty) {
      return 'required *';
    } else {
      return null;
    }
  }
}
