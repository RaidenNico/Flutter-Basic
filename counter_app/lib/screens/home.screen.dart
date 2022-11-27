import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  
  const HomeScreen({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
    int counter = 0;

class _HomeScreenState extends State<HomeScreen> {
@override
  Widget build(BuildContext context) {

    TextStyle fontSize37 = const TextStyle ( fontSize: 30);
    
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.red ,
        title: const Text("HomeScreen"),
        elevation: 10,
      ),
      backgroundColor: Colors.amber ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children:  <Widget>[
            Text("Numero de clicks", style: fontSize37),
            Text("$counter", style: fontSize37,), 
          ],
        ),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
     floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.phone_android_sharp),
      onPressed: (){
        counter++;
      if (kDebugMode) {
        print("Hola Mund22o$counter");
        setState(() {
          
        });
      }      
    },
     ),
    );
  }
}
 