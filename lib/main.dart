import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/home.dart';
import 'package:flutter_ecommerce_app/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/screens/store/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/product_details',
      routes: {
        '/':(context) => const HomeScreen(),
        '/store':(context) => const StoreScreen(),
        '/product_details':(context) => const ProductDetailsScreen(),
      },
    );
  }
}

