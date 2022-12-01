import 'package:dartz/dartz.dart';
import 'package:marketplace/cart/core/failure.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/marketplace.dart';

abstract class CartCheckoutRepository {
  Future<Either<Failure, CartCheckoutEntity>> getCart(String memberId);
}