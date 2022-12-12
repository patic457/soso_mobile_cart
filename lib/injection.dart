import 'package:get_it/get_it.dart';
import 'package:marketplace_member/injection.dart';

import 'package:soso_mobile_cart/cart/data/datasources/remote_data_source.dart';
import 'package:soso_mobile_cart/cart/data/datasources/remote_data_source_impl.dart';
import 'package:soso_mobile_cart/cart/data/repositories/address_repository_impl.dart';
import 'package:soso_mobile_cart/cart/data/repositories/cart_checkout_repository_impl.dart';
import 'package:soso_mobile_cart/cart/data/repositories/payment_repository_impl.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/address_repository.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/cart_checkout_repository.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/payment_repository.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_cart_checkout.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_delivery_address.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_payment_method.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/delivery_address/delivery_address_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/handle_checkout/handle_checkout_cubit.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:soso_mobile_cart/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';

import 'package:marketplace_member/member/data/datasources/datasources.dart';
import 'package:marketplace_member/member/data/repositories/location_repository_impl.dart';
import 'package:marketplace_member/member/data/repositories/member_repository_impl.dart';
import 'package:marketplace_member/member/domain/repositories/location_repository.dart';
import 'package:marketplace_member/member/domain/repositories/member_repository.dart';
import 'package:marketplace_member/member/domain/usecases/create_delivery_address.dart';
import 'package:marketplace_member/member/domain/usecases/get_delivery_addresses_list.dart';
import 'package:marketplace_member/member/domain/usecases/get_suggest_location.dart';
import 'package:marketplace_member/member/presentation/bloc/delivery_address_member_bloc/delivery_address_member_bloc.dart';
import 'package:marketplace_member/member/presentation/bloc/is_complete_form_cubit.dart';
import 'package:marketplace_member/member/presentation/bloc/member/member_bloc.dart';
import 'package:marketplace_member/member/presentation/bloc/selected_index_cubit.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => ListPaymentMethodBloc(locator()));
  locator.registerFactory(() => CheckoutBloc(locator()));
  locator.registerLazySingleton(() => SelectPaymentMethodBloc());
  locator.registerFactory(() => DeliveryAddressBloc(locator()));

  // cubit
  locator.registerFactory(() => HandleCheckoutCubit());

  // usecase
  locator.registerLazySingleton(
      () => GetPaymentMethodUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetdeliveryAddressesUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetCartCheckoutUseCase(repository: locator()));

  // repository
  locator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(remoteDataSource: locator()),
  );
  locator.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(remoteDataSource: locator()),
  );
  locator.registerLazySingleton<CartCheckoutRepository>(
    () => CartCheckoutRepositoryImpl(remoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());

  // Member
  initMember();
  //
}
