import 'package:flutter/cupertino.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';

import '../constant/constant.dart';

class ThemeConstants {
  static final ThemeConstants _instance = ThemeConstants._internal();

  factory ThemeConstants() {
    return _instance;
  }

  ThemeConstants._internal();

  TextStyle? bold14(BuildContext context) {
    return context.theme.textTheme.labelMedium
        ?.copyWith(fontWeight: AppFontWeight().bold);
  }

  TextStyle? regular12(BuildContext context) {
    return context.theme.textTheme.labelMedium
        ?.copyWith(fontWeight: AppFontWeight().regular);
  }

  TextStyle? regular14(BuildContext context) {
    return context.theme.textTheme.bodyMedium
        ?.copyWith(fontWeight: AppFontWeight().regular);
  }

  TextStyle? regular10(BuildContext context) {
    return context.theme.textTheme.bodySmall
        ?.copyWith(fontWeight: AppFontWeight().regular);
  }
}
