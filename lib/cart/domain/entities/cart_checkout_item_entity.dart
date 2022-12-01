import 'package:equatable/equatable.dart';

class CartItemCheckoutEntity extends Equatable {
  final String? id;
  final String? cartsId;
  final String? merchantId;
  final String? merchantName;
  final String? productId;
  final String? variantId;
  final int? quantity;
  final String? createdBy;
  final String? updatedBy;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String?merchantLogo;
  final String? merchantEmail;
  final bool? isRequireShipping;
  final Object? preparationOrder;
  final String? productName;
  final bool? purchasingEnabled;
  final bool? productPublic;
  final String? productType;
  final bool? isFreeShipping;
  final String? productIAL;
  final String? productGroup;
  final String? thumbnailImagePath;
  final bool? hasProductPermission;
  final String? sku;
  final int? stockQuantity;
  final double? weight;
  final String? weightUnit;
  final List<OptionValuesEntity>? optionValues;
  final bool? skuPurchasingEnabled;
  final int? orderQuantityMinimum;
  final String? skuPurchasingDisabledMessage;
  final double? productPrice;
  final List<ShippingChannelsEntity>? shippingChannels;
  final double? productTotalPrice;
  final bool? cartItemEnabled;
  final String? cartItemDisabledMessage;

  CartItemCheckoutEntity({
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
     this.productIAL,
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

  @override
  List<Object?> get props => [
        id,
        cartsId,
        merchantId,
        merchantName,
        productId,
        variantId,
        quantity,
        createdBy,
        updatedBy,
        createdDate,
        updatedDate,
        merchantLogo,
        merchantEmail,
        isRequireShipping,
        preparationOrder,
        productName,
        purchasingEnabled,
        productPublic,
        productType,
        isFreeShipping,
        productIAL,
        productGroup,
        thumbnailImagePath,
        hasProductPermission,
        sku,
        stockQuantity,
        weight,
        weightUnit,
        optionValues,
        skuPurchasingEnabled,
        orderQuantityMinimum,
        skuPurchasingDisabledMessage,
        productPrice,
        shippingChannels,
        productTotalPrice,
        cartItemEnabled,
        cartItemDisabledMessage,
      ];
}

class OptionValuesEntity extends Equatable {
  final String? label;
  final String? optionDisplayName;

  OptionValuesEntity({
    this.label,
    this.optionDisplayName,
  });

  @override
  List<Object?> get props => [label, optionDisplayName];
}

class ShippingChannelsEntity extends Equatable {
  final String? shippingId;
  final String? shippingName;
  final double? shippingFeeIncTax;

  ShippingChannelsEntity(
      { this.shippingId,
       this.shippingName,
       this.shippingFeeIncTax});

  @override
  List<Object?> get props => [shippingId, shippingName, shippingFeeIncTax];
}
