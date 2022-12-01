// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_item_entity.dart';
import 'package:ui_style/ui_style.dart';

class ProductItemsCheckoutWidget extends StatelessWidget {
  const ProductItemsCheckoutWidget({
    Key? key,
    required this.cartData,
  }) : super(key: key);

  final CartCheckoutEntity cartData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartData.cartsItems?.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final cartItem = cartData.cartsItems?[index];
        List<OptionValuesEntity>? optionValues = cartData.cartsItems?[index].optionValues;

        return Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
              color: BaseColors.greyColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${cartItem?.thumbnailImagePath}')
                                  // 'https://cdn.shopify.com/s/files/1/0449/3731/4458/products/iphone-12-pro-family-hero_1200x1200.jpg?v=1626565356'),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  TableRow(
                                    children: <Widget>[
                                      Text('${cartItem?.productName}',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.start,
                                          textDirection: TextDirection.ltr),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              if(optionValues?.length != 0)
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: <TableRow>[
                                  TableRow(
                                    children: [
                                      for (var optionValueDisplayName
                                          in optionValues ?? [])
                                        Text(
                                            '${optionValueDisplayName.optionDisplayName}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  TableRow(
                                    children: <Widget>[
                                      for (var optionValueLabel
                                          in optionValues ?? [])
                                        Text(
                                          '${optionValueLabel.label}',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              if(optionValues?.length == 0)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              )
                            ],
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Quatity',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Total order',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${cartItem?.quantity}',
                      style: TextStyle(
                          color: BaseColors.secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '฿ ${cartItem?.productTotalPrice}',
                      style: TextStyle(
                          color: BaseColors.secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        );
        // );
      },
    );
  }
}
