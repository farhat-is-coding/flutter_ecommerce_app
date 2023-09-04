part of 'icecream_cubit.dart';

sealed class IcecreamState extends Equatable {
  const IcecreamState();

  @override
  List<Object> get props => [];
}

// final class IcecreamInitial extends IcecreamState {}


final class IcecreamLoading extends IcecreamState {}

final class IcecreamLoaded extends IcecreamState {
  final List<IceCream> iceCreamData;

  IcecreamLoaded(this.iceCreamData);

  @override
  List<Object> get props => [iceCreamData];
}