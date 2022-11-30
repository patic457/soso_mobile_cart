// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_payment_method_bloc.dart';

abstract class SelectPaymentMethodEvent extends Equatable {
  const SelectPaymentMethodEvent();

  @override
  List<Object?> get props => [];
}

class OnSelectPaymentMethodEvent extends SelectPaymentMethodEvent {
  final PaymentMethodEntity? paymentMethodEntity;

  const OnSelectPaymentMethodEvent({
    this.paymentMethodEntity,
  });

  @override
  List<Object?> get props => [
        paymentMethodEntity,
      ];
}

class OnSelectSubPaymentMethodEvent extends SelectPaymentMethodEvent {
  final BankOption? subPaymentMethod;

  const OnSelectSubPaymentMethodEvent({
    this.subPaymentMethod,
  });

  @override
  List<Object?> get props => [
        subPaymentMethod,
      ];
}
