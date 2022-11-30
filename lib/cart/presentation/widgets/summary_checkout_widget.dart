// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class SummaryCheckoutWidget extends StatefulWidget {
  @override
  State<SummaryCheckoutWidget> createState() => _SummaryCheckoutWidgetState();
}

class _SummaryCheckoutWidgetState extends State<SummaryCheckoutWidget> {
  // const SummaryCheckoutWidget({
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Container(
          // margin:
          //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0001),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFF5F5F5)),
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Today's changes",
                    style: TextStyle(
                      fontSize: 20  ,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('iphone 12 Pro Max'),
                  Text(
                    '฿ 36,000',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '1 x @36,000',
                    style: TextStyle(color: Color.fromARGB(255, 197, 197, 197)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Standard shipping'),
                  Text(
                    'Free',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18  ,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Divider(
                      height: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '฿ 36,000',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18  ,
                      color: Color(0xFF73C23A),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Color(0xFF73C23A),
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    'By checking out I agree to the ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24  ,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  TextButton(
                    child: Text(
                      'Terms and conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24  ,
                          color: Color(0xFF73C23A),
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      print('--click link page term and condition');
                      // Navigator.pushNamed(context, '/termcondition');
                      Navigator.pushNamed(context, '/termcondition');
                    },
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Place order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24  ,
                            fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                            bottom: MediaQuery.of(context).size.height * 0.03,
                          ),
                          backgroundColor: Color(0xFF73C23A),
                          shape: StadiumBorder()),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );

    // Text('Summary cart');
  }
}
