// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddressCheckoutWidget extends StatelessWidget {
  const AddressCheckoutWidget({
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
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 28  ,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          NewAddressCheckoutWidget(),
          ExitingAddressCheckoutWidget()
        ],
      ),
    );
  }
}

class ExitingAddressCheckoutWidget extends StatelessWidget {
  const ExitingAddressCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
                'Kavin Supabchon',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                child: Text(
                  'Edit address',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF73C23A),
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  print('---click edit address---');
                  Navigator.pushNamed(context, 
                  '/listaddress' 
                  // '/orderlist'
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: const [Text('089 111 1111')],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                  child: Text(
                      '777/1 Noble create Village, Noble create A Building Soi Sooksai, Khlong Tan Rd. Khlong Tan Nuea, Wattana, Bangkok 10110'))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD9D9D9)),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Default',
                  style: TextStyle(
                    color: Color(0xFF73C23A),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NewAddressCheckoutWidget extends StatelessWidget {
  const NewAddressCheckoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('----click add new address----');
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
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
                    'Add new address',
                    style: TextStyle(
                      fontSize: 24  ,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.add)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
