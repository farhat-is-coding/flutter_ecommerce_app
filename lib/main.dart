import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecommerce_app/screens/home/home.dart';
import 'package:flutter_ecommerce_app/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/screens/store/store.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final cartBloc = CartBloc(); // Create the CartBloc instance

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: cartBloc,
              child: const HomeScreen(),
            ),
        '/store': (context) => StoreScreen(),
        '/product_details': (context) => const ProductDetailsScreen(),
        '/cart': (context) => BlocProvider.value(
              value: cartBloc,
              child: CartScreen(),
            ),
      },
    );
  }
}
