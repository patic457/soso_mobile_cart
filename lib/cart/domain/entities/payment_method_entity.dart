// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:marketplace/cart/data/models/payment_method_model.dart';

class PaymentMethodEntity extends Equatable {
  final String? paymentMethodName;
  final String? paymentMethodImage;
  final List<BankOption?>? bankOptions;
  const PaymentMethodEntity({
    this.paymentMethodName,
    this.paymentMethodImage,
    this.bankOptions,
  });

  @override
  List<Object?> get props => [
        paymentMethodName,
        paymentMethodImage,
        bankOptions,
      ];

  PaymentMethodEntity copyWith({
    String? paymentMethodName,
    String? paymentMethodImage,
    List<BankOption?>? bankOptions,
  }) {
    return PaymentMethodEntity(
      paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      paymentMethodImage: paymentMethodImage ?? this.paymentMethodImage,
      bankOptions: bankOptions ?? this.bankOptions,
    );
  }
}
