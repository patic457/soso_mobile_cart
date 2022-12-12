// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_style/base_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_fontconfig.dart';
import '../../domain/entities/cart_checkout_item_entity.dart';
import '../bloc/count_amount/count_amount_bloc.dart';

void doNothing(BuildContext context) {}

class CartOrderItemWidget extends StatefulWidget {
  final CartItemCheckoutEntity? cartItem;
  CartOrderItemWidget({super.key, this.cartItem});

  @override
  State<CartOrderItemWidget> createState() => CartItemState();
}

class CartItemState extends State<CartOrderItemWidget> {
  late int? countItem = widget.cartItem?.quantity;

  @override
  Widget build(BuildContext context) {
    void decreaseAction() =>
        context.read<CountAmountBloc>().add(CountAmountRemoveEvent(countItem!));
    void increaseAction() =>
        context.read<CountAmountBloc>().add(CountAmountAddEvent(countItem!));

    Image productImage = Image.network(
      '${widget.cartItem?.thumbnailImagePath}',
      width: 80,
      height: 80,
    );

    var productTitle = Text(
      '${widget.cartItem?.productName}',
      style: TextStyle(
          fontSize: 28,
          fontWeight: AppFontStyle.fontw700,
          fontStyle: AppFontStyle.normalfontstyle,
          color: BaseColors.darkestGrey),
    );

    // productItemWidget() {}

    optionValuesWidget() {
      var optionValuesTitleRow = Row(
        children: [
          Expanded(
            child: Text(
              widget.cartItem!.optionValues!.isNotEmpty
                  ? '${widget.cartItem?.optionValues?[0].optionDisplayName}'
                  : "",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: AppFontStyle.fontw400,
                  fontStyle: AppFontStyle.normalfontstyle,
                  color: BaseColors.darkestGrey),
            ),
          ),
          Expanded(
            child: Text(
              widget.cartItem!.optionValues!.isNotEmpty
                  ? '${widget.cartItem?.optionValues?[1].optionDisplayName}'
                  : "",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: AppFontStyle.fontw400,
                  fontStyle: AppFontStyle.normalfontstyle,
                  color: BaseColors.darkestGrey),
            ),
          ),
        ],
      );
      var optionValuesRow = Row(
        children: [
          Expanded(
            child: Text(
              widget.cartItem!.optionValues!.isNotEmpty
                  ? '${widget.cartItem?.optionValues?[0].label}'
                  : "",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: AppFontStyle.fontw700,
                  fontStyle: AppFontStyle.normalfontstyle,
                  color: BaseColors.darkestGrey),
            ),
          ),
          Expanded(
            child: Text(
              widget.cartItem!.optionValues!.isNotEmpty
                  ? '${widget.cartItem?.optionValues?[1].label}'
                  : "",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: AppFontStyle.fontw700,
                  fontStyle: AppFontStyle.normalfontstyle,
                  color: BaseColors.darkestGrey),
            ),
          ),
        ],
      );
      var sizedBox = SizedBox(height: 45);
      var col = Column(
        children: [
          optionValuesTitleRow,
          SizedBox(height: 4),
          optionValuesRow,
        ],
      );
      return widget.cartItem!.optionValues!.isNotEmpty ? col : sizedBox;
    }

    contractWidget() {
      return Table(
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
                            fontStyle: AppFontStyle.normalfontstyle,
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
                          fontStyle: AppFontStyle.normalfontstyle),
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
      );
    }

    var deleteActionPane = const ActionPane(
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
          label: 'DELETE',
        ),
      ],
    );

    quantityWidget() {
      void DeleteProductShowDialog(context) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Center(
              child: Text(
                'Do you want to delete this product',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: AppFontStyle.fontw700,
                    fontStyle: AppFontStyle.normalfontstyle,
                    color: BaseColors.darkestGrey),
              ),
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            BaseColors.primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: BaseColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            countItem = 0;
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontSize: 24, fontWeight: AppFontStyle.fontw700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            countItem = 1;
                            increaseAction;
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: AppFontStyle.fontw700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              )
            ],
          ),
        );
      }

      var quantityWidget = Padding(
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
      );

      quantityButton(icon) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            minimumSize: Size(32, 32),
            backgroundColor: BaseColors.primaryColor50, // <-- Button color
            // foregroundColor: Colors.red, // <-- Splash color
          ),
          onPressed: icon == Icons.remove ? decreaseAction : increaseAction,
          child: Icon(
            icon,
            color: BaseColors.primaryColor,
            size: 20,
          ),
        );
      }

      quantityCountDisplay() {
        return Container(
          height: 42,
          width: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: BaseColors.greyColor),
              color: BaseColors.whiteColor),
          child: Center(
            child: Text(
              countItem.toString(),
              style: TextStyle(
                fontSize: 20,
                color: AppColors.neutraldarkGrey,
                fontStyle: AppFontStyle.normalfontstyle,
                fontWeight: AppFontStyle.fontw400,
              ),
            ),
          ),
        );
      }

      var quaCal = BlocConsumer<CountAmountBloc, CountAmountState>(
        listener: (context, state) {
          if (state is CountAmountCal) {
            int stateCount = state.counter;
            print("StateCounter: " + stateCount.toString());
            if (stateCount > 0) {
              countItem = stateCount;
            }
          } else if (state is CountAmountZero) {
            setState(() {
              DeleteProductShowDialog(context);
              // countItem = 0;
            });
          }
        },
        buildWhen: (previous, current) =>
            current is CountAmountInitial || current is CountAmountCal,
        builder: (context, state) {
          if (state is CountAmountInitial || state is CountAmountCal) {
            return Row(
              children: [
                quantityButton(Icons.remove),
                SizedBox(width: 8),
                quantityCountDisplay(),
                SizedBox(width: 8),
                quantityButton(Icons.add),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.cartItem?.productTotalPrice}',
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
      );
      return Column(
        children: [quantityWidget, quaCal],
      );
    }

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
                endActionPane: deleteActionPane,
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
                            child: productImage,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              productTitle,
                              SizedBox(height: 8),
                              optionValuesWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    quantityWidget(),
                    SizedBox(height: 16),
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
                    SizedBox(height: 4),
                    contractWidget(),
                    SizedBox(height: 16)
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
