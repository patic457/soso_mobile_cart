// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_payment_method_bloc.dart';

abstract class ListPaymentMethodState extends Equatable {
  const ListPaymentMethodState();

  @override
  List<Object> get props => [];
}

class ListPaymentMethodLoading extends ListPaymentMethodState {
  @override
  String toString() => 'Loading....';
}

class ListPaymentMethodInitial extends ListPaymentMethodState {}

class MainListPaymentMethod extends ListPaymentMethodState {
  final List<PaymentMethodEntity> paymentMethods;
  const MainListPaymentMethod({
    required this.paymentMethods,
  });

  MainListPaymentMethod copyWith({
    List<PaymentMethodEntity>? paymentMethods,
  }) {
    return MainListPaymentMethod(
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  @override
  List<Object> get props => [
        paymentMethods,
      ];
}

class ListPaymentMethodError extends ListPaymentMethodState {
  final String message;
  const ListPaymentMethodError({
    required this.message,
  });

  ListPaymentMethodError copyWith({
    String? message,
  }) {
    return ListPaymentMethodError(
      message: message ?? this.message,
    );
  }
}
