import 'package:get_it/get_it.dart';
import 'package:soso_mobile_cart/cart/data/datasources/remote_data_source.dart';
import 'package:soso_mobile_cart/cart/data/datasources/remote_data_source_impl.dart';
import 'package:soso_mobile_cart/cart/data/repositories/payment_repository_impl.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/payment_repository.dart';
import 'package:soso_mobile_cart/cart/domain/usecases/get_payment_method.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => ListPaymentMethodBloc(locator()));

  // cubit

  // usecase
  locator.registerLazySingleton(
      () => GetPaymentMethodUseCase(repository: locator()));

  // repository
  locator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(remoteDataSource: locator()),
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
