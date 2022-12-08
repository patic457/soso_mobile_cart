import 'package:flutter/material.dart';
import 'package:marketplace_cart/cart/core/themes/app_fontconfig.dart';
import 'package:marketplace_cart/cart/presentation/widgets/cart_order_widget.dart';
import 'package:marketplace_cart/cart/presentation/widgets/cart_recommend_widget.dart';
import 'package:marketplace_cart/cart/presentation/widgets/cart_totalsumproduct_widget.dart';
import 'package:ui_style/base_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: BaseColors.secondaryColor,
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 32, fontWeight: AppFontStyle.fontw700),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CartorderWidget();
                    },
                  ),
                  RecommendedProductWidget()
                ],
              ),
            ),
          ),
          Container(
            child: CartTotalsumproductWidget(),
          )
        ],
      ),
    );
  }
}
