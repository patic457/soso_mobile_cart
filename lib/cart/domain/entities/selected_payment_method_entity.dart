// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:soso_mobile_cart/cart/core/types.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';

class SelectedPaymentMethodEntity extends Equatable {
  final PaymentMethodEntity? paymentMethodEntity;
  final BankOption? bankOption;
  final PaymentMethodEnum? paymentMethodEnum;
  const SelectedPaymentMethodEntity(
      {this.paymentMethodEntity, this.bankOption, this.paymentMethodEnum});

  @override
  List<Object?> get props =>
      [paymentMethodEntity, bankOption, paymentMethodEnum];

  SelectedPaymentMethodEntity copyWith(
      {PaymentMethodEntity? paymentMethodEntity,
      BankOption? bankOption,
      PaymentMethodEnum? paymentMethodEnum}) {
    return SelectedPaymentMethodEntity(
        paymentMethodEntity: paymentMethodEntity ?? this.paymentMethodEntity,
        bankOption: bankOption ?? this.bankOption,
        paymentMethodEnum: paymentMethodEnum ?? this.paymentMethodEnum);
  }
}
