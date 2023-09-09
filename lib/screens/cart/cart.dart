import 'dart:developer';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/screens/cart/components/card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntent;

  double total = 0.0; //holds current total will be updated as we go
  double discount = 0.0;

  double grandTotal = 0.0;
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6E7E98),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final cart =
              context.select((CartBloc cartBloc) => cartBloc.state.cartItems);
          // final icecreamCubit =
          //     context.select((IcecreamCubit icecreamCubit) => icecreamCubit);
          if (cart.isEmpty) {
            total = 0.0;
            grandTotal = 0;
          } else {
            calculateTotal(cart);
            calculateGrandTotal();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...switch (state) {
                CartInitial() => [
                    SizedBox(
                      height: height * 0.6,
                      child: const Center(
                        child: Text(
                          "Cart is Empty",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff6E7E98),
                          ),
                        ),
                      ),
                    ),
                  ],
                CartUpdatedState() => [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: SizedBox(
                        height: height * 0.6,
                        child: AnimationLimiter(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cart.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 475),
                                child: SlideAnimation(
                                  verticalOffset: 200.0,
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: ProductCard(
                                        cartItem: cart[index],
                                        index: index,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ]
              },
              Container(
                padding: const EdgeInsets.only(
                    bottom: 10, top: 20, left: 2, right: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            '\$ ${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Discount Offer',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            '- \$.00',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Grand Total',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            '\$ ${grandTotal.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 63, 67, 83),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 130, 149, 179)),
                        ),
                        onPressed: () async {
                          log('making payment');
                          await makePayment();
                        },
                        child: const SizedBox(
                          width: 150,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  calculateTotal(List cart) {
    total = 0;
    for (var item in cart) {
      total += item.iceCream.price * item.quantity;
    }
  }

  calculateGrandTotal() {
    grandTotal = total - discount;
  }

  refresh() {
    setState(() {});
  }

  //NOW THIS IS WHERE ALL THE STRIPE STUFF BE HAPPENING
  Future<void> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent(grandTotal.toString(), 'usd');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Ikay',
              billingDetailsCollectionConfiguration:
                  const BillingDetailsCollectionConfiguration(
                // name: CollectionMode.always,
                email: CollectionMode.always,
                // phone: CollectionMode.always,
                address: AddressCollectionMode.full,
                // attachDefaultsToPaymentMethod: true,
              ),
            ),
          )
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      // log('total is ${amount}');
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      log(response.body.toString());
      return json.decode(response.body);
    } catch (err) {
      log(err.toString());
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
        paymentIntent = null;

        //Refresh the cart
        context.read<CartBloc>().add(const ClearCartEvent());
        Navigator.pushReplacementNamed(context, '/success');
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      log('Error is:---> $e');
    } catch (e) {
      log('$e');
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmout = (double.parse(amount) * 100).round();
    log(calculatedAmout.toString());
    return calculatedAmout.toString();
  }
}
