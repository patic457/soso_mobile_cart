// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/domain/entities/selected_payment_method_entity.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';
import 'package:ui_style/ui_style.dart';

class PaymentMethodCheckoutWidget extends StatelessWidget {
  const PaymentMethodCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: BlocBuilder<SelectPaymentMethodBloc, SelectPaymentMethodState>(
            builder: (context, state) {
          // context.read<SelectPaymentMethodBloc>();
          //  if(state is SelectPaymentMethodState) {

          return Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              if (state.selectedPaymentMethodEntity.paymentMethodEntity != null)
                ExitingPaymentmethodWidget(
                    paymentMethod: state.selectedPaymentMethodEntity),
              if (state.selectedPaymentMethodEntity.paymentMethodEntity == null)
                AddPaymentmethodWidget(),
              //     Row(
              //       // ignore: prefer_const_literals_to_create_immutables
              //       children: [
              //         SizedBox(
              //           height: MediaQuery.of(context).size.height * 0.083,
              //         ),
              //         // Expanded(child: Text('Please select a payment method before placing an order.',
              //         // style: TextStyle(
              //         //   color: Colors.red
              //         // ),)),
              //       ],
              //     ),
            ],
          );
        }));
  }
}

class ExitingPaymentmethodWidget extends StatelessWidget {
  const ExitingPaymentmethodWidget({
    Key? key,
    required this.paymentMethod,
  }) : super(key: key);

  final SelectedPaymentMethodEntity paymentMethod;

  @override
  Widget build(BuildContext context) {
    print('----Exting--->${paymentMethod}');
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: BaseColors.lightestGrey),
        color: BaseColors.lightestGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          if (paymentMethod.paymentMethodEntity != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Pay with ${paymentMethod.paymentMethodEntity?.paymentMethodName}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text(
                    'Change',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: BaseColors.primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment-method');
                  },
                )
              ],
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          if (paymentMethod.bankOption != null)
            Row(
              children: [Text('${paymentMethod.bankOption?.bankName}')],
            ),
        ],
      ),
    );
  }
}

class AddPaymentmethodWidget extends StatelessWidget {
  const AddPaymentmethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('----click select payment method----');
        Navigator.pushNamed(context, '/payment-method');
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: BaseColors.lightestGrey),
                color: BaseColors.lightestGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Select payment method',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
