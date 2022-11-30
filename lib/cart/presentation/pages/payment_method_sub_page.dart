import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/core/themes/app_colors.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';

class PaymentMethodSubPage extends StatelessWidget {
  PaymentMethodSubPage({super.key});

  BankOption _subPaymentMethod = BankOption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: BlocBuilder<SelectPaymentMethodBloc, SelectPaymentMethodState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedPaymentMethodEntity.paymentMethodEntity!
                              .paymentMethodName
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.selectedPaymentMethodEntity
                        .paymentMethodEntity!.bankOptions!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final paymentSubMethod = state.selectedPaymentMethodEntity
                          .paymentMethodEntity!.bankOptions![index];
                      late Widget paymentMethodImageWidget;

                      if (state.selectedPaymentMethodEntity.paymentMethodEntity!
                          .bankOptions![index]!.bankImage!
                          .contains('.png')) {
                        paymentMethodImageWidget = Image.network(state
                            .selectedPaymentMethodEntity
                            .paymentMethodEntity!
                            .bankOptions![index]!
                            .bankImage!);
                      } else {
                        paymentMethodImageWidget = const SizedBox();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: InkWell(
                                onTap: () {
                                  _subPaymentMethod = paymentSubMethod;
                                  context.read<SelectPaymentMethodBloc>().add(
                                      OnSelectSubPaymentMethodEvent(
                                          subPaymentMethod: _subPaymentMethod));
                                },
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.2,
                                      child: Radio(
                                        activeColor: AppColors.kLightGreen,
                                        value: paymentSubMethod,
                                        groupValue: _subPaymentMethod,
                                        onChanged: (value) {
                                          _subPaymentMethod = value!;
                                          context
                                              .read<SelectPaymentMethodBloc>()
                                              .add(
                                                  OnSelectSubPaymentMethodEvent(
                                                      subPaymentMethod:
                                                          _subPaymentMethod));
                                        },
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: paymentMethodImageWidget,
                                          ),
                                        ),
                                        Text(paymentSubMethod!.bankName
                                            .toString()),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Divider(thickness: 1),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 80,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // back to checkout
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: AppColors.kLightGreen),
                            child: const Text(
                              'Confirm',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.kLightGreen,
                              ), //border width and color

                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 17, color: AppColors.kLightGreen),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
