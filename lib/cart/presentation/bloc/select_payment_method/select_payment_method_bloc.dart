import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace_cart/cart/core/types.dart';
import 'package:marketplace_cart/cart/data/models/payment_method_model.dart';
import 'package:marketplace_cart/cart/domain/entities/payment_method_entity.dart';
import 'package:marketplace_cart/cart/domain/entities/selected_payment_method_entity.dart';

part 'select_payment_method_event.dart';
part 'select_payment_method_state.dart';

class SelectPaymentMethodBloc
    extends Bloc<SelectPaymentMethodEvent, SelectPaymentMethodState> {
  SelectPaymentMethodBloc()
      : super(const SelectPaymentMethodState(
            selectedPaymentMethodEntity: SelectedPaymentMethodEntity())) {
    on<OnSelectPaymentMethodEvent>(_onSelectPaymentMethodBloc);
    on<OnSelectSubPaymentMethodEvent>(_onSelectSubPaymentMethodBloc);
  }

  void _onSelectPaymentMethodBloc(OnSelectPaymentMethodEvent event,
      Emitter<SelectPaymentMethodState> emit) {
    late PaymentMethodEnum paymentMethodEnum;
    if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('debit')) {
      paymentMethodEnum = PaymentMethodEnum.creditCard;
    } else if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('promptpay')) {
      paymentMethodEnum = PaymentMethodEnum.promptpay;
    } else if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('rabbit')) {
      paymentMethodEnum = PaymentMethodEnum.rabbitLinePay;
    } else if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('mobile')) {
      paymentMethodEnum = PaymentMethodEnum.mobileBanking;
    } else if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('internet')) {
      paymentMethodEnum = PaymentMethodEnum.internetBanking;
    } else if (event.paymentMethodEntity!.paymentMethodName!
        .toLowerCase()
        .contains('free')) {
      paymentMethodEnum = PaymentMethodEnum.freeTrial;
    }
    var updatedState = state.copyWith(
        selectedPaymentMethodEntity: state.selectedPaymentMethodEntity.copyWith(
            paymentMethodEntity: event.paymentMethodEntity,
            paymentMethodEnum: paymentMethodEnum));

    emit(updatedState);
  }

  void _onSelectSubPaymentMethodBloc(OnSelectSubPaymentMethodEvent event,
      Emitter<SelectPaymentMethodState> emit) {
    var updatedState = state.copyWith(
        selectedPaymentMethodEntity: state.selectedPaymentMethodEntity
            .copyWith(bankOption: event.subPaymentMethod));

    emit(updatedState);
  }
}
