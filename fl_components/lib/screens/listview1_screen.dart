
import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {

  final options = const["Megaman","Metal Gear","Super Smash","Final Fantasy",
                        "Metal Slug","Tekken 7","Resident Evil","Zelda","Dota 2",
                        "LoL","Starcraft2","Csgo","Mario Kart"];
   
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Videojuegos")),
        ),
      body: ListView(
         children: [

          const ListTile(
            leading: Icon(Icons.approval) ,
            title: Text("Lista de Juegos"),
          ),

          ...options.map(
            (game) => ListTile(
              title: Text( game ),
              trailing: const Icon(Icons.android),
            ),
          ).toList(),

          const ListTile (
             leading: Icon(Icons.approval_rounded),
             title: Text("Fin de la Lista"),
          ),
         ]
      )
    );    
  }     
}

//  Widget build(BuildContext context) {
  //  return const MaterialApp(
    //  debugShowCheckedModeBanner: false,
      //home: HomeScreen()
      // home: CounterScreen() 
