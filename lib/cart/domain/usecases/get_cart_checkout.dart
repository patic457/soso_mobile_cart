import 'package:dartz/dartz.dart';
import 'package:marketplace/cart/core/failure.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/cart/domain/repositories/cart_checkout_repository.dart';

class GetCartCheckoutUseCase {
  final CartCheckoutRepository repository;
  GetCartCheckoutUseCase({
    required this.repository,
  });
  Future<Either<Failure, CartCheckoutEntity>> execute(memberId) {
    return repository.getCart(memberId);
  }
}
