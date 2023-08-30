import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Home Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => Cart())));
              },
              child: const Text('Go to Cart'))
        ],
      ),
    );
  }
}
