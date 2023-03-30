import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  CoffeeTile({super.key, required this.coffee, required this.onPressed, required this.icon});

  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle:  Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      
      ),
    );
  }
}