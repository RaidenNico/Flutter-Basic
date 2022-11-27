
import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {

  final options = const["Megaman","Metal Gear","Super Smash","Final Fantasy",
                        "Metal Slug","Tekken 7","Resident Evil","Zelda","Dota 2",
                        "LoL","Starcraft2","Csgo","Mario Kart"];
   
  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Center(child: Text("Videojuegos")),
        elevation: 15,
        backgroundColor: Colors.indigoAccent,
        ),

      body: ListView.separated(

        itemCount: options.length,

        itemBuilder: (context, i) => ListTile(

          title: Text(options[i]),
          trailing: const Icon( Icons.arrow_forward_ios_outlined, color: Colors.indigoAccent,),
          onTap: (){
            final game = options [i];
            print( game );
          },

          ), 

        separatorBuilder: ( _ , __ ) =>  const Divider(),)
   
    );    
  }     
}

//  Widget build(BuildContext context) {
  //  return const MaterialApp(
    //  debugShowCheckedModeBanner: false,
      //home: HomeScreen()
      // home: CounterScreen() 
