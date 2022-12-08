import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/data/models/payment_method_model.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/select_payment_method/select_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/pages/payment_method_sub_page.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/payment_list_item.dart';
import 'package:ui_style/ui_style.dart';

class PaymentMethodListPage extends StatelessWidget {
  const PaymentMethodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ListPaymentMethodBloc>().add(GetPaymentMethodEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors.secondaryColor,
        title: const Text(
          'Payment',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<ListPaymentMethodBloc, ListPaymentMethodState>(
        builder: (context, state) {
          if (state is ListPaymentMethodError) {
            return Text(state.message);
          } else if (state is MainListPaymentMethod) {
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
                        children: const [
                          Text(
                            "Payment Method",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.paymentMethods.length,
                      itemBuilder: (BuildContext context, int index) {
                        final paymentMethod = state.paymentMethods[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        log(paymentMethod.toString());
                                        context
                                            .read<SelectPaymentMethodBloc>()
                                            .add(OnSelectPaymentMethodEvent(
                                                paymentMethodEntity:
                                                    paymentMethod));
                                        if (paymentMethod.paymentMethodName!
                                            .toLowerCase()
                                            .contains('banking')) {
                                          Navigator.of(context)
                                              .pushNamed('sub-payment-method');
                                        } else {
                                          context
                                              .read<SelectPaymentMethodBloc>()
                                              .add(
                                                  OnSelectSubPaymentMethodEvent(
                                                      subPaymentMethod:
                                                          BankOption(
                                                              bankCode: '',
                                                              bankImage: '',
                                                              bankName: '')));
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: PaymentMethodListItem(
                                          paymentMethod: paymentMethod),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Divider(thickness: 1),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
