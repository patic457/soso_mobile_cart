import 'package:get_it/get_it.dart';
import 'package:marketplace/cart/data/datasources/remote_data_source.dart';
import 'package:marketplace/cart/data/datasources/remote_data_source_impl.dart';
import 'package:marketplace/cart/data/repositories/address_repository_impl.dart';
import 'package:marketplace/cart/data/repositories/cart_checkout_repository_impl.dart';
import 'package:marketplace/cart/data/repositories/payment_repository_impl.dart';
import 'package:marketplace/cart/domain/repositories/address_repository.dart';
import 'package:marketplace/cart/domain/repositories/cart_checkout_repository.dart';
import 'package:marketplace/cart/domain/repositories/payment_repository.dart';
import 'package:marketplace/cart/domain/usecases/get_cart_checkout.dart';
import 'package:marketplace/cart/domain/usecases/get_delivery_address.dart';
import 'package:marketplace/cart/domain/usecases/get_payment_method.dart';
import 'package:marketplace/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:marketplace/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerLazySingleton(() => ListPaymentMethodBloc(locator()));
  locator.registerFactory(() => CheckoutBloc(locator(), locator()));
  locator.registerLazySingleton(() => SelectPaymentMethodBloc());

  // usecase
  locator.registerLazySingleton(
      () => GetPaymentMethodUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetdeliveryAddressesUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetCartCheckoutUseCase(repository: locator()));

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
}
