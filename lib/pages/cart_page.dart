import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/components/coffee_tile.dart';
import 'package:flutter_coffee_shop_app/models/coffe_shop.dart';
import 'package:flutter_coffee_shop_app/models/coffee.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            'Your Cart',
            style:  TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.userCart.length,
                itemBuilder: (context, index){
                  Coffee eachCoffe = value.userCart[index];

                  return CoffeeTile(
                    coffee: eachCoffe,
                    onPressed:() => removeFromCart(eachCoffe),
                    icon: const Icon(Icons.delete),
                  );
                }
              ),
          ),

          Container(
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Pay Now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    )

    ),
    );
  }
}