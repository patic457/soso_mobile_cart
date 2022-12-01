import 'package:dartz/dartz.dart';
import 'package:marketplace/cart/core/failure.dart';
import 'package:marketplace/marketplace.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<DeliveryAddressEntity>>> getDeliveryAddress(String memberId, String sDefault);
}