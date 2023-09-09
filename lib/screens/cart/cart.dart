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
import 'cart_list.dart';

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
    final cart =
        context.select((CartBloc cartBloc) => cartBloc.state.cartItems);
    if (cart.isEmpty) {
      total = 0.0;
      grandTotal = 0;
    } else {
      calculateTotal(cart);
      calculateGrandTotal();
    }

    log('cart: ${cart.length}');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
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
                            color: Color(0xff4c5cbf),
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
                                        width: width,
                                        index: index,
                                        notifyParent: refresh,
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            total.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Discount Offer',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            '- \.00',
                            style: const TextStyle(
                              fontSize: 15,
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Grand Total',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Text(
                            grandTotal.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
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
                              const Color(0xff4c5cbf)),
                        ),
                        onPressed: () async {
                          await makePayment();
                        },
                        child: SizedBox(
                          width: width * 0.8,
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              color: Color.fromARGB(255, 230, 233, 251),
                            ),
                            textAlign: TextAlign.center,
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
      paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ikay'))
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
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
    } catch (e) {
      print('$e');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
