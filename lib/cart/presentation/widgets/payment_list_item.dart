import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soso_mobile_cart/cart/domain/entities/payment_method_entity.dart';

class PaymentMethodListItem extends StatelessWidget {
  const PaymentMethodListItem({
    Key? key,
    required this.paymentMethod,
  }) : super(key: key);

  final PaymentMethodEntity paymentMethod;

  @override
  Widget build(BuildContext context) {
    late String result;
    late Widget paymentMethodImageWidget;
    if (paymentMethod.paymentMethodImage != null &&
        paymentMethod.paymentMethodImage!.isNotEmpty) {
      result = paymentMethod.paymentMethodImage!;
    } else {
      result = '';
    }

    // if (result.contains('.svg')) {
    //   paymentMethodImageWidget = SvgPicture.network(result);
    // } else

    if (result.isNotEmpty) {
      paymentMethodImageWidget = Image.network(result);
    } else {
      paymentMethodImageWidget = const SizedBox();
    }

    Widget checkPaymentType(String paymentMethodName) {
      if (paymentMethodName.toLowerCase().contains('credit')) {
        return SizedBox(
          height: 45,
          width: 100,
          child: paymentMethodImageWidget,
        );
      } else if (paymentMethodName.toLowerCase().contains('qr')) {
        return SizedBox(
          height: 45,
          width: 100,
          child: paymentMethodImageWidget,
        );
      } else if (paymentMethodName.toLowerCase().contains('rabbit')) {
        return SizedBox(
          height: 45,
          width: 110,
          child: paymentMethodImageWidget,
        );
      } else {
        return SizedBox(
          height: 45,
          width: 50,
          child: paymentMethodImageWidget,
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          paymentMethod.paymentMethodName!,
          style: TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            checkPaymentType(paymentMethod.paymentMethodName!),
            const SizedBox(
              width: 6,
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                'assets/images/icons/stroke.png',
                package: 'marketplace',
              ),
            )
          ],
        )
      ],
    );
  }
}
