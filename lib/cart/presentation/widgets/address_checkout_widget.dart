// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soso_mobile_cart/cart/data/models/delivery_address_model.dart';
import 'package:soso_mobile_cart/cart/domain/entities/cart_checkout_entity.dart';
import 'package:soso_mobile_cart/cart/domain/entities/delivery_address_entity.dart';
import 'package:soso_mobile_cart/cart/presentation/bloc/delivery_address/delivery_address_bloc.dart';
import 'package:ui_style/ui_style.dart';

class AddressCheckoutWidget extends StatelessWidget {
  AddressCheckoutWidget({Key? key, required this.cartData}) : super(key: key);

  final CartCheckoutEntity cartData;

  @override
  Widget build(BuildContext context) {
    final String? memberId = cartData.member?.memberId;
    const String sDefault = 'true';

    return BlocBuilder<DeliveryAddressBloc, DeliveryAddressState>(
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
                    addressData: deliveryAddressDatas[0]),
              if (deliveryAddressDatas.isEmpty) NewAddressCheckoutWidget()
            ],
          ),
        );
      } else {
        return NewAddressCheckoutWidget();
      }
    });

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
    print('--exiting----${addressData}');
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
                  Navigator.pushNamed(context, '/listaddress');
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
        addressData.addressNo == null ? '' : '?????????????????? ${addressData.addressNo} ',
    mooban:
        addressData.mooban == null ? '' : '???????????????????????? ${addressData.mooban}, ',
    building:
        addressData.building == null ? '' : '??????????????? ${addressData.building} ',
    soi: addressData.soi == null ? '' : '????????? ${addressData.soi}, ',
    street: addressData.street == null ? '' : '????????? ${addressData.street} ',
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
