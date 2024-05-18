import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';
import 'package:task_management_system/utils/extensions/number_extensions.dart';

import '../../utils/constant/constant.dart';
import '../../utils/theme/theme_constant.dart';
import '../app_label/app_label.dart';
import '../responsive.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.controller,
    required this.inputValidator,
    required this.inputFocusNode,
    required this.inputLabel,
    required this.textInputType,
    this.onEditingComplete,
    this.prefixWidget = const SizedBox.shrink(),
    this.suffixWidget = const SizedBox.shrink(),
    this.obSecurePasswordText = false,
    this.isInputFieldEnabled = true,
    this.onChanged,
    this.customHeight,
    this.customWidth,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.inputHint,
    this.onTap,
    this.isFieldReadOnlyForOnTap = false,
    required this.inputFormatters,
    this.decoration,
    this.cursorColor,
    this.showLabel = true,
    this.cursorHeight,
    this.textAlignVertical,
    this.inputAction,
    this.hasError = false,
    this.floatingLabelBehavior,
    this.prefixIcon,
    this.labelStyle,
    this.helperText,
    this.hintStyle,
    this.textCapitalization,
  });

  final TextEditingController controller;
  final String? Function(String?)? inputValidator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final FocusNode inputFocusNode;
  final String inputLabel;
  final Widget suffixWidget;
  final Widget prefixWidget;
  final bool obSecurePasswordText;
  final bool isInputFieldEnabled;
  final List<TextInputFormatter> inputFormatters;
  final double? customHeight;
  final double? customWidth;
  final TextInputType textInputType;
  final int? maxLines;
  final String? inputHint;
  final VoidCallback? onTap;
  final bool isFieldReadOnlyForOnTap;
  final bool? showLabel;
  final double? cursorHeight;
  final TextAlignVertical? textAlignVertical;
  final TextInputAction? inputAction;
  final void Function()? onEditingComplete;
  final InputDecoration? decoration;
  final Color? cursorColor;
  final bool? hasError;
  final Widget? prefixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? hintStyle;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: inputAction,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      validator: inputValidator,
      controller: controller,
      focusNode: inputFocusNode,
      onTap: onTap,
      readOnly: isFieldReadOnlyForOnTap,
      obscureText: obSecurePasswordText,
      inputFormatters: inputFormatters,
      enabled: isInputFieldEnabled,
      keyboardType: textInputType,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: ThemeConstants().regular14(context)?.copyWith(
            fontWeight: FontWeight.w400,
          ),
      decoration: (decoration ?? const InputDecoration())
          .applyDefaults(
            context.theme.inputDecorationTheme,
          )
          .copyWith(
            helperText: helperText,
            floatingLabelBehavior: floatingLabelBehavior,
            isDense: true,
            errorStyle: ThemeConstants()
                .regular14(context)
                ?.copyWith(color: AppColors().error),
            constraints: BoxConstraints(
              minHeight: getResponsiveValue(context, 45.ptToPx()),
              maxWidth: context.screenWidth > 700 && context.screenWidth < 1200
                  ? customWidth ?? context.screenWidth
                  : customWidth ?? context.screenWidth,
            ),
            errorMaxLines: 5,
            label: AppLabel(
              text: inputLabel,
              style: labelStyle ??
                  ThemeConstants().regular10(context)?.copyWith(
                      color: AppColors().appWhiteColor.withOpacity(0.6)),
            ),
            hintText: inputHint,
            hintStyle: hintStyle ??
                ThemeConstants().regular14(context)?.copyWith(
                      color: AppColors().appWhiteColor.withOpacity(0.5),
                    ),
            suffixIcon: suffixWidget,
            prefix: prefixWidget,
            prefixIcon: prefixIcon,
          ),
    );
  }
}
