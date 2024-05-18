import 'package:flutter/material.dart';

import '../../utils/theme/theme_constant.dart';

class AppLabel extends StatelessWidget {
  /// Default Values..
  /// Style : Regular 12.
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const AppLabel({
    required this.text,
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? ThemeConstants().regular12(context),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
