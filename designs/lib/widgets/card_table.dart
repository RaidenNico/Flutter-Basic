import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
              color: Colors.blueAccent,
              icon: Icons.border_all,
              text: "General"),
          _SingleCard(
              color: Colors.purple, icon: Icons.car_rental, text: "Transporte"),
        ]),
        TableRow(children: [
          _SingleCard(color: Colors.pink, icon: Icons.shop, text: "Shopping"),
          _SingleCard(color: Colors.orange, icon: Icons.cloud, text: "Bill"),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.blue, icon: Icons.movie, text: "Entertainment"),
          _SingleCard(
              color: Colors.green, icon: Icons.food_bank, text: "Grocery"),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: this.color,
          radius: 30,
          child: Icon(
            this.icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(this.text, style: TextStyle(color: this.color, fontSize: 18))
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
