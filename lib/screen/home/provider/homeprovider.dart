import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final List<Map<String, String>> appsData = [
    {
      'name': 'Google',
      'logo': 'lib/asset/logo/google.png',
      'url': 'https://www.google.com'
    },
    {
      'name': 'Opera',
      'logo': 'lib/asset/logo/opera.png',
      'url': 'https://www.opera.com'
    },
    {
      'name': 'UC Browser',
      'logo': 'lib/asset/logo/uc_browser.jpg',
      'url': 'https://www.ucweb.com'
    },
    {
      'name': 'Microsoft Edge',
      'logo': 'lib/asset/logo/m.png',
      'url': 'https://www.microsoft.com'
    }
  ];

  int index = 0;
  double progressValue = 0;

  void indexSave(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void changeProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }
}
