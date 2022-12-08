import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_payment_method.dart';

part 'list_payment_method_event.dart';
part 'list_payment_method_state.dart';

class ListPaymentMethodBloc
    extends Bloc<ListPaymentMethodEvent, ListPaymentMethodState> {
  final GetPaymentMethodUseCase _getPaymentMethodUseCase;
  ListPaymentMethodBloc(this._getPaymentMethodUseCase)
      : super(ListPaymentMethodInitial()) {
    on<GetPaymentMethodEvent>(_onListPaymentMethodEvent);
  }

  void _onListPaymentMethodEvent(
      GetPaymentMethodEvent event, Emitter<ListPaymentMethodState> emit) async {
    final paymentMethods = await _getPaymentMethodUseCase.execute();
    emit(ListPaymentMethodLoading());
    final result = paymentMethods.fold((f) => f.message, (data) => data);
    if (result is String) {
      emit(ListPaymentMethodError(message: result));
      return;
    }

    emit(MainListPaymentMethod(
        paymentMethods: result as List<PaymentMethodEntity>));
  }
}
