import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/components/coffee_tile.dart';
import 'package:flutter_coffee_shop_app/models/coffe_shop.dart';
import 'package:flutter_coffee_shop_app/models/coffee.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addToCart(Coffee coffee){
   Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Success added to cart'),
      ),
    );
  }

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
                return CoffeeTile(
                  coffee: eachCoffe,
                  icon: const Icon(Icons.add),
                  onPressed: () => addToCart(eachCoffe),
                );
              }),)
            ],
          ),
        ),
      ), 
    );
  }
}