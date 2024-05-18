import 'package:flutter/material.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';

import '../../utils/constant/constant.dart';
import '../../utils/theme/theme_constant.dart';
import '../app_label/app_label.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.customWidth,
    this.customHeight,
    this.filledColor,
    this.enableBorder = false,
    this.isFlexible = false,
    this.showLoader = false,
    this.filled = false,
    this.borderColor,
    this.labelColor,
    this.backGroundColor,
    this.enableElevation = true,
  });

  final String buttonLabel;
  final VoidCallback? onPressed;
  final double? customHeight;
  final double? customWidth;
  final Color? filledColor;
  final bool? enableBorder;
  final bool? isFlexible;
  final bool showLoader;
  final bool filled;
  final Color? borderColor;
  final Color? labelColor;
  final Color? backGroundColor;
  final bool? enableElevation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: customWidth,
      child: ElevatedButton(
        onPressed: showLoader
            ? null
            : () {
                if (FocusManager.instance.primaryFocus?.hasFocus == true) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
                onPressed?.call();
              },
        statesController: MaterialStatesController(),
        style: filled
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    filledColor ?? AppColors().primary),
              )
            : enableBorder == true
                ? context.theme.elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                        backGroundColor ?? AppColors().onBackGround),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                            color: borderColor ?? AppColors().primary,
                            width: AppUtils.appBorderWidth),
                      ),
                    ),
                  )
                : context.theme.elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                        backGroundColor ?? AppColors().onBackGround),
                    elevation: MaterialStatePropertyAll(
                      (enableElevation == true
                          ? context.theme.elevatedButtonTheme.style!.elevation
                          : 0.0) as double?,
                    )),
        child: showLoader
            ? const CircularProgressIndicator()
            : AppLabel(
                textAlign: TextAlign.center,
                text: buttonLabel,
                style: ThemeConstants().regular12(context)?.copyWith(
                    color: enableBorder == true
                        ? labelColor ?? AppColors().primary
                        : AppColors().appWhiteColor),
              ),
      ),
    );
  }
}
