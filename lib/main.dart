import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/screens/home/home.dart';
import 'package:flutter_ecommerce_app/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/screens/store/store.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51NizL3HRBepfNKBjiXJ2aD0Dqc5njzjFDrLLFrso06bZX54gZi9EJ7BM7D3qhdFgZ8gNTQB48lLmX6KLCg1yRqpl002EXtrYe1";
  await dotenv.load(fileName: "assets/.env");
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
        '/store': (context) => MultiBlocProvider(
              providers: [
                // IcecreamCubit responds to the filters
                BlocProvider(
                  create: (context) => IcecreamCubit(),
                ),
                // FilterCubit controls the filters
                BlocProvider(
                  create: (context) => FilterCubit(),
                ),
              ],
              child: StoreScreen(),
            ),
        '/product_details': (context) => BlocProvider.value(
              value: cartBloc,
              child: const ProductDetailsScreen(),
            ),
        '/cart': (context) => BlocProvider.value(
              value: cartBloc,
              child: CartScreen(),
            ),
      },
    );
  }
}
