part of 'cart_bloc.dart';

@immutable
sealed class CartState {
  const CartState(this.cartItems);
  final List<Cart> cartItems;

}

final class CartInitial extends CartState {
  CartInitial(super.cartItems);
}


class CartUpdatedState extends CartState {
  CartUpdatedState(super.cartItems);
}
