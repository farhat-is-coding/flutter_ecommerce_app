// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/swiper_cubit/swiper_cubit.dart';
import 'package:flutter_ecommerce_app/screens/home/home.dart';
import 'package:flutter_ecommerce_app/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_app/screens/store/store.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ecommerce_app/screens/success/success.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Stripe.publishableKey =
      "pk_test_51NizL3HRBepfNKBjiXJ2aD0Dqc5njzjFDrLLFrso06bZX54gZi9EJ7BM7D3qhdFgZ8gNTQB48lLmX6KLCg1yRqpl002EXtrYe1";
  await dotenv.load(fileName: "assets/.env");
  Animate.restartOnHotReload = true;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cartBloc = CartBloc();
  // Create the CartBloc instance
  final icecreamDataBloc = IcecreamCubit();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FlutterNativeSplash.remove();
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IceCream App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 225, 225, 225),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: cartBloc,
                ),
                BlocProvider(
                  create: (context) => SwiperCubit(),
                ),
                BlocProvider.value(
                  value: icecreamDataBloc,
                ),
              ],
              child: const HomeScreen(),
            ),
        '/store': (context) => MultiBlocProvider(
              providers: [
                // IcecreamCubit responds to the filters
                BlocProvider.value(
                  value: icecreamDataBloc,
                ),
                // FilterCubit controls the filters
                BlocProvider(
                  create: (context) => FilterCubit(),
                ),
              ],
              child: const StoreScreen(),
            ),
        '/product_details': (context) => BlocProvider.value(
              value: cartBloc,
              child: const ProductDetailsScreen(),
            ),
        '/cart': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: icecreamDataBloc,
                ),
                BlocProvider.value(
                  value: cartBloc,
                ),
              ],
              child: const CartScreen(),
            ),
        '/success': (context) => const SuccessScreen()
      },
    );
  }
}
