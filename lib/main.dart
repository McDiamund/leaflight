import 'package:flutter/material.dart';
import 'package:leaflite/navigation/navigation_provider.dart';
import 'package:leaflite/pages/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 55, 129, 57),
        ),
        home: HomePage(),
      ),
    );
  }
}
