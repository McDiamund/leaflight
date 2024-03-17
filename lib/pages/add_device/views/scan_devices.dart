import 'package:flutter/material.dart';

class ScanDevicesPage extends StatefulWidget {
  @override
  State<ScanDevicesPage> createState() => _ScanDevicesPageState();
}

class _ScanDevicesPageState extends State<ScanDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
          SizedBox(height: 110),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_tethering, size: 90,),
              Text('Scanning for device...', style: TextStyle(fontSize: 20),)
            ],
          )
        ]),
      ),
    );
  }
}
