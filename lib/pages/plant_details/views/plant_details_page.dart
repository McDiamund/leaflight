import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlantDetailsPage extends StatefulWidget {

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                        child: Icon(Icons.close)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Acoma Crape Myrtle', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .4,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // Same value as container's borderRadius
                      child: Image(
                        image: AssetImage('assets/plant-default.png'),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .45,
                          height: MediaQuery.of(context).size.height * .4,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height * .1,
                                    child: CustomPaint(
                                      painter: WavePainter(color: Color.fromARGB(255, 100, 204, 220)),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width * .45,
                                        height: MediaQuery.of(context).size.height * .4 * .45,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 100, 204, 220)
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Moisture', style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Icon(Icons.water_drop_rounded, size: 50, color: Colors.white,),
                                        Spacer(),
                                        Text('10%', style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .45,
                          height: MediaQuery.of(context).size.height * .4,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 85, 55, 45),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Status:', style: TextStyle(color: Colors.white)),
                                  Text('Critical', style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold)),
                                  Text('Your plant\'s water level is critically low. Please water your soil.', style: TextStyle(color: Colors.white,)),
                                  SizedBox(height: 30),
                                  Center(
                                    child: Icon(Icons.battery_1_bar_rounded, color: Colors.white, size: 100,)
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 95, 85),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Remove Plant', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Color color;

  WavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint wavePaint = Paint()..color = color;
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}