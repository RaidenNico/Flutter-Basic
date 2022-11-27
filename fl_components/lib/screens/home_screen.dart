//import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      title: const Text('Google Maps5'), 
      elevation: 15,
    ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.add_outlined),
          title: const Text("Nombre de Ruta"),
          onTap: () {

            //final route = MaterialPageRoute(
            //  builder: (context) => const Listview1Screen(),
            //  );
            // Navigator.push(context, 'alert');

            Navigator.pushNamed(context, "alert");

          },
        ), 
        separatorBuilder: (_ , __) => const Divider(),
        itemCount: 15
     ),
    );
  }
}
