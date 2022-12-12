import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/core/themes/app_fontconfig.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_order_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_recommend_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/cart_totalsumproduct_widget.dart';
import 'package:ui_style/base_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final String memberId = 'f6YZQ2H2og1';

  @override
  void initState() {
    context.read<CheckoutBloc>().add(OnGetCart(memberId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cartProductWidget() {
      cartProductListViewWidget(state) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.cartResult.cartsItems?.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CartorderWidget(
                cartItem: state.cartResult.cartsItems?[index],
              );
            },
          );

      checkoutStateWidget(state) {
        Widget checkoutRes = Container();
        if (state is CheckoutLoading) {
          checkoutRes = const CircularProgressIndicator();
        } else if (state is MainGetcart) {
          checkoutRes = cartProductListViewWidget(state);
        } else if (state is CheckoutError) {
          checkoutRes = const Center(child: Text('Error'));
        }
        return checkoutRes;
      }

      var cartProductWidget = BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {},
        buildWhen: (previous, current) =>
            current is CheckoutLoading ||
            current is MainGetcart ||
            current is CheckoutError,
        builder: (context, state) {
          return checkoutStateWidget(state);
        },
      );
      return cartProductWidget;
    }

    Widget recommendedProductWidget = const RecommendedProductWidget();
    Widget totalSummaryProductWidget = const CartTotalsumproductWidget();

    var body = Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                cartProductWidget(),
                recommendedProductWidget,
              ],
            ),
          ),
        ),
        Container(child: totalSummaryProductWidget)
      ],
    );

    var appbar = AppBar(
      backgroundColor: BaseColors.secondaryColor,
      title: Text(
        'Cart',
        style: TextStyle(fontSize: 32, fontWeight: AppFontStyle.fontw700),
      ),
      centerTitle: true,
      leading: const Icon(Icons.arrow_back_ios_outlined),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar,
      body: body,
    );
  }
}
