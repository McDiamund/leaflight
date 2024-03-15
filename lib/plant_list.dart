import 'package:flutter/material.dart';

void main() {
  runApp(PlantListApp());
}

class PlantListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant List',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantListPage(),
    );
  }
}

class PlantListPage extends StatelessWidget {
  final List<String> plants = [
    'Rose',
    'Lily',
    'Tulip',
    'Orchid',
    'Sunflower',
    'Cactus',
    'Fern',
    'Bamboo',
    'Daisy',
    'Carnation',
    'Lavender',
    'Hydrangea',
    'Peony',
    'Poinsettia',
    'Marigold',
    'Daffodil',
    'Iris',
    'Chrysanthemum',
    'Aloe Vera',
    'Jasmine',
    'Holly',
    'Geranium',
    'Begonia',
    'Azalea',
    'Violet',
    'Morning Glory',
    'Snapdragon',
    'Zinnia',
    'Fuchsia',
    'Honeysuckle',
    'Petunia',
    'Bleeding Heart',
    'Bougainvillea',
    'Foxglove',
    'Dandelion',
    'Cosmos',
    'Lupine',
    'Baby\'s Breath',
    'Forget-Me-Not',
    'Hosta',
    'Columbine',
    'Calla Lily',
    'Bird of Paradise',
    'Gladiolus',
    'Hollyhock',
    'Gerbera Daisy',
    'Freesia',
    'Ginger',
    'Eucalyptus',
    'Echinacea',
    'Delphinium',
    'Crocus',
    'Dianthus',
    'Celosia',
    'Caladium',
    'Begonia',
    'Anemone',
    'Anthurium',
    'Baby Blue Eyes',
    'Balloon Flower',
    'Butterfly Bush',
    'Camellia',
    'Coreopsis',
    'Coneflower',
    'Dahlia',
    'Dusty Miller',
    'Elephant Ear',
    'Fritillaria',
    'Gazania',
    'Hellebore',
    'Impatiens',
    'Kiwi',
    'Lantana',
    'Lemon Balm',
    'Lobelia',
    'Mimosa',
    'Nasturtium',
    'Oregano',
    'Pansy',
    'Passionflower',
    'Queen Anne\'s Lace',
    'Ranunculus',
    'Saffron',
    'Sage',
    'Salvia',
    'Sedum',
    'Speedwell',
    'Starflower',
    'Sweet Pea',
    'Thyme',
    'Verbena',
    'Veronica',
    'Viola',
    'Wallflower',
    'Yarrow',
    'Yucca',
    'Zephyranthes',
    'Zucchini',
    'Water Lily',
    'Weeping Willow'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plant List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'List of Plant Names:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(plants.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${index + 1}. ${plants[index]}',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
