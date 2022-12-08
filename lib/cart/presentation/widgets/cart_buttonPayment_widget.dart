import 'package:soso_mobile_cart/cart/core/themes/app_fontconfig.dart';
import 'package:ui_style/base_color.dart';
import 'package:flutter/material.dart';

class CartButtonPaymentWidget extends StatefulWidget {
  const CartButtonPaymentWidget({super.key});

  @override
  State<CartButtonPaymentWidget> createState() => _CartButtonPaymentWidget();
}

class _CartButtonPaymentWidget extends State<CartButtonPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    void onPressedPayment() {
      setState(() {
        //call Api checkout
        print('Payment');
      });
      Navigator.of(context).pushNamed('/checkout');
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.91,
        child: ElevatedButton(
          onPressed: onPressedPayment,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(BaseColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          child: Text(
            "Make Payment",
            style: TextStyle(
              fontWeight: AppFontStyle.fontw700,
              fontStyle: AppFontStyle.normalfontstyle,
              color: BaseColors.whiteColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
