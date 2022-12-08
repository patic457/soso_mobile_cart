import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace_cart/cart/core/exception.dart';
import 'package:marketplace_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace_cart/cart/domain/usecases/get_cart_checkout.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final GetCartCheckoutUseCase _GetCartCheckoutUseCase;

  late CartCheckoutEntity _cartData;
  CartCheckoutEntity get cartData => _cartData;

  CheckoutBloc(this._GetCartCheckoutUseCase) : super(CheckoutInitial()) {
    on<OnGetCart>(_onGetCart);
  }

  // getCart
  Future<void> _onGetCart(OnGetCart event, Emitter<CheckoutState> emit) async {
    emit(GetCartLoading());
    try {
      final cart = await _GetCartCheckoutUseCase.execute(event.memberId);
      cart.fold(
        (failure) {
          emit(GetCartError(failure.message));
        },
        (data) {
          _cartData = data;
          emit(MainGetcart(data));
        },
      );
    } on ServerException {
      emit(GetCartEmpty());
    }
  }
}
