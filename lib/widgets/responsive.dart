import 'package:flutter/widgets.dart';

double getResponsiveValue(BuildContext context, double baseValue) {
  final screenWidth = MediaQuery.of(context).size.width;

  // Define scaling factors for different screen widths
  // Adjust these values to suit your design preferences
  if (screenWidth < 600) {
    // Small screen size
    return baseValue * 0.8;
  } else if (screenWidth >= 600 && screenWidth < 1200) {
    // Medium screen size
    return baseValue;
  } else {
    if (screenWidth > 2000) {
      return baseValue * 2.5;
    }
    // Large screen size
    return baseValue * 1.2;
  }
}

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({
    Key? key,
    this.mobile,
    this.desktop,
    this.tablet,
  }) : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        if (width < 700) {
          return mobile ??
              const Center(
                child: Text(
                  "Mobile View",
                ),
              );
        } else if (width > 700 && width < 1200) {
          return tablet ??
              const Center(
                child: Text(
                  "Tablet View",
                ),
              );
        } else {
          return desktop ??
              tablet ??
              const Center(
                child: Text(
                  "Desktop View",
                ),
              );
        }
      },
    );
  }
}
