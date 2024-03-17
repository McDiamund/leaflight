import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leaflite/components/primary_button.dart';
import 'package:leaflite/components/primary_textfield.dart';

class ProfilePage extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void profile() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                    color: Color.fromRGBO(
                      Random().nextInt(256), // Random red value
                      Random().nextInt(256), // Random green value
                      Random().nextInt(256), // Random blue value
                      1, // Alpha value (1 is fully opaque)
                    ),
                      borderRadius: BorderRadius.circular(150)
                    ),
                    child: Icon(Icons.account_circle, color: Colors.white, size: 90,),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Elias Treadway', style: TextStyle(fontSize: 20)),
                const Text('eliastreadwayofficial@gmail.com'),
                const SizedBox(height: 30),
                // InkWell(
                //   onTap: () {
                    
                //   },
                //   child: ListTile(
                //     leading: Container(
                //       decoration: BoxDecoration(
                //         color: Color.fromARGB(255, 209, 209, 209),
                //         borderRadius: BorderRadius.circular(20)
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Icon(Icons.settings),
                //       ),
                //     ),
                //     title: Text('Settings'),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    
                  },
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 209, 209, 209),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.logout),
                      ),
                    ),
                    title: Text('Logout', style: TextStyle(color: Colors.red),),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
