import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/cart/domain/entities/payment_method_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PaymentMethodEntity>>> listPaymentMethod();
}
