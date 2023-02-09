import 'package:flutter/material.dart';


// here we have 3 different types of layout: desktop, mobile and tablet
enum LayoutType { desktop, mobile, tablet }

typedef LayoutWidgetBuilder = Function(BuildContext context, LayoutType layout);

class ResponsiveLayoutBuilder extends StatelessWidget {
  final LayoutWidgetBuilder builder;
  const ResponsiveLayoutBuilder({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // the width of the screen < 500px: mobile, 500px < width < 1100: table, the other is desktop
      LayoutType type = constraints.maxWidth < 500
          ? LayoutType.mobile
          : constraints.maxWidth < 1100
              ? LayoutType.tablet
              : LayoutType.desktop;
      return builder(context, type);
    });
  }
}
