part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class OnGetDeliveryAddress extends CheckoutEvent {
  final String memberId;
  final String sDefault;
  const OnGetDeliveryAddress(this.memberId, this.sDefault);
  @override
  List<Object> get props => [];
}

class OnGetCart extends CheckoutEvent {
  final String memberId;
  const OnGetCart(this.memberId);
  @override
  List<Object> get props => [];
}
