// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:marketplace/cart/presentation/widgets/address_checkout_widget.dart';
import 'package:marketplace/cart/presentation/widgets/payment_method_checkout_widget.dart';
import 'package:marketplace/cart/presentation/widgets/product_items_checkout_widget.dart';
import 'package:marketplace/cart/presentation/widgets/step_progressbar_checkout_widget.dart';
import 'package:marketplace/cart/presentation/widgets/summary_checkout_widget.dart';
import 'package:ui_style/ui_style.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final String memberId = 'f6YZQ2H2og1';
  final String sDefault = 'true';

  @override
  Widget build(BuildContext context) {
    final checkoutBloc = context.read<CheckoutBloc>();
    const sDefault = 'true';
    // context.read<CheckoutBloc>().add(OnGetDeliveryAddress(memberId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors.secondaryColor,
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            _onOpenDialogConfirm();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutInitial) {
            checkoutBloc.add((OnGetCart(memberId)));
            checkoutBloc.add(OnGetDeliveryAddress(memberId, sDefault));
            print('------CheckoutInitial------');
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCartLoading) {
            print('------GetCartLoading------');
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCartEmpty) {
            print('------GetCartEmpty------');
            return const SizedBox();
          } else if (state is MainGetcart) {
            print('------MainGetcart------');
            return RefreshIndicator(
              // ดึงหน้าจอrefresh UI
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 2,
                          child: StepProgressbarCheckoutWidget()),
                      Expanded(
                        flex: 0,
                        child: ProductItemsCheckoutWidget(
                            cartData: state.cartResult),
                      ),
                      AddressCheckoutWidget(
                          cartData: state.cartResult,
                          deliveryAddressDatas:
                              checkoutBloc.deliveryAddressDatas),
                      PaymentMethodCheckoutWidget(),
                      SummaryCheckoutWidget(cartData: state.cartResult),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  _onOpenDialogConfirm() {
    AlertDialog alert = AlertDialog(
      titlePadding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'ออกจากการสั่งซื้อสินค้า',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.05),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'ระบบจะไม่บันทึกข้อมูลของคุณ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: UiButton(
                    title: "ทำรายการต่อ",
                    fontSize: 24,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Row(
              children: [
                Expanded(
                  child: UiButton(
                    title: "ออก",
                    fontSize: 24,
                    buttonType: ButtonType.secondaryBtn,
                    onPress: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        )
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => alert,
    );
  }
}
