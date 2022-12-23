import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0.0;

//colors
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.grey;

//dots
  double primaryBullet = 20;
  double secondaryBullet = 14;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }
}
