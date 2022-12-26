import 'package:designs/widgets/background.dart';
import 'package:designs/widgets/page_title.dart';
import 'package:flutter/material.dart';
import '../widgets/card_table.dart';
import '../widgets/custom_botton_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const Background(), _HomeBody()],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [
        PageTitle(),
        CardTable(),
      ]),
    );
  }
}
