import 'package:flutter/material.dart';
import 'package:task_management_system/utils/constant/constant.dart';

class ScreenProgressLoader extends StatelessWidget {
  const ScreenProgressLoader(
      {Key? key, this.message, this.showBgContainer = true, this.progressColor})
      : super(key: key);
  final String? message;
  final bool showBgContainer;
  final Color? progressColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IgnorePointer(
        ignoring: false,
        child: Center(
          child: CCProgressLoader(
            message: message,
            showBgContainer: showBgContainer,
            progressColor: progressColor,
            // themeData: themeData,
          ),
        ),
      ),
    );
    // }
    // );
  }
}

class CCProgressLoader extends StatelessWidget {
  const CCProgressLoader(
      {Key? key,
      this.message,
      this.themeData,
      this.showBgContainer = true,
      this.progressColor})
      : super(key: key);
  final String? message;
  final ThemeData? themeData;
  final bool showBgContainer;
  final Color? progressColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: showBgContainer ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 3,
            color: progressColor ?? AppColors().primary,
          ),
          message != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    message ?? '',
                    // style: themeData!.textTheme.headline1,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
