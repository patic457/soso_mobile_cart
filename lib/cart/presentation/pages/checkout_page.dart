// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/address_checkout_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/payment_method_checkout_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/product_items_checkout_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/step_progressbar_checkout_widget.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/summary_checkout_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
              fontWeight: FontWeight.w700,
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
              fontWeight: FontWeight.w700,
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      'ทำรายการต่อ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          bottom: MediaQuery.of(context).size.height * 0.015,
                        ),
                        backgroundColor: Color(0xFF73C23A),
                        shape: StadiumBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      'ออก',
                      style: TextStyle(
                          color: Color(0xFF73C23A),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015,
                        bottom: MediaQuery.of(context).size.height * 0.015,
                      ),
                    ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF25584F),
        title: const Text('Checkout'),
        leading: IconButton(
          onPressed: () {
            _onOpenDialogConfirm();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        // ดึงหน้าจอrefresh UI
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 2,
                    child: StepProgressbarCheckoutWidget()),
                Expanded(
                  flex: 0,
                  child: ProductItemsCheckoutWidget(),
                ),
                AddressCheckoutWidget(),
                PaymentMethodCheckoutWidget(),
                SummaryCheckoutWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
