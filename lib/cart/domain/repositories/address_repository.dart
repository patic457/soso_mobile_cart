import 'package:dartz/dartz.dart';
import 'package:soso_mobile_cart/cart/core/failure.dart';
import 'package:soso_mobile_cart/marketplace.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<DeliveryAddressEntity>>> getDeliveryAddress(
      String memberId, String sDefault);
}
