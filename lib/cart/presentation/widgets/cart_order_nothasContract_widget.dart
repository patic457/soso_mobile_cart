// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_cart/cart/core/themes/app_colors.dart';
import 'package:marketplace_cart/cart/core/themes/app_fontconfig.dart';
import 'package:marketplace_cart/cart/presentation/bloc/count_amount/count_amount_bloc.dart';
import 'package:marketplace_cart/cart/presentation/widgets/cart_deleteAlert_widget.dart';
import 'package:ui_style/base_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void doNothing(BuildContext context) {}

class CartOrderNotHasContractWidget extends StatefulWidget {
  const CartOrderNotHasContractWidget({super.key});

  @override
  State<CartOrderNotHasContractWidget> createState() =>
      _CartOrderNotHasContractWidgetState();
}

class _CartOrderNotHasContractWidgetState
    extends State<CartOrderNotHasContractWidget> {
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
                color: Colors.white),
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
                              border:
                                  Border.all(color: BaseColors.lightestGrey),
                            ),
                            child: Image.network(
                              'https://www.dotlife.store/media/catalog/product/cache/image/700x560/e9c3970ab036de70892d86c6d221abfe/a/i/airpods_pro_pdp_us_1_6.jpg',
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
                                'AirPods รองรับ MagSafe Charge',
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
                                      child: Text('',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400))),
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
                                      '',
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
                                fontStyle: AppFontStyle.normalfontstyle,
                                fontWeight: AppFontStyle.fontw700,
                                color: BaseColors.darkestGrey),
                          ),
                          Text(
                            'Total Order',
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: AppFontStyle.normalfontstyle,
                                fontWeight: AppFontStyle.fontw700,
                                color: BaseColors.darkestGrey),
                          ),
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
                                width: 26,
                                height: 21,
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
                                    color: AppColors.neutraldarkGrey,
                                    fontSize: 20,
                                  ),
                                )),
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
                                      '฿ 8,900',
                                      style: TextStyle(
                                        color: BaseColors.textGreenColor,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
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
                      height: 32,
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
