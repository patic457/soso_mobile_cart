import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/list_payment_method/list_payment_method_bloc.dart';
import 'package:soso_mobile_cart/cart/presentation/widgets/payment_list_item.dart';

class PaymentMethodListPage extends StatelessWidget {
  const PaymentMethodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ListPaymentMethodBloc>().add(GetPaymentMethodEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
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
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.paymentMethods.length,
                      itemBuilder: (context, index) {
                        final paymentMethod = state.paymentMethods[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        debugPrint('Clicked');
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
