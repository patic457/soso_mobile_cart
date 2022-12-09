// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_order_hasContract_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_order_nothasContract_widget.dart';

class CartorderWidget extends StatefulWidget {
  const CartorderWidget({super.key});

  @override
  State<CartorderWidget> createState() => _CartorderWidget();
}

class _CartorderWidget extends State<CartorderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CartOrderHasContractWidget(),
        CartOrderNotHasContractWidget(),
      ],
    );
  }
}
