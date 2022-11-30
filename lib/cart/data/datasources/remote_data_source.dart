import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';

abstract class RemoteDataSource {
  Future<List<PaymentMethodModel>> listPaymentMethod();
}
