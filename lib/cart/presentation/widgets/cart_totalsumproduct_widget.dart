// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:soso_mobile_cart/cart/core/themes/app_fontconfig.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_buttonPayment_widget.dart';
import 'package:ui_style/base_color.dart';

class CartTotalsumproductWidget extends StatelessWidget {
  const CartTotalsumproductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: BaseColors.textGreenColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      color: BaseColors.whiteColor,
                      fontWeight: AppFontStyle.fontw700,
                      fontStyle: AppFontStyle.normalfontstyle,
                      fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    '฿ 44,900',
                    style: TextStyle(
                        color: BaseColors.whiteColor,
                        fontWeight: AppFontStyle.fontw500,
                        fontSize: 20,
                        fontStyle: AppFontStyle.normalfontstyle),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [CartButtonPaymentWidget()],
          ),
        ],
      ),
    );
  }
}
