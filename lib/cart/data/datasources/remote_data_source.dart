import 'package:soso_mobile_cart/cart/data/models/cart_checkout_model.dart';
import 'package:soso_mobile_cart/cart/data/models/delivery_address_model.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';

abstract class RemoteDataSource {
  Future<List<PaymentMethodModel>> listPaymentMethod();
  Future<DeliveryAddressModel> getDeliveryAddress(
      String memberId, String sDefault);
  Future<CartCheckoutModel> getCart(String memberId);
}
