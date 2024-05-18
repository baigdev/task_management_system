import 'package:flutter/material.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';

import '../../utils/constant/constant.dart';
import '../../utils/theme/theme_constant.dart';
import 'app_input_field.dart';

class AppSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? onChanged;
  final FocusNode node;
  const AppSearchField(
      {super.key,
      required this.controller,
      required this.node,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      onChanged: onChanged,
      decoration: const InputDecoration().applyDefaults(
        context.theme.inputDecorationTheme.copyWith(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:
                BorderSide(width: 0.7, color: AppColors().appWhiteColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              width: 0,
              // color: AppColors().onBackground,
            ),
          ),
        ),
      ),
      prefixIcon: Icon(Icons.search),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      controller: controller,
      inputValidator: (v) => null,
      inputFocusNode: node,
      labelStyle: ThemeConstants()
          .regular14(context)
          ?.copyWith(color: AppColors().appWhiteColor),
      inputHint: "Search here...",
      inputLabel: "Search",
      textInputType: TextInputType.text,
      inputFormatters: [],
    );
  }
}
