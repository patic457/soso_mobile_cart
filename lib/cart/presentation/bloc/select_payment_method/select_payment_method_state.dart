// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_payment_method_bloc.dart';

class SelectPaymentMethodState extends Equatable {
  final SelectedPaymentMethodEntity selectedPaymentMethodEntity;
  const SelectPaymentMethodState({
    required this.selectedPaymentMethodEntity,
  });

  @override
  List<Object?> get props => [
        selectedPaymentMethodEntity,
      ];

  SelectPaymentMethodState copyWith({
    SelectedPaymentMethodEntity? selectedPaymentMethodEntity,
  }) {
    return SelectPaymentMethodState(
      selectedPaymentMethodEntity:
          selectedPaymentMethodEntity ?? this.selectedPaymentMethodEntity,
    );
  }
}
