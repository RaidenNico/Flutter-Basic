

import 'package:counter_app/screens/counter.screen.dart';
//import 'package:counter_app/screens/home.screen.dart';
import 'package:flutter/material.dart';

void main (){
  //Primer Widget
runApp(const MyApp());
}

//Staless no mantiene el estado de la aplicacion
//Stafull si matiene los valores 

//Todo State Widget 
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen()
      home: CounterScreen() 
      ); 
 }

}
