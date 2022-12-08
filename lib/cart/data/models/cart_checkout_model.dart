// To parse this JSON data, do
//
//     final CartCheckoutModel = CartCheckoutModelFromJson(jsonString);

import 'dart:convert';

import 'package:soso_mobile_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:soso_mobile_cart/cart/domain/entities/cart_checkout_item_entity.dart';

CartCheckoutModel CartCheckoutModelFromJson(String str) =>
    CartCheckoutModel.fromJson(json.decode(str));

String CartCheckoutModelToJson(CartCheckoutModel data) =>
    json.encode(data.toJson());

class CartCheckoutModel {
  CartCheckoutModel({
    required this.id,
    this.member,
    this.cartsItems,
    required this.subTotalIncTax,
    required this.totalIncTax,
  });

  String id;
  Member? member;
  List<CartsItem>? cartsItems;
  double subTotalIncTax;
  double totalIncTax;

  factory CartCheckoutModel.fromJson(Map<String, dynamic> json) =>
      CartCheckoutModel(
        id: json["_id"],
        member: json["member"] == null ? null : Member.fromJson(json["member"]),
        cartsItems: json["cartsItems"] == null
            ? null
            : List<CartsItem>.from(
                json["cartsItems"].map((x) => CartsItem.fromJson(x))),
        subTotalIncTax: json["subTotalIncTax"].toDouble(),
        totalIncTax: json["totalIncTax"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "member": member == null ? null : member?.toJson(),
        "cartsItems": cartsItems == null
            ? null
            : List<dynamic>.from(cartsItems!.map((x) => x.toJson())),
        "subTotalIncTax": subTotalIncTax,
        "totalIncTax": totalIncTax,
      };

  CartCheckoutEntity toEntity() => CartCheckoutEntity(
        id: id,
        cartsItems: cartsItems!.map((item) => item.toEntity()).toList(),
        member: member == null
            ? null
            : MemberEntity(
                memberId: member?.memberId, username: member?.username),
        subTotalIncTax: subTotalIncTax,
        totalIncTax: totalIncTax,
      );
}

class CartsItem {
  CartsItem({
    this.id,
    this.cartsId,
    this.merchantId,
    this.merchantName,
    this.productId,
    this.variantId,
    this.quantity,
    this.createdBy,
    this.updatedBy,
    this.createdDate,
    this.updatedDate,
    this.merchantLogo,
    this.merchantEmail,
    this.isRequireShipping,
    this.preparationOrder,
    this.productName,
    this.purchasingEnabled,
    this.productPublic,
    this.productType,
    this.isFreeShipping,
    this.productIal,
    this.productGroup,
    this.thumbnailImagePath,
    this.hasProductPermission,
    this.sku,
    this.stockQuantity,
    this.weight,
    this.weightUnit,
    this.optionValues,
    this.skuPurchasingEnabled,
    this.orderQuantityMinimum,
    this.skuPurchasingDisabledMessage,
    this.productPrice,
    this.shippingChannels,
    this.productTotalPrice,
    this.cartItemEnabled,
    this.cartItemDisabledMessage,
  });

  String? id;
  String? cartsId;
  String? merchantId;
  String? merchantName;
  String? productId;
  String? variantId;
  int? quantity;
  String? createdBy;
  String? updatedBy;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? merchantLogo;
  String? merchantEmail;
  bool? isRequireShipping;
  PreparationOrder? preparationOrder;
  String? productName;
  bool? purchasingEnabled;
  bool? productPublic;
  String? productType;
  bool? isFreeShipping;
  String? productIal;
  String? productGroup;
  String? thumbnailImagePath;
  bool? hasProductPermission;
  String? sku;
  int? stockQuantity;
  double? weight;
  String? weightUnit;
  List<OptionValue>? optionValues;
  bool? skuPurchasingEnabled;
  int? orderQuantityMinimum;
  String? skuPurchasingDisabledMessage;
  double? productPrice;
  List<ShippingChannel>? shippingChannels;
  double? productTotalPrice;
  bool? cartItemEnabled;
  String? cartItemDisabledMessage;

  factory CartsItem.fromJson(Map<String, dynamic> json) => CartsItem(
        id: json["_id"] == null ? null : json["_id"],
        cartsId: json["cartsId"] == null ? null : json["cartsId"],
        merchantId: json["merchantId"] == null ? null : json["merchantId"],
        merchantName:
            json["merchantName"] == null ? null : json["merchantName"],
        productId: json["productId"] == null ? null : json["productId"],
        variantId: json["variantId"] == null ? null : json["variantId"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        merchantLogo:
            json["merchantLogo"] == null ? null : json["merchantLogo"],
        merchantEmail:
            json["merchantEmail"] == null ? null : json["merchantEmail"],
        isRequireShipping: json["isRequireShipping"] == null
            ? null
            : json["isRequireShipping"],
        preparationOrder: json["preparationOrder"] == null
            ? null
            : PreparationOrder.fromJson(json["preparationOrder"]),
        productName: json["productName"] == null ? null : json["productName"],
        purchasingEnabled: json["purchasingEnabled"] == null
            ? null
            : json["purchasingEnabled"],
        productPublic:
            json["productPublic"] == null ? null : json["productPublic"],
        productType: json["productType"] == null ? null : json["productType"],
        isFreeShipping:
            json["isFreeShipping"] == null ? null : json["isFreeShipping"],
        productIal: json["productIAL"] == null ? null : json["productIAL"],
        productGroup:
            json["productGroup"] == null ? null : json["productGroup"],
        thumbnailImagePath: json["thumbnailImagePath"] == null
            ? null
            : json["thumbnailImagePath"],
        hasProductPermission: json["hasProductPermission"] == null
            ? null
            : json["hasProductPermission"],
        sku: json["sku"] == null ? null : json["sku"],
        stockQuantity:
            json["stockQuantity"] == null ? null : json["stockQuantity"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        weightUnit: json["weightUnit"] == null ? null : json["weightUnit"],
        optionValues: json["optionValues"] == null
            ? null
            : List<OptionValue>.from(
                json["optionValues"].map((x) => OptionValue.fromJson(x))),
        skuPurchasingEnabled: json["skuPurchasingEnabled"] == null
            ? null
            : json["skuPurchasingEnabled"],
        orderQuantityMinimum: json["orderQuantityMinimum"] == null
            ? null
            : json["orderQuantityMinimum"],
        skuPurchasingDisabledMessage:
            json["skuPurchasingDisabledMessage"] == null
                ? null
                : json["skuPurchasingDisabledMessage"],
        productPrice: json["productPrice"] == null
            ? null
            : json["productPrice"].toDouble(),
        shippingChannels: json["shippingChannels"] == null
            ? null
            : List<ShippingChannel>.from(json["shippingChannels"]
                .map((x) => ShippingChannel.fromJson(x))),
        productTotalPrice: json["productTotalPrice"] == null
            ? null
            : json["productTotalPrice"].toDouble(),
        cartItemEnabled:
            json["cartItemEnabled"] == null ? null : json["cartItemEnabled"],
        cartItemDisabledMessage: json["cartItemDisabledMessage"] == null
            ? null
            : json["cartItemDisabledMessage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "cartsId": cartsId == null ? null : cartsId,
        "merchantId": merchantId == null ? null : merchantId,
        "merchantName": merchantName == null ? null : merchantName,
        "productId": productId == null ? null : productId,
        "variantId": variantId == null ? null : variantId,
        "quantity": quantity == null ? null : quantity,
        "createdBy": createdBy == null ? null : createdBy,
        "updatedBy": updatedBy == null ? null : updatedBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "updatedDate":
            updatedDate == null ? null : updatedDate?.toIso8601String(),
        "merchantLogo": merchantLogo == null ? null : merchantLogo,
        "merchantEmail": merchantEmail == null ? null : merchantEmail,
        "isRequireShipping":
            isRequireShipping == null ? null : isRequireShipping,
        "preparationOrder":
            preparationOrder == null ? null : preparationOrder?.toJson(),
        "productName": productName == null ? null : productName,
        "purchasingEnabled":
            purchasingEnabled == null ? null : purchasingEnabled,
        "productPublic": productPublic == null ? null : productPublic,
        "productType": productType == null ? null : productType,
        "isFreeShipping": isFreeShipping == null ? null : isFreeShipping,
        "productIAL": productIal == null ? null : productIal,
        "productGroup": productGroup == null ? null : productGroup,
        "thumbnailImagePath":
            thumbnailImagePath == null ? null : thumbnailImagePath,
        "hasProductPermission":
            hasProductPermission == null ? null : hasProductPermission,
        "sku": sku == null ? null : sku,
        "stockQuantity": stockQuantity == null ? null : stockQuantity,
        "weight": weight == null ? null : weight,
        "weightUnit": weightUnit == null ? null : weightUnit,
        "optionValues": optionValues == null
            ? null
            : List<dynamic>.from(optionValues!.map((x) => x.toJson())),
        "skuPurchasingEnabled":
            skuPurchasingEnabled == null ? null : skuPurchasingEnabled,
        "orderQuantityMinimum":
            orderQuantityMinimum == null ? null : orderQuantityMinimum,
        "skuPurchasingDisabledMessage": skuPurchasingDisabledMessage == null
            ? null
            : skuPurchasingDisabledMessage,
        "productPrice": productPrice == null ? null : productPrice,
        "shippingChannels": shippingChannels == null
            ? null
            : List<dynamic>.from(shippingChannels!.map((x) => x.toJson())),
        "productTotalPrice":
            productTotalPrice == null ? null : productTotalPrice,
        "cartItemEnabled": cartItemEnabled == null ? null : cartItemEnabled,
        "cartItemDisabledMessage":
            cartItemDisabledMessage == null ? null : cartItemDisabledMessage,
      };

  CartItemCheckoutEntity toEntity() => CartItemCheckoutEntity(
        id: id,
        cartsId: cartsId,
        merchantId: merchantId,
        merchantName: merchantName,
        productId: productId,
        variantId: variantId,
        quantity: quantity,
        createdBy: createdBy,
        updatedBy: updatedBy,
        createdDate: createdDate,
        updatedDate: updatedDate,
        merchantLogo: merchantLogo,
        merchantEmail: merchantEmail,
        isRequireShipping: isRequireShipping,
        preparationOrder: PreparationOrder,
        productName: productName,
        purchasingEnabled: purchasingEnabled,
        productPublic: productPublic,
        productType: productType,
        isFreeShipping: isFreeShipping,
        productIAL: productIal,
        productGroup: productGroup,
        thumbnailImagePath: thumbnailImagePath,
        hasProductPermission: hasProductPermission,
        sku: sku,
        stockQuantity: stockQuantity,
        weight: weight,
        weightUnit: weightUnit,
        optionValues: optionValues!.map((e) => e.toEntity()).toList(),
        skuPurchasingEnabled: skuPurchasingEnabled,
        orderQuantityMinimum: orderQuantityMinimum,
        skuPurchasingDisabledMessage: skuPurchasingDisabledMessage,
        productPrice: productPrice,
        shippingChannels: shippingChannels!.map((e) => e.toEntity()).toList(),
        productTotalPrice: productTotalPrice,
        cartItemEnabled: cartItemEnabled,
        cartItemDisabledMessage: cartItemDisabledMessage,
      );
}

class OptionValue {
  OptionValue({
    this.optionDisplayName,
    this.label,
  });

  String? optionDisplayName;
  String? label;

  factory OptionValue.fromJson(Map<String, dynamic> json) => OptionValue(
        optionDisplayName: json["optionDisplayName"] == null
            ? null
            : json["optionDisplayName"],
        label: json["label"] == null ? null : json["label"],
      );

  Map<String, dynamic> toJson() => {
        "optionDisplayName":
            optionDisplayName == null ? null : optionDisplayName,
        "label": label == null ? null : label,
      };

  OptionValuesEntity toEntity() =>
      OptionValuesEntity(optionDisplayName: optionDisplayName, label: label);
}

class PreparationOrder {
  PreparationOrder({
    this.duration,
    this.durationUnit,
  });

  String? duration;
  String? durationUnit;

  factory PreparationOrder.fromJson(Map<String, dynamic> json) =>
      PreparationOrder(
        duration: json["duration"] == null ? null : json["duration"],
        durationUnit:
            json["durationUnit"] == null ? null : json["durationUnit"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration == null ? null : duration,
        "durationUnit": durationUnit == null ? null : durationUnit,
      };
}

class ShippingChannel {
  ShippingChannel({
    this.shippingId,
    this.shippingName,
    this.shippingFeeIncTax,
  });

  String? shippingId;
  String? shippingName;
  double? shippingFeeIncTax;

  factory ShippingChannel.fromJson(Map<String, dynamic> json) =>
      ShippingChannel(
        shippingId: json["shippingId"] == null ? null : json["shippingId"],
        shippingName:
            json["shippingName"] == null ? null : json["shippingName"],
        shippingFeeIncTax: json["shippingFeeIncTax"] == null
            ? null
            : json["shippingFeeIncTax"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "shippingId": shippingId == null ? null : shippingId,
        "shippingName": shippingName == null ? null : shippingName,
        "shippingFeeIncTax":
            shippingFeeIncTax == null ? null : shippingFeeIncTax,
      };

  ShippingChannelsEntity toEntity() => ShippingChannelsEntity(
        shippingId: shippingId,
        shippingName: shippingName,
        shippingFeeIncTax: shippingFeeIncTax,
      );
}

class Member {
  Member({
    this.memberId,
    this.username,
  });

  String? memberId;
  String? username;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        memberId: json["memberId"] == null ? null : json["memberId"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId == null ? null : memberId,
        "username": username == null ? null : username,
      };

  MemberEntity toEntity() => MemberEntity(
        memberId: memberId,
        username: username,
      );
}
