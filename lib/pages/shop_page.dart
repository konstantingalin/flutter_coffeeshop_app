import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/models/coffe_shop.dart';
import 'package:flutter_coffee_shop_app/models/coffee.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                //get individual coffee
                Coffee eachCoffe = value.coffeeShop[index];

                // return the tile for this coffee
                return ListTile(
                  title: Text(eachCoffe.name),
                );
              }),)
            ],
          ),
        ),
      ), 
    );
  }
}