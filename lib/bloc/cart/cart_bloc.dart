// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/model/cart.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial([])) {
    on<AddIceCreamEvent>(_addIceCreamToCart);
    on<RemoveIceCreamEvent>(_removeIceCreamFromCart);
    on<DeleteIceCreamEvent>(_deleteIceCreamFromCart);
    on<ClearCartEvent>(_clearCart);
  }

  List<Cart> _cartItems = []; // List of cart items

  void _addIceCreamToCart(AddIceCreamEvent event, Emitter<CartState> emit) {
    // When we click on the Add to Cart button, we will receive an event
    //of type AddIceCreamEvent in which we have iceCream object.

    final IceCream iceCream = event.iceCream; // Extract ice cream from event

    final existingItem = _cartItems.firstWhere(
      (item) => item.iceCream.name == iceCream.name,
      orElse: () => Cart(iceCream: iceCream, quantity: 0),
    );

    if (existingItem.quantity != 0) {
      existingItem.quantity++;
    } else {
      _cartItems.add(Cart(iceCream: iceCream, quantity: 1));
    }

    emit(CartUpdatedState(_cartItems)); // Emit updated state
    // log('${_cartItems}');
  }

  void _removeIceCreamFromCart(
      RemoveIceCreamEvent event, Emitter<CartState> emit) {
    final IceCream iceCream = event.iceCream;

    final existingItem = _cartItems.firstWhere(
      (item) => item.iceCream.name == iceCream.name,
      orElse: () => Cart(iceCream: iceCream, quantity: 0),
    );

    if (existingItem.quantity != 0) {
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
      } else {
        _cartItems.remove(existingItem);
      }
    }

    emit(CartUpdatedState(_cartItems)); // Emit updated state
  }

  void _deleteIceCreamFromCart(
      DeleteIceCreamEvent event, Emitter<CartState> emit) {
    final IceCream iceCream = event.iceCream;
    final existingItem = _cartItems.firstWhere(
      (item) => item.iceCream.name == iceCream.name,
      orElse: () => Cart(iceCream: iceCream, quantity: 0),
    );
    _cartItems.remove(existingItem);
    emit(CartUpdatedState(_cartItems)); // Emit updated state
  }

  void _clearCart(ClearCartEvent event, Emitter<CartState> emit) {
    _cartItems.clear();
    emit(CartUpdatedState(_cartItems));
  }
}
