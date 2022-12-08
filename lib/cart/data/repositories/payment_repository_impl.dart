// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/exception.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/cart/data/datasources/remote_data_source.dart';
import 'package:marketplace_cart/cart/domain/entities/payment_method_entity.dart';
import 'package:marketplace_cart/cart/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final RemoteDataSource remoteDataSource;
  PaymentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> listPaymentMethod() async {
    try {
      final result = await remoteDataSource.listPaymentMethod();
      final paymentMethods = result
          .map((e) => PaymentMethodEntity(
                paymentMethodImage: e.paymentMethodImage,
                paymentMethodName: e.paymentMethodName,
                bankOptions: e.bankOption,
              ))
          .toList();
      return Right(paymentMethods);
    } on ServerException {
      return const Left(ServerFailure('Cannot call listPaymentMethod'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
