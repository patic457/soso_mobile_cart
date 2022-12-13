import 'package:equatable/equatable.dart';

class DeliveryAddressEntity extends Equatable {
  final String? id;
  final String? memberId;
  final bool? sDefault;
  final String? firstname;
  final String? lastname;
  final String? mobileNo;
  final String? addressNo;
  final String? moo;
  final String? mooban;
  final String? soi;
  final String? building;
  final String? room;
  final String? floor;
  final String? street;
  final String? provinceCode;
  final String? provinceName;
  final String? districtCode;
  final String? districtName;
  final String? subDistrictCode;
  final String? subDistrictName;
  final String? postalCode;
  final String? createdBy;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? updatedBy;

  DeliveryAddressEntity(
      {this.id,
      this.memberId,
      this.sDefault,
      this.firstname,
      this.lastname,
      this.mobileNo,
      this.addressNo,
      this.moo,
      this.mooban,
      this.soi,
      this.building,
      this.room,
      this.floor,
      this.street,
      this.provinceCode,
      this.provinceName,
      this.districtCode,
      this.districtName,
      this.subDistrictCode,
      this.subDistrictName,
      this.postalCode,
      this.createdBy,
      this.createdDate,
      this.updatedDate,
      this.updatedBy});

  @override
  List<Object?> get props => [
        id,
        memberId,
        sDefault,
        firstname,
        lastname,
        mobileNo,
        addressNo,
        moo,
        mooban,
        soi,
        building,
        room,
        floor,
        street,
        provinceCode,
        provinceName,
        districtCode,
        districtName,
        subDistrictCode,
        subDistrictName,
        postalCode,
        createdBy,
        createdDate,
        updatedDate,
        updatedBy
      ];
}
