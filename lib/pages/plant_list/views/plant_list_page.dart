import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leaflite/devices/domain/models/device.dart';
import 'package:leaflite/devices/domain/service/devices_service.dart';
import 'package:leaflite/pages/add_device/add_device.dart';
import 'package:leaflite/pages/plant_details/views/plant_details_page.dart';

class PlantListPage extends StatefulWidget {
  @override
  State<PlantListPage> createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  bool isLoading = false;

  List<Device> _devices = [];

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  Future<void> getDevices() async {
    try {
      setState(() {
        isLoading = true;
      });

      final devicesResponse = await DevicesService.getDevices();
      final devicesData = await jsonDecode(devicesResponse);

      List<Device> deviceObjects = [];

      for (var objectsData in devicesData['devices']) {
        final device = Device.fromJson(objectsData);
        deviceObjects.add(device);
      }

      if (mounted) {
        setState(() {
          _devices = deviceObjects;
          isLoading = false;
        });
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.toString()),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeviceSetupPage()));
                        },
                        child: const Row(
                          children: [Icon(Icons.add), Text('Add a new plant')],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                if (_devices.isEmpty) ...[
                  const SizedBox(height: 115),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.devices, size: 80,),
                        Text('No Devices Found.', style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  )
                ],
                Flexible(
                  child: ListView.builder(
                      itemCount: _devices.length,
                      itemBuilder: (context, index) {
                        final device = _devices[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlantDetailsPage(id: device.id,title: device.name, water_level: device.water_level,)));
                          },
                          child: ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                color: Color.fromRGBO(
                                  Random().nextInt(256), // Random red value
                                  Random().nextInt(256), // Random green value
                                  Random().nextInt(256), // Random blue value
                                  1, // Alpha value (1 is fully opaque)
                                )),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  device.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text('Moisture: '),
                                    Text('${device.water_level * 100}%')
                                  ],
                                )
                              ],
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          if (isLoading) ...[
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Color.fromRGBO(72, 72, 72, 0.498),
                    child: Center(child: CircularProgressIndicator())))
          ]
        ],
      ),
    );
  }
}
