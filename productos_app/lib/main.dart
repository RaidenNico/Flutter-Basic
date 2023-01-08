import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
// ignore: unnecessary_import
import 'package:productos_app/services/auth_service.dart';
// ignore: unnecessary_import
import 'package:productos_app/services/products_service.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductsService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: "login",
      routes: {
        "checking": (_) => const CheckAuthScreen(),
        "home": (_) => const HomeScreen(),
        "login": (_) => const LoginScreen(),
        "product": (_) => const ProductScreen(),
        "register": (_) => const RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
