import 'package:flutter/material.dart';
import 'package:leaflite/pages/page_list/views/page_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 55, 129, 57),
      ),
      home: PageList(),
    );
  }
}
