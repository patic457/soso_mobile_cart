import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soso_mobile_cart/cart/core/exception.dart';
import 'package:soso_mobile_cart/cart/domain/entities/delivery_address_entity.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_delivery_address.dart';

import '../../../domain/usecases/select_delivery_address.dart';

part 'delivery_address_event.dart';
part 'delivery_address_state.dart';

class DeliveryAddressBloc
    extends Bloc<DeliveryAddressEvent, DeliveryAddressState> {
  late List<DeliveryAddressEntity> _deliveryAddressDatas;
  List<DeliveryAddressEntity> get deliveryAddressDatas => _deliveryAddressDatas;

  final GetdeliveryAddressesUseCase _getdeliveryAddressesUseCase;
  final SelectDeliveryAddressesUseCase _selectDeliveryAddressesUseCase;

  DeliveryAddressBloc(
      this._getdeliveryAddressesUseCase, this._selectDeliveryAddressesUseCase)
      : super(DeliveryAddressInitial()) {
    on<OnGetDeliveryAddress>(_onGetDeliveryAddressesEvent);
    on<OnSelectDeliveryAddress>(_onSelectDeliveryAddressesEvent);
  }

  // getDeliveryAddresses
  Future<void> _onGetDeliveryAddressesEvent(
      OnGetDeliveryAddress event, Emitter<DeliveryAddressState> emit) async {
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

  // selectDeliveryAddresses
  Future<void> _onSelectDeliveryAddressesEvent(
      OnSelectDeliveryAddress event, Emitter<DeliveryAddressState> emit) async {
    emit(GetDeliveryAddressLoading());
    try {
      final selectDeliveryAddressResult = await _selectDeliveryAddressesUseCase
          .execute(event.memberId, event.id);

      print('===selectDeliveryAddressResult===');

      selectDeliveryAddressResult.fold(
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
}
