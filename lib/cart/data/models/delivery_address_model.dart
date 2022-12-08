// To parse this JSON data, do
//
//     final deliveryAddressModel = deliveryAddressModelFromJson(jsonString);

import 'dart:convert';

import 'package:soso_mobile_cart/cart/data/models/links_model.dart';
import 'package:soso_mobile_cart/cart/data/models/meta_model.dart';
import 'package:soso_mobile_cart/marketplace.dart';

DeliveryAddressModel deliveryAddressModelFromJson(String str) =>
    DeliveryAddressModel.fromJson(json.decode(str));

String deliveryAddressModelToJson(DeliveryAddressModel data) =>
    json.encode(data.toJson());

class DeliveryAddressModel {
  DeliveryAddressModel({
    this.links,
    this.meta,
    this.total,
    this.results,
  });

  LinksModel? links;
  MetaModel? meta;
  int? total;
  List<DeliveryAddressResult>? results;

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAddressModel(
        links:
            json["links"] == null ? null : LinksModel.fromJson(json["links"]),
        meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
        total: json["total"] == null ? null : json["total"],
        results: json["results"] == null
            ? null
            : List<DeliveryAddressResult>.from(
                json["results"].map((x) => DeliveryAddressResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "links": links == null ? null : links?.toJson(),
        "meta": meta == null ? null : meta?.toJson(),
        "total": total == null ? null : total,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };

  List<DeliveryAddressEntity> toEntity() => results!
      .map((e) => DeliveryAddressEntity(
          id: e.id,
          memberId: e.memberId,
          sDefault: e.resultDefault,
          firstname: e.firstname,
          lastname: e.lastname,
          mobileNo: e.mobileNo,
          addressNo: e.addressNo,
          moo: e.moo,
          mooban: e.mooban,
          soi: e.soi,
          building: e.building,
          room: e.room,
          floor: e.floor,
          street: e.street,
          provinceCode: e.provinceCode,
          provinceName: e.provinceName,
          districtCode: e.districtCode,
          districtName: e.districtName,
          subDistrictCode: e.subDistrictCode,
          subDistrictName: e.subDistrictName,
          postalCode: e.postalCode,
          createdBy: e.createdBy,
          createdDate: e.createdDate,
          updatedDate: e.updatedDate,
          updatedBy: e.updatedBy))
      .toList();
}

class DeliveryAddressResult {
  DeliveryAddressResult({
    this.id,
    this.memberId,
    this.resultDefault,
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
    this.updatedBy,
  });

  String? id;
  String? memberId;
  bool? resultDefault;
  String? firstname;
  String? lastname;
  String? mobileNo;
  String? addressNo;
  String? moo;
  String? mooban;
  String? soi;
  String? building;
  String? room;
  String? floor;
  String? street;
  String? provinceCode;
  String? provinceName;
  String? districtCode;
  String? districtName;
  String? subDistrictCode;
  String? subDistrictName;
  String? postalCode;
  String? createdBy;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? updatedBy;

  factory DeliveryAddressResult.fromJson(Map<String, dynamic> json) =>
      DeliveryAddressResult(
        id: json["_id"] == null ? null : json["_id"],
        memberId: json["memberId"] == null ? null : json["memberId"],
        resultDefault: json["default"] == null ? null : json["default"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
        addressNo: json["addressNo"] == null ? null : json["addressNo"],
        moo: json["moo"] == null ? null : json["moo"],
        mooban: json["mooban"] == null ? null : json["mooban"],
        soi: json["soi"] == null ? null : json["soi"],
        building: json["building"] == null ? null : json["building"],
        room: json["room"] == null ? null : json["room"],
        floor: json["floor"] == null ? null : json["floor"],
        street: json["street"] == null ? null : json["street"],
        provinceCode:
            json["provinceCode"] == null ? null : json["provinceCode"],
        provinceName:
            json["provinceName"] == null ? null : json["provinceName"],
        districtCode:
            json["districtCode"] == null ? null : json["districtCode"],
        districtName:
            json["districtName"] == null ? null : json["districtName"],
        subDistrictCode:
            json["subDistrictCode"] == null ? null : json["subDistrictCode"],
        subDistrictName:
            json["subDistrictName"] == null ? null : json["subDistrictName"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "memberId": memberId == null ? null : memberId,
        "default": resultDefault == null ? null : resultDefault,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "mobileNo": mobileNo == null ? null : mobileNo,
        "addressNo": addressNo == null ? null : addressNo,
        "moo": moo == null ? null : moo,
        "mooban": mooban == null ? null : mooban,
        "soi": soi == null ? null : soi,
        "building": building == null ? null : building,
        "room": room == null ? null : room,
        "floor": floor == null ? null : floor,
        "street": street == null ? null : street,
        "provinceCode": provinceCode == null ? null : provinceCode,
        "provinceName": provinceName == null ? null : provinceName,
        "districtCode": districtCode == null ? null : districtCode,
        "districtName": districtName == null ? null : districtName,
        "subDistrictCode": subDistrictCode == null ? null : subDistrictCode,
        "subDistrictName": subDistrictName == null ? null : subDistrictName,
        "postalCode": postalCode == null ? null : postalCode,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "updatedDate":
            updatedDate == null ? null : updatedDate?.toIso8601String(),
        "updatedBy": updatedBy == null ? null : updatedBy,
      };
}
