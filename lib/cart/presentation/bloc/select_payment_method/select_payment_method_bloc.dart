import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';
import 'package:soso_mobile_cart/cart/domain/entities/selected_payment_method_entity.dart';

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
    var updatedState = state.copyWith(
        selectedPaymentMethodEntity: state.selectedPaymentMethodEntity
            .copyWith(paymentMethodEntity: event.paymentMethodEntity));
    log(
      "Payment Method name: ${updatedState.selectedPaymentMethodEntity.paymentMethodEntity!.paymentMethodName}",
    );
    emit(updatedState);
  }

  void _onSelectSubPaymentMethodBloc(OnSelectSubPaymentMethodEvent event,
      Emitter<SelectPaymentMethodState> emit) {
    var updatedState = state.copyWith(
        selectedPaymentMethodEntity: state.selectedPaymentMethodEntity
            .copyWith(bankOption: event.subPaymentMethod));
    log(
      "Payment Method name: ${updatedState.selectedPaymentMethodEntity.paymentMethodEntity!.paymentMethodName}",
    );
    log(
      "Bank name: ${updatedState.selectedPaymentMethodEntity.bankOption!.bankName}",
    );

    emit(updatedState);
  }
}
