// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_item_entity.dart';
import 'package:ui_style/ui_style.dart';

class SummaryCheckoutWidget extends StatelessWidget {
  const SummaryCheckoutWidget({
    Key? key,
    required this.cartData,
  }) : super(key: key);

  final CartCheckoutEntity cartData;
  final bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    List<CartItemCheckoutEntity>? cartsItem = cartData.cartsItems;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Container(
          // margin:
          //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0001),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: BaseColors.lightestGrey),
            color: BaseColors.lightestGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Today's changes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              for (var cartItem in cartData.cartsItems!)
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${cartItem.productName}'),
                          Text(
                            '฿ ${cartItem.productPrice}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${cartItem.quantity} x @${cartItem.productPrice}',
                            style: TextStyle(color: BaseColors.greyTextColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Standard shipping',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),),
                  Text(
                    'Free',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Divider(
                      height: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '฿ ${cartData.totalIncTax}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: BaseColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: BaseColors.primaryColor,
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      onChanged: (bool? value) {
                        // setState(() {
                        // isChecked = value!;
                        // });
                      },
                    ),
                  ),
                  Text(
                    'By checking out I agree to the ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  TextButton(
                    child: Text(
                      'Terms and conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      print('--click link page term and condition');
                      // Navigator.pushNamed(context, '/termcondition');
                      Navigator.pushNamed(context, 'terms-conditions');
                    },
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: UiButton(
                      title: "Place order",
                      fontSize: 24,
                      buttonType: ButtonType.primaryBtn,
                      onPress: () {
                        Navigator.pushNamed(context, '/preview');
                      },
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ],
              )
            ],
          )),
    );

    // Text('Summary cart');
  }
}
