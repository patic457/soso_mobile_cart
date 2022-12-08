import 'package:dartz/dartz.dart';
import 'package:soso_mobile_cart/cart/core/failure.dart';
import 'package:soso_mobile_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/cart_checkout_repository.dart';

class GetCartCheckoutUseCase {
  final CartCheckoutRepository repository;
  GetCartCheckoutUseCase({
    required this.repository,
  });
  Future<Either<Failure, CartCheckoutEntity>> execute(memberId) {
    return repository.getCart(memberId);
  }
}
