part of 'delivery_address_bloc.dart';

abstract class DeliveryAddressEvent extends Equatable {
  const DeliveryAddressEvent();

  @override
  List<Object> get props => [];
}

class OnGetDeliveryAddress extends DeliveryAddressEvent {
  final String memberId;
  final String sDefault;
  const OnGetDeliveryAddress(this.memberId, this.sDefault);
  @override
  List<Object> get props => [];
}
