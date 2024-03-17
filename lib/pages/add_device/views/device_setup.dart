import 'package:flutter/material.dart';
import 'package:leaflite/components/primary_button.dart';
import 'package:leaflite/components/primary_textfield.dart';

class DeviceSetupPage extends StatefulWidget {

  @override
  State<DeviceSetupPage> createState() => _DeviceSetupPageState();
}

class _DeviceSetupPageState extends State<DeviceSetupPage> {
  TextEditingController nameController = TextEditingController();

  setupDevice() {}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 5, top: 5),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 30,
                    height: 30,
                  ),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close)),
              ],
            ),
          ),
          const SizedBox(height: 110),
          Column(
            children: [
              const Icon(Icons.devices_outlined, size: 90,),
              const Text('Setup your leaflite device', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 10),
                child: PrimaryTextField(
                  controller: nameController, 
                  hintText: 'name', 
                  obscureText: false
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PrimaryButton(
                  onTap: setupDevice,
                  buttonText: 'ADD DEVICE',
                  color: const Color.fromARGB(255, 55, 129, 57),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}