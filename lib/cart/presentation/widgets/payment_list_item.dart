import 'package:flutter/material.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';

class PaymentMethodListItem extends StatelessWidget {
  const PaymentMethodListItem({
    Key? key,
    required this.paymentMethod,
  }) : super(key: key);

  final PaymentMethodEntity paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(paymentMethod.paymentMethodName!),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.network(
                paymentMethod.paymentMethodImage!,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/icons/stroke.png'),
            )
          ],
        )
      ],
    );
  }
}
