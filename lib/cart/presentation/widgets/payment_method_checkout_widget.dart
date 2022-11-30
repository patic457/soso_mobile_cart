// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PaymentMethodCheckoutWidget extends StatelessWidget {
  const PaymentMethodCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 28  ,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          AddPaymentmethodWidget(),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.083,),
              Expanded(child: Text('Please select a payment method before placing an order.',
              style: TextStyle(
                color: Colors.red
              ),)),
            ],
          ),
          ExitingPaymentmethodWidget(),
        ],
      ),
    );
  }
}

class ExitingPaymentmethodWidget extends StatelessWidget {
  const ExitingPaymentmethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF5F5F5)),
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Pay by credit / debit card',
                style: TextStyle(
                  fontSize: 24  ,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                child: Text('Change',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF73C23A),
                    decoration: TextDecoration.underline
                ),),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: const [Text('Siam Commercial Bank')],
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
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF5F5F5)),
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Select payment method',
                    style: TextStyle(
                      fontSize: 24  ,
                      fontWeight: FontWeight.w700,
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
