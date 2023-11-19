import 'package:flutter/widgets.dart' show BuildContext, MediaQuery, Size;

extension ResponsiveExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  bool get smallScreen => screenSize.width < 850;

  bool get mediumScreen => screenSize.width < 1400 && screenSize.width >= 850;

  bool get largeScreen => screenSize.width >= 1400;
}
