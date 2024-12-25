import 'package:flutter/material.dart';

import '../screens/Home/home_screen.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void setCategories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }
}
