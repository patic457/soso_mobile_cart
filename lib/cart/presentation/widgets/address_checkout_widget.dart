// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:marketplace/cart/domain/entities/cart_checkout_entity.dart';
import 'package:marketplace/cart/domain/entities/delivery_address_entity.dart';
import 'package:ui_style/ui_style.dart';

class AddressCheckoutWidget extends StatelessWidget {
  AddressCheckoutWidget(
      {Key? key, required this.cartData, required this.deliveryAddressDatas})
      : super(key: key);

  final CartCheckoutEntity cartData;
  final List<DeliveryAddressEntity> deliveryAddressDatas;

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
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          if (deliveryAddressDatas.isNotEmpty)
            ExitingAddressCheckoutWidget(
                deliveryAddressDatas: deliveryAddressDatas),
          if (deliveryAddressDatas.isEmpty) NewAddressCheckoutWidget()
        ],
      ),
    );
    //     },
    //   );
  }
}

class ExitingAddressCheckoutWidget extends StatelessWidget {
  const ExitingAddressCheckoutWidget(
      {Key? key, required this.deliveryAddressDatas})
      : super(key: key);

  final List<DeliveryAddressEntity> deliveryAddressDatas;

  @override
  Widget build(BuildContext context) {
    final addressData = deliveryAddressDatas[0];
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${addressData.firstname} ${addressData.lastname}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: Text(
                  'Edit address',
                  style: TextStyle(
                      fontSize: 20,
                      color: BaseColors.primaryColor,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  print('---click edit address---');
                  Navigator.pushNamed(context, '/listaddress'
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
            children: [
              Text(
                '${addressData.mobileNo}',
                style: TextStyle(
                  fontSize: 20,
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
                child: Text(
                  // _checkPrefixAddress(addressData),
                  "เลขที่ ${addressData.addressNo} หมู่บ้าน ${addressData.mooban}, อาคาร ${addressData.building} ซอย ${addressData.soi}, ถนน ${addressData.street} ${addressData.subDistrictName}, ${addressData.districtName}, ${addressData.provinceName}, ${addressData.postalCode}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.greyColor),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Default',
                    style: TextStyle(
                      fontSize: 18,
                      color: BaseColors.primaryColor,
                    ),
                    textAlign: TextAlign.center),
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
                border: Border.all(color: BaseColors.lightestGrey),
                color: BaseColors.lightestGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Add new address',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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

// _checkPrefixAddress(addressData) {
//   var addressNo;
//   Object address = {
//     addressNo: addressData.addressNo,
//     // moo,
//     // mooban,
//     // soi,
//     // building,
//     // room,
//     // floor,
//     // street,
//     // provinceCode,
//     // provinceName,
//     // districtCode,
//     // districtName,
//     // subDistrictCode,
//     // subDistrictName,
//     // mobileNo
//   };
//   // DeliveryAddressEntity addressData;
//   // Set<String> address = <String>{addressData};
//   print('---function ----->${addressData}');
//   // var result = addressData.map((value) =>
//   // value != null ? 'prefix_$value'.toSet() : ''
// //   if(value != null){
// // 'prefix_$value'.toSet();
// //   }
//   // );
//   // print('---result---->${result}');
//   // return address.addressNo;
  
// }
