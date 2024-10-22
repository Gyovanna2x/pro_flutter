import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB7E0FF), // Cor de fundo
      appBar: AppBar(
        backgroundColor: Color(0xFFB7E0FF), // Cor do AppBar
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Faça um novo Aumigo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Adote um Pet hoje!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFBBE), // Cor do botão
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(
                  color:
                      Color(0xFF033A95), // Define a cor do texto corretamente
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Let\'s Go!'),
            ),
            SizedBox(height: 32),
            Stack(
              clipBehavior:
                  Clip.none, // Permite que o texto fique fora do círculo
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/cachorro.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover, // Ajusta a imagem dentro do círculo
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20, // Move o texto para fora do círculo
                  left: 175,
                  child: Text(
                    'Me adote!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFBBE), // Cor do texto
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
