// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductItemsCheckoutWidget extends StatelessWidget {
  const ProductItemsCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFD9D9D9),
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
                                    'https://cdn.shopify.com/s/files/1/0449/3731/4458/products/iphone-12-pro-family-hero_1200x1200.jpg?v=1626565356'),
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Apple iPhone 12 Pro Max',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(),
                                  1: FlexColumnWidth(),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <TableRow>[
                                  TableRow(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      Text('Color', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                                      Text('Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)
                                    ],
                                  ),
                                  TableRow(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      Text('Burgundy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                                      Text('128 GB', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                ],
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
                    Text('Quatity'),
                    Text('Total order'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      '1',
                      style: TextStyle(
                          color: Color(0xFF1E3D35),
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '฿ 36,000',
                      style: TextStyle(
                          color: Color(0xFF1E3D35),
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
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
        // ),
        // );
      },
    );
  }
}
