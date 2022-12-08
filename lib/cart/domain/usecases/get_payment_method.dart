// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:soso_mobile_cart/cart/core/failure.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';
import 'package:soso_mobile_cart/cart/domain/repositories/payment_repository.dart';

class GetPaymentMethodUseCase {
  final PaymentRepository repository;
  GetPaymentMethodUseCase({
    required this.repository,
  });
  Future<Either<Failure, List<PaymentMethodEntity>>> execute() {
    return repository.listPaymentMethod();
  }
}
