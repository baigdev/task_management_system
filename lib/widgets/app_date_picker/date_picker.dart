import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constant/constant.dart';
import '../../utils/theme/app_theme.dart';
import '../input_fields/app_input_field.dart';

class AppDatePicker extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool isFieldRequired;
  final String? Function(String?)? inputValidator;
  final String initialText;
  final DateFormat? format;
  final Widget? suffixWidget;
  final FocusNode? node;
  final VoidCallback? onDateSelected;
  const AppDatePicker(
      {super.key,
      this.hintText,
      required this.initialText,
      this.isFieldRequired = false,
      this.inputValidator,
      this.format,
      this.suffixWidget,
      this.node,
      required this.controller,
      this.onDateSelected});

  @override
  AppDatePickerState createState() => AppDatePickerState();
}

class AppDatePickerState extends State<AppDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(4000),
      builder: (context, child) {
        return Theme(
          data: AppTheme().kDarkTheme.copyWith(
                datePickerTheme: DatePickerThemeData(
                  todayBackgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  todayForegroundColor:
                      MaterialStatePropertyAll(AppColors().primary),
                  rangePickerHeaderForegroundColor: AppColors().primary,
                  rangePickerElevation: 0,
                  rangePickerHeaderBackgroundColor: AppColors().primary,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = widget.format?.format(picked) ??
            AppUtils().appDateFormat().format(picked);
        widget.onDateSelected?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      onTap: () => _selectDate(context),
      isFieldReadOnlyForOnTap: true,
      suffixWidget: widget.suffixWidget ?? const SizedBox.shrink(),
      controller: widget.controller,
      inputFocusNode: widget.node ?? FocusNode(),
      inputFormatters: const [],
      inputValidator: widget.inputValidator,
      textInputType: TextInputType.name,
      inputHint: widget.hintText,
      inputLabel: widget.initialText,
    );
  }
}
