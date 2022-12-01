// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cart/core/themes/app_colors.dart';
import 'package:marketplace/cart/core/themes/app_fontconfig.dart';
import 'package:marketplace/cart/presentation/bloc/count_amount/count_amount_bloc.dart';
import 'package:marketplace/cart/presentation/widgets/cart_deleteAlert_widget.dart';
import 'package:ui_style/base_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void doNothing(BuildContext context) {}

class CartOrderHasContractWidget extends StatefulWidget {
  const CartOrderHasContractWidget({super.key});

  @override
  State<CartOrderHasContractWidget> createState() =>
      _CartOrderHasContractWidgetState();
}

class _CartOrderHasContractWidgetState
    extends State<CartOrderHasContractWidget> {

  late int countItem;

  @override
  void initState() {
    countItem = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: BaseColors.greyColor),
                color: BaseColors.whiteColor),
            child: ClipRect(
              child: Slidable(
                key: const ValueKey(0),
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  extentRatio: 0.21,
                  children: [
                    SlidableAction(
                      flex: 1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      onPressed: doNothing,
                      backgroundColor: BaseColors.failColor,
                      foregroundColor: BaseColors.whiteColor,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: BaseColors.lightestGrey,
                            ),
                            child: Image.network(
                              'https://www.ais.th/apple/apple-packshot-images/iphone-12/iphone-12-pro/12-pro-pacific_blue.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Apple Iphone 12  Pro Max',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: AppFontStyle.fontw700,
                                    fontStyle: AppFontStyle.normalfontstyle,
                                    color: BaseColors.darkestGrey),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Color',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: AppFontStyle.fontw400,
                                          fontStyle:
                                              AppFontStyle.normalfontstyle,
                                          color: BaseColors.darkestGrey),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Size',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: AppFontStyle.fontw400,
                                          fontStyle:
                                              AppFontStyle.normalfontstyle,
                                          color: BaseColors.darkestGrey),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Pacific Blue',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: AppFontStyle.fontw700,
                                          fontStyle:
                                              AppFontStyle.normalfontstyle,
                                          color: BaseColors.darkestGrey),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '128 GB',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: AppFontStyle.fontw700,
                                          fontStyle:
                                              AppFontStyle.normalfontstyle,
                                          color: BaseColors.darkestGrey),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: AppFontStyle.fontw700,
                                color: BaseColors.darkestGrey,
                                fontStyle: AppFontStyle.normalfontstyle),
                          ),
                          Text(
                            'Total Order',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: AppFontStyle.fontw700,
                                color: BaseColors.darkestGrey,
                                fontStyle: AppFontStyle.normalfontstyle),
                          )
                        ],
                      ),
                    ),
                    BlocConsumer<CountAmountBloc, CountAmountState>(
                      listener: (context, state) {
                        if (state is CountAmountCal) {
                          if (state.counter > 0) {
                            print(state.counter);
                            countItem = state.counter;
                          }
                        } else if (state is CountAmountZero) {
                          setState(() {
                            countItem = 0;
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CartDeleteAlert(),
                            );
                          });
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is CountAmountInitial ||
                          current is CountAmountCal,
                      builder: (context, state) {
                        if (state is CountAmountInitial ||
                            state is CountAmountCal) {
                          return Row(
                            children: [
                              SizedBox(
                                height: 21,
                                width: 26,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<CountAmountBloc>()
                                      .add(CountAmountRemoveEvent(countItem));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  minimumSize: Size(32, 32),
                                  backgroundColor: BaseColors
                                      .primaryColor50, // <-- Button color
                                  // foregroundColor: Colors.red, // <-- Splash color
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: BaseColors.primaryColor,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 42,
                                width: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border:
                                        Border.all(color: BaseColors.greyColor),
                                    color: BaseColors.whiteColor),
                                child: Center(
                                  child: Text(
                                    countItem.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.neutraldarkGrey,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                        fontWeight: AppFontStyle.fontw400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                onPressed: () {
                           
                                  context
                                      .read<CountAmountBloc>()
                                      .add(CountAmountAddEvent(countItem));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  minimumSize: Size(32, 32),
                                  backgroundColor: BaseColors
                                      .primaryColor50, // <-- Button color
                                  // foregroundColor: Colors.red, // <-- Splash color
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: BaseColors.primaryColor,
                                  size: 20,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '฿ 36,000',
                                      style: TextStyle(
                                        color: BaseColors.textGreenColor,
                                        fontSize: 28,
                                        fontWeight: AppFontStyle.fontw700,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Divider(
                              color: BaseColors.greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Contract',
                                    style: TextStyle(
                                        color: BaseColors.darkestGrey,
                                        fontSize: 18,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                        fontWeight: AppFontStyle.fontw400),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'No Contract',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: AppFontStyle.fontw700,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                        color: BaseColors.darkestGrey),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  Text(
                                    'New Number',
                                    style: TextStyle(
                                        color: BaseColors.darkestGrey,
                                        fontSize: 18,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                        fontWeight: AppFontStyle.fontw400),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      '089-999-2322',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: AppFontStyle.fontw700,
                                          fontStyle:
                                              AppFontStyle.normalfontstyle,
                                          color: BaseColors.darkestGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'SIM Type',
                                    style: TextStyle(
                                        color: BaseColors.darkestGrey,
                                        fontSize: 18,
                                        fontWeight: AppFontStyle.fontw400,
                                        fontStyle:
                                            AppFontStyle.normalfontstyle),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Physical SIM',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: AppFontStyle.fontw700,
                                        fontStyle: AppFontStyle.normalfontstyle,
                                        color: BaseColors.darkestGrey),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [Text(''), Text('')],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
