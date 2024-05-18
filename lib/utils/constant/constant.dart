import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/responsive.dart';

enum BuildFlavor { staging, production }

const String _jsonDirectory = "assets/json";
const String _fontsDirectory = "assets/fonts";
const String _iconsDirectory = "assets/icons";
const String _settingIconsDirectory = "assets/icons/settings_icon";
const String _imagesDirectory = "assets/images";

class AppImages {
  static final AppImages _instance = AppImages._internal();
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory AppImages() {
    return _instance;
  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  AppImages._internal();
}

class AppFonts {
  static final AppFonts _instance = AppFonts._internal();

  factory AppFonts() {
    return _instance;
  }

  AppFonts._internal();
}

class AppFontWeight {
  static final AppFontWeight _instance = AppFontWeight._internal();
  factory AppFontWeight() {
    return _instance;
  }
  AppFontWeight._internal();
  FontWeight black = FontWeight.w900;
  FontWeight bold = FontWeight.w700;
  FontWeight medium = FontWeight.w500;
  FontWeight regular = FontWeight.w400;
  FontWeight light = FontWeight.w300;
}

class AppJson {
  static final AppJson _instance = AppJson._internal();
  factory AppJson() {
    return _instance;
  }

  AppJson._internal();
  String get appLightThemeJson => "$_jsonDirectory/app_light_theme.json";
}

class AppUtils {
  static final AppUtils _instance = AppUtils._internal();
  factory AppUtils() {
    return _instance;
  }

  AppUtils._internal();

  static const String dateFormatter = "dd-MM-yyyy";
  BuildFlavor currentBuildFlavor = BuildFlavor.staging;

  static const double paddingAllSides = 10;
  static const double paddingVertical = 15;
  static const double paddingHorizontal = 20;
  static const double paddingCard = 8;
  static const double appTextFieldPadding = 20;
  static const double appBorderWidth = 0.7;
  static BorderRadius kBorderRadiusCircular = BorderRadius.circular(15);

  static SizedBox sizedBoxHeight(
    BuildContext context, {
    double defaultValue = 20,
  }) =>
      SizedBox(
        height: getResponsiveValue(
          context,
          defaultValue,
        ),
      );

  static SizedBox sizedBoxWidth(
    BuildContext context, {
    double defaultValue = 15,
  }) =>
      SizedBox(
        width: getResponsiveValue(
          context,
          defaultValue,
        ),
      );

  DateFormat appDateFormat() {
    return DateFormat("dd/MM/yyyy");
  }
}

class AppColors {
  static final AppColors _instance = AppColors._internal();
  factory AppColors() {
    return _instance;
  }
  AppColors._internal();

  //==================== Main Colors ===========================================
  Color primary = const Color.fromARGB(150, 123, 0, 245);
  Color appWhiteColor = Colors.white;
  Color appGreen = Colors.green;
  Color onBackGround = Colors.black45;
  Color error = Colors.red;
  //============================================================================

  //==================== Text Colors ===========================================
  //============================================================================
  //==================== Other Colors ==========================================
//==============================================================================
}

class SupportedLanguageLocales {
  static const String engLangCode = "en";
}

class AppStrings {
  static String notConnectedToInternet =
      "It seems that your device is not connected to the network.please check your internet connectivity or try again later.";
  static String serverNotReachable =
      "It seems that the server is not reachable at the moment,try again later.If the issue persist please reach out to the developer at a@b.com";
  static String unknownError = "Something went wrong";
}
