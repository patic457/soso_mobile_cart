part of 'delivery_address_bloc.dart';

abstract class DeliveryAddressState extends Equatable {
  const DeliveryAddressState();
  
  @override
  List<Object?> get props => [];
}

class DeliveryAddressInitial extends DeliveryAddressState {}

// getDeliveryAddresses
class GetDeliveryAddressLoading extends DeliveryAddressState {
  @override
  String toString() => 'Loading...';
}

class GetDeliveryAddressError extends DeliveryAddressState {
  final String message;
  const GetDeliveryAddressError(this.message,);
  @override
  List<Object?> get props => [message];
}

class GetDeliveryAddressEmpty extends DeliveryAddressState {}

class MainGetDeliveryAddress extends DeliveryAddressState {
  final List<DeliveryAddressEntity> deliveryAddressResult;
  const MainGetDeliveryAddress(this.deliveryAddressResult);
  @override
  List<Object?> get props => [deliveryAddressResult];
}