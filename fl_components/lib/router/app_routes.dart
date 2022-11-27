import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {

   static const initialRoute = 'home'; 

   static final menuOptions = <MenuOption>[
    // TODO : borrar home

    MenuOption(route: 'home', icon: Icons.home, name: 'Home Screen', sceen: const HomeScreen()),
    MenuOption(route: 'listview1', icon: Icons.list, name: 'Listview tipo 1', sceen: const Listview1Screen()),
    MenuOption(route: 'listview2', icon: Icons.list_alt , name: 'Listview tipo 2', sceen: const Listview2Screen()),
    MenuOption(route: 'alert', icon: Icons.add_alert , name: 'Alertas', sceen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.card_giftcard  , name: 'Tarjetas - Cards', sceen: const CardScreen()),
    

   ];


   static Map<String, Widget Function(BuildContext)> routes = {
    
        'home'      : ( BuildContext context) => const HomeScreen(),
        'listview1' : ( BuildContext context) => const Listview1Screen(),
        'listview2' : ( BuildContext context) => const Listview2Screen(),
        'alert'     : ( BuildContext context) => const AlertScreen(),
        'card'      : ( BuildContext context) => const CardScreen(),
  };

   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
        return MaterialPageRoute(
            builder: (context) => const AlertScreen(),
        );
      }
}