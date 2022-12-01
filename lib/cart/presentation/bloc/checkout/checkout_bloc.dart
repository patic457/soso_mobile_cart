import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketplace/cart/core/exception.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/cart/domain/entities/delivery_address_entity.dart';
import 'package:marketplace/cart/domain/usecases/get_cart_checkout.dart';
import 'package:marketplace/cart/domain/usecases/get_delivery_address.dart';
// import 'package:marketplace/marketplace.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final GetdeliveryAddressesUseCase _getdeliveryAddressesUseCase;
  final GetCartCheckoutUseCase _GetCartCheckoutUseCase;

  late List<DeliveryAddressEntity> _deliveryAddressDatas;
  List<DeliveryAddressEntity> get deliveryAddressDatas => _deliveryAddressDatas;

  late CartCheckoutEntity _cartData;
  CartCheckoutEntity get cartData => _cartData;

  CheckoutBloc(this._getdeliveryAddressesUseCase, this._GetCartCheckoutUseCase)
      : super(CheckoutInitial()) {
    on<OnGetDeliveryAddress>(_onGetDeliveryAddressesEvent);
    on<OnGetCart>(_onGetCart);
  }

  // getDeliveryAddresses
  Future<void> _onGetDeliveryAddressesEvent(
      OnGetDeliveryAddress event, Emitter<CheckoutState> emit) async {
    emit(GetDeliveryAddressLoading());
    try {
      final deliveryAddressResult = await _getdeliveryAddressesUseCase.execute(
          event.memberId, event.sDefault);

      print('===deliveryAddressResult===');
      deliveryAddressResult.fold(
        (failure) {
          emit(GetDeliveryAddressError(failure.message));
        },
        (data) async {
          _deliveryAddressDatas = data;
          emit(MainGetDeliveryAddress(data));
        },
      );
    } on ServerException {
      emit(GetDeliveryAddressEmpty());
    }
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
