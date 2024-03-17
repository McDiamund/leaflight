import 'package:flutter/material.dart';
import 'package:leaflite/pages/add_device/add_device.dart';
import 'package:leaflite/pages/plant_details/views/plant_details_page.dart';

class PlantListPage extends StatelessWidget {
  final List<String> plants = [
    'Rose',
    'Lily',
    'Tulip',
    'Orchid',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                          builder: (context) => ScanDevicesPage()
                        )
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.add), 
                        Text('Add a new plant')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PlantDetailsPage())
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  color: Colors.red,
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acoma Crape Myrtle', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Text('Moisture:'),
                        Text(' 10%')
                      ],
                    )
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PlantDetailsPage())
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  color: Colors.red,
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Acoma Crape Myrtle', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Text('Moisture:'),
                        Text(' 10%')
                      ],
                    )
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
