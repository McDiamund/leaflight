import 'package:flutter/material.dart';
import 'package:leaflite/components/primary_button.dart';
import 'package:leaflite/components/primary_textfield.dart';

class DeviceSetupPage extends StatefulWidget {

  @override
  State<DeviceSetupPage> createState() => _DeviceSetupPageState();
}

class _DeviceSetupPageState extends State<DeviceSetupPage> {
  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  setupDevice() {
    
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                const Text('Enter the code of your Leaflite device', style: TextStyle(fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controllers.length,
                      (index) => Container(
                        width: 50.0,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextField(
                          controller: controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          onChanged: (value) {
                            if (value.length == 1 && index < controllers.length - 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
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
      ),
    );
  }
}