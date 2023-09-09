part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

class AddIceCreamEvent extends CartEvent {
  final IceCream iceCream;
  const AddIceCreamEvent(this.iceCream);

  @override
  List<Object> get props => [iceCream];
}

class RemoveIceCreamEvent extends CartEvent {
  final IceCream iceCream;
  const RemoveIceCreamEvent(this.iceCream);

  @override
  List<Object> get props => [iceCream];
}

class DeleteIceCreamEvent extends CartEvent{
  final IceCream iceCream;
  const DeleteIceCreamEvent(this.iceCream);

  @override
  List<Object> get props => [iceCream];
}

class ClearCartEvent extends CartEvent{
  const ClearCartEvent();

  @override
  List<Object> get props => [];
}