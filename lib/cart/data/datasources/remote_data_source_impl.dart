import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace/cart/core/constants.dart';
import 'package:marketplace/cart/core/exception.dart';
import 'package:marketplace/cart/data/datasources/remote_data_source.dart';
import 'package:marketplace/cart/data/models/cart_checkout_model.dart';
import 'package:marketplace/cart/data/models/delivery_address_model.dart';
import 'package:marketplace/cart/data/models/payment_method_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PaymentMethodModel>> listPaymentMethod() async {
    final response = await client.get(Uri.parse(Urls.listPaymentMethodUrl),
        headers: Urls.listPaymentMethodRequiredHeaders);

    if (response.statusCode != HttpStatus.ok) {
      throw ServerException();
    }

    final json = jsonDecode(response.body);
    final dynamic paymentListJson = json['results'] ?? [];

    final List<PaymentMethodModel> paymentList = paymentListJson
        .map<PaymentMethodModel>((e) => PaymentMethodModel.fromJson(e))
        .toList();
    return paymentList;
  }

  // getDeliveryAddress
  @override
  Future<DeliveryAddressModel> getDeliveryAddress(
      String memberId, String sDefault) async {
    Map<String, String> queryParams = {
      'memberId': memberId,
      'default': sDefault
    };

    try {
      var response = await DioHelper(
              baseUrl: Urls.addressesUrl,
              headers: Urls.getDeliveryAddressesRequiredHeader)
          .dioClient(isCache: true)
          .get('/deliveryaddresses', queryParameters: queryParams);

      if (response.statusCode == 200) {
        return DeliveryAddressModel.fromJson(response.data);
      }
    } on Exception catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          throw "Data not found";
        }
      }
    }
    throw ServerException();
  }

  // getCart
  @override
  Future<CartCheckoutModel> getCart(String memberId) async {
    Map<String, String> queryParams = {
      'memberId': memberId,
    };

    try {
      var response = await DioHelper(
              baseUrl: Urls.cartUrl, headers: Urls.getCartRequiredHeader)
          .dioClient(isCache: true)
          .get('/carts', queryParameters: queryParams);

      if (response.statusCode == 200) {
        return CartCheckoutModel.fromJson(response.data);
      }
    } on Exception catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          throw "Data not found";
        }
      }
    }
    throw ServerException();
  }
}
