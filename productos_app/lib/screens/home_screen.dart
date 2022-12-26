import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de inicio'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            child: Image.network(
              'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2013/11/Wallpaper-Monta%C3%B1as.jpg?fit=1200%2C800&quality=60&strip=all&ssl=1',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Título de la sección',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus auctor nibh non metus pretium, quis condimentum enim consequat. In hac habitasse platea dictumst. Curabitur euismod, turpis ut vehicula gravida, leo libero tincidunt enim, at fermentum nisl nisl at libero. Donec et leo eget ligula dictum tristique id id leo. In tincidunt, lacus sit amet fermentum tempus, nibh nulla dignissim risus, non ullamcorper ligula lectus at diam. Nunc laoreet orci eget nibh vehicula, non convallis eros fermentum. Suspendisse iaculis est eu dui fringilla, at lobortis felis auctor. Aliquam erat volutpat. Nulla facilisi.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Opción 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Opción 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
