import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:soso_mobile_cart/cart/core/constants.dart';
import 'package:soso_mobile_cart/cart/core/exception.dart';
import 'package:soso_mobile_cart/cart/data/datasources/remote_data_source.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PaymentMethodModel>> listPaymentMethod() async {
    final response = await client.get(Uri.parse(Urls.listPaymentMethodUrl),
        headers: Urls.listPaymentMethodRequiredHeaders);

    //log(response.body);

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
}
