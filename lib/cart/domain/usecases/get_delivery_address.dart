import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/marketplace.dart';

class GetdeliveryAddressesUseCase {
  final AddressRepository repository;
  GetdeliveryAddressesUseCase({
    required this.repository,
  });
  Future<Either<Failure, List<DeliveryAddressEntity>>> execute(
      memberId, sDefault) {
    return repository.getDeliveryAddress(memberId, sDefault);
  }
}
