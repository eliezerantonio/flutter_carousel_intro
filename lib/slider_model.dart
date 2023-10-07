import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  late PageController pageViewController = PageController();
  double _currentPage = 0.0;

//colors
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }
}
