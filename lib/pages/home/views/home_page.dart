import 'package:flutter/material.dart';
import 'package:leaflite/authentication/providers/auth_provider.dart';
import 'package:leaflite/authentication/providers/user_provider.dart';
import 'package:leaflite/navigation/navigation_provider.dart';
import 'package:leaflite/pages/login/login.dart';
import 'package:leaflite/pages/plant_list/views/plant_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    void onItemTapped(int index) {
      setState(() {
        navigationProvider.setIndex(index);
      });
    }

    if (!authProvider.isLoggedIn) {
      return LoginPage();
    } else {
      userProvider.initUser();
    }

    return Scaffold(
      body: navigationProvider.screens[navigationProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), 
            label: 'Settings'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile'
          ),
        ]
      ),
    );
  }
}