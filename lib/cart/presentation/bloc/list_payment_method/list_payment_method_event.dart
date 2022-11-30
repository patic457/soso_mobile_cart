part of 'list_payment_method_bloc.dart';

abstract class ListPaymentMethodEvent extends Equatable {
  const ListPaymentMethodEvent();

  @override
  List<Object> get props => [];
}

class GetPaymentMethodEvent extends ListPaymentMethodEvent {}
