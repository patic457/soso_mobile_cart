part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

// initial
class CheckoutInitial extends CheckoutState {}

// loading
class CheckoutLoading extends CheckoutState {
  @override
  String toString() => 'Loading...';
}

// error
class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message,);
  @override
  List<Object?> get props => [message];
}

// getDeliveryAddresses
class GetDeliveryAddressLoading extends CheckoutState {
  @override
  String toString() => 'Loading...';
}

class GetDeliveryAddressError extends CheckoutState {
  final String message;
  const GetDeliveryAddressError(this.message,);
  @override
  List<Object?> get props => [message];
}

class GetDeliveryAddressEmpty extends CheckoutState {}

class MainGetDeliveryAddress extends CheckoutState {
  final List<DeliveryAddressEntity> deliveryAddressResult;
  const MainGetDeliveryAddress(this.deliveryAddressResult);
  @override
  List<Object?> get props => [deliveryAddressResult];
}

// getCart
class GetCartLoading extends CheckoutState {
  @override
  String toString() => 'Loading...';
}

class GetCartError extends CheckoutState {
  final String message;
  const GetCartError(this.message,);
  @override
  List<Object?> get props => [message];
}

class GetCartEmpty extends CheckoutState {}

class MainGetcart extends CheckoutState {
  final CartCheckoutEntity cartResult;
  const MainGetcart(this.cartResult);
  @override
  List<Object?> get props => [cartResult];
}