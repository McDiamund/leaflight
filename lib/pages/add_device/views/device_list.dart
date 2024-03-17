import 'package:flutter/material.dart';
import 'package:leaflite/pages/add_device/add_device.dart';

class DeviceListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.0, left: 5, top: 5),
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
                    child: Icon(Icons.close)),
              ],
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Devices Found',
              style: TextStyle(fontSize: 18),
            ),
          )),
          Container(
            color: Color.fromARGB(255, 233, 233, 233),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeviceSetupPage())
                    );
                  },
                  child: const ListTile(
                    title: Text(
                      'LLMS_00001',
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
