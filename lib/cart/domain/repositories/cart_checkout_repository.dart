import 'package:dartz/dartz.dart';
import 'package:soso_mobile_cart/cart/core/failure.dart';
import 'package:soso_mobile_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:soso_mobile_cart/marketplace.dart';

abstract class CartCheckoutRepository {
  Future<Either<Failure, CartCheckoutEntity>> getCart(String memberId);
}
