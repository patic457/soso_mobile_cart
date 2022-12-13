// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ui_style/ui_style.dart';

import '../../data/models/delivery_address_model.dart';
import '../../domain/entities/cart_checkout_entity.dart';
import '../../domain/entities/delivery_address_entity.dart';
import '../bloc/delivery_address/delivery_address_bloc.dart';

class ShippingAddresstWidgetv2 extends StatefulWidget {
  final CartCheckoutEntity cartData;
  ShippingAddresstWidgetv2({super.key, required this.cartData, addressId});

  @override
  State<ShippingAddresstWidgetv2> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddresstWidgetv2> {
  @override
  Widget build(BuildContext context) {
    final String? memberId = this.widget.cartData.member?.memberId;

    print('MemberId: ' + memberId.toString());

    const String sDefault = 'true';
    // print('sDefault: ' + addressId.toString());

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    var addressId = arguments['addressId'].toString();
    print('AddressId: ' + addressId.toString());

    return Container();
  }
}

class ShippingAddresstWidget extends StatelessWidget {
  final CartCheckoutEntity cartData;

  const ShippingAddresstWidget(
      {super.key, required this.cartData, selectedAddress});

  @override
  Widget build(BuildContext context) {
    final String? memberId = cartData.member?.memberId;

    print('MemberId: ' + memberId.toString());

    const String sDefault = 'true';

    var blocBuilder = BlocBuilder<DeliveryAddressBloc, DeliveryAddressState>(
        builder: (context, state) {
      if (state is DeliveryAddressInitial) {
        context
            .read<DeliveryAddressBloc>()
            .add(OnGetDeliveryAddress(memberId!, sDefault));
        return SizedBox();
      } else if (state is GetDeliveryAddressLoading ||
          state is GetDeliveryAddressEmpty) {
        return SizedBox();
      } else if (state is MainGetDeliveryAddress) {
        final deliveryAddressDatas = state.deliveryAddressResult;
        return Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              // Row(
              // ignore: prefer_const_literals_to_create_immutables
              // children: [
              // Expanded(
              //   child: Text(
              //     'Shipping Address',
              //     style: TextStyle(
              //       fontSize: 28,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ],
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              if (deliveryAddressDatas.isNotEmpty)
                ExitingAddressCheckoutWidget(
                    addressData: deliveryAddressDatas[0]),
              if (deliveryAddressDatas.isEmpty) NewAddressCheckoutWidget()
            ],
          ),
        );
      } else {
        return NewAddressCheckoutWidget();
      }
    });

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
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.02,
          // ),
          blocBuilder,
        ],
      ),
    );

    // Padding(
    //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
    //   child: Column(
    //     children: [
    //       Row(
    //         // ignore: prefer_const_literals_to_create_immutables
    //         children: [
    //           Expanded(
    //             child: Text(
    //               'Shipping Address',
    //               style: TextStyle(
    //                 fontSize: 28,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.02,
    //       ),
    //       // if (deliveryAddressDatas != null)
    //       //   ExitingAddressCheckoutWidget(
    //       //       addressData: deliveryAddressDatas[0]),
    //       // if (deliveryAddressDatas == null) NewAddressCheckoutWidget()
    //     ],
    //   ),
    // );
  }
}

class ExitingAddressCheckoutWidget extends StatelessWidget {
  const ExitingAddressCheckoutWidget({Key? key, this.addressData})
      : super(key: key);
  final DeliveryAddressEntity? addressData;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    var selectedAddress = arguments['selectedAddress'];

    print('--exiting----${addressData} selectedAddress : ' +
        selectedAddress.toString());

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
                '${addressData?.firstname} ${addressData?.lastname}',
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
                  // Navigator.pushNamed(context, '/listaddress');
                  //change pushNAme /marketplace_member/addresslist
                  //
                  Navigator.pushNamed(
                      context, '/marketplace_member/addresslist');
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
                '${addressData?.mobileNo}',
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
                  checkPrefixAddress(addressData),
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
          if (addressData?.sDefault == true)
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

checkPrefixAddress(addressData) {
  final address = DeliveryAddressResult(
    addressNo:
        addressData.addressNo == null ? '' : 'เลขที่ ${addressData.addressNo} ',
    mooban:
        addressData.mooban == null ? '' : 'หมู่บ้าน ${addressData.mooban}, ',
    building:
        addressData.building == null ? '' : 'อาคาร ${addressData.building} ',
    soi: addressData.soi == null ? '' : 'ซอย ${addressData.soi}, ',
    street: addressData.street == null ? '' : 'ถนน ${addressData.street} ',
    subDistrictName: addressData.subDistrictName == null
        ? ''
        : '${addressData.subDistrictName} ',
    districtName:
        addressData.districtName == null ? '' : '${addressData.districtName} ',
    provinceName:
        addressData.provinceName == null ? '' : '${addressData.provinceName} ',
    postalCode:
        addressData.postalCode == null ? '' : '${addressData.postalCode}',
  );
  return '${address.addressNo}${address.mooban}${address.building}${address.soi}${address.street}${address.districtName}${address.provinceName}${address.postalCode}';
}
