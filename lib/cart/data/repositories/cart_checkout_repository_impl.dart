import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/exception.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/cart/data/datasources/remote_data_source.dart';
import 'package:marketplace_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace_cart/cart/domain/repositories/cart_checkout_repository.dart';

class CartCheckoutRepositoryImpl extends CartCheckoutRepository {
  final RemoteDataSource remoteDataSource;
  CartCheckoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CartCheckoutEntity>> getCart(String memberId) async {
    try {
      final result = await remoteDataSource.getCart(memberId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Cannot call getCart'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
