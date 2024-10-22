import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen()); // Nome alterado de MyApp para HomeScreen
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenPage(), // Referenciando a nova página da HomeScreen
    );
  }
}

class HomeScreenPage extends StatefulWidget { // Alterado para HomeScreenPage
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState(); // Atualização do estado
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pet adopt'),
        backgroundColor: const Color(0xFFB7E0FF),
        leading: Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                 prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.close),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CategoryIcon(Icons.pets, 'Dogs'),
                  _CategoryIcon(Icons.pets, 'Cats'),
                  _CategoryIcon(Icons.pets, 'Birds'),
                  _CategoryIcon(Icons.pets, 'Rabbits'),
                  _CategoryIcon(Icons.pets, 'Hamsters'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _PetCard(
                      'assets/dog1.jpg',
                      'Nora',
                      'Corgi',
                      'Puppy',
                      true,
                    ),
                  ),
                  SizedBox(width: 16),  // Corrigido para "width: 16"
                  Expanded(
                    child: _PetCard(
                      'assets/cat1.jpg',
                      'Whiskers',
                      'Siamese',
                      'Kitten',
                      false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Available Pets',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _PetCard(
                'assets/rabbit1.jpg',
                'Bunny',
                'Dutch',
                'Adult',
                true,
              ),
              _PetCard(
                'assets/bird1.jpg',
                'Tweety',
                'Canary',
                'Adult',
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: const Color(0xFFB7E0FF)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: const Color(0xFFB7E0FF))),
      ],
    );
  }
}

class _PetCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String breed;
  final String age;
  final bool isAdopted;

  const _PetCard(this.imagePath, this.name, this.breed, this.age, this.isAdopted);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(breed, style: TextStyle(color: Colors.grey)),
                Text('Age: $age', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                if (isAdopted)
                  Text('Adopted!', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
