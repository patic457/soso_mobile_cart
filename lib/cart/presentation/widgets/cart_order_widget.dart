// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../domain/entities/cart_checkout_item_entity.dart';
import 'cart_order_item_widget.dart';

class CartorderWidget extends StatefulWidget {
  final CartItemCheckoutEntity? cartItem;

  const CartorderWidget({super.key, this.cartItem});

  @override
  State<CartorderWidget> createState() => _CartorderWidget();
}

class _CartorderWidget extends State<CartorderWidget> {
  late int? countItem = widget.cartItem?.quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartOrderItemWidget(cartItem: widget.cartItem),
        // CartOrderHasContractWidget(),
        // CartOrderNotHasContractWidget(),
      ],
    );
  }
}
