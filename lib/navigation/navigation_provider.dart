
import 'package:flutter/material.dart';
import 'package:leaflite/pages/plant_list/views/plant_list_page.dart';
import 'package:leaflite/pages/profile/profile.dart';
import 'package:leaflite/pages/profile/views/views.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  void setIndex(index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<Widget> _screens = [
    Scaffold(),
    PlantListPage(),
    ProfilePage()
  ];

  List<Widget> get screens => _screens;
}