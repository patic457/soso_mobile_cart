import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:marketplace_cart/cart/core/exception.dart';
import 'package:marketplace_cart/cart/core/failure.dart';
import 'package:marketplace_cart/cart/data/datasources/remote_data_source.dart';
import 'package:marketplace_cart/marketplace.dart';

class AddressRepositoryImpl extends AddressRepository {
  final RemoteDataSource remoteDataSource;
  AddressRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<DeliveryAddressEntity>>> getDeliveryAddress(
      String memberId, String sDefault) async {
    try {
      final result =
          await remoteDataSource.getDeliveryAddress(memberId, sDefault);
      // final deliveryAddress = result;
      // .map((e) => DeliveryAddressEntity(
      //     sId: e.sId,
      //     memberId: e.memberId,
      //     sDefault: e.sDefault,
      //     firstname: e.firstname,
      //     lastname: e.lastname,
      //     mobileNo: e.mobileNo,
      //     addressNo: e.addressNo,
      //     moo: e.moo,
      //     mooban: e.mooban,
      //     soi: e.soi,
      //     building: e.building,
      //     room: e.room,
      //     floor: e.floor,
      //     street: e.street,
      //     provinceCode: e.provinceCode,
      //     provinceName: e.provinceName,
      //     districtCode: e.districtCode,
      //     districtName: e.districtName,
      //     subDistrictCode: e.subDistrictCode,
      //     subDistrictName: e.subDistrictName,
      //     postalCode: e.postalCode,
      //     createdBy: e.createdBy,
      //     createdDate: e.createdDate,
      //     updatedDate: e.updatedDate,
      //     updatedBy: e.updatedBy))
      // .toList();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Cannot call getDeliveryAddress'));
    } on SocketException {
      return Left(const ConnectionFailure('Failed to connect to the network'));
    }
  }
}
