import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/marketplace.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<DeliveryAddressEntity>>> getDeliveryAddress(
      String memberId, String sDefault);
}
