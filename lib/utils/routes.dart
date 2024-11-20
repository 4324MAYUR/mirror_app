import 'package:flutter/material.dart';

import '../screen/home/screen/home.dart';
import '../screen/webview/screen/wedviewscreen.dart';

class AllRoutes {
  static String home = "home";
  static String wedView = "wedView";

  static Map<String, WidgetBuilder> appRoutes = {
    "home": (context) => const HomeScreen(),
    "wedView": (context) => const WebViewScreen(),
  };
}
