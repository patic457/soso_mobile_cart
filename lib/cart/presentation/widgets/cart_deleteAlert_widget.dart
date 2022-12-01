import 'package:flutter/material.dart';
import 'package:marketplace/cart/core/themes/app_fontconfig.dart';
import 'package:ui_style/base_color.dart';


class CartDeleteAlert extends StatefulWidget {
  const CartDeleteAlert({super.key});

  @override
  State<CartDeleteAlert> createState() => _CartDeleteAlertState();
}

class _CartDeleteAlertState extends State<CartDeleteAlert> {
  late int countItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
		borderRadius: BorderRadius.circular(30),
	    ),
      title: Center(
        child: Text(
          'Do you want to delete this product',
          style: TextStyle(fontSize: 20,
          fontWeight: AppFontStyle.fontw700,
          fontStyle: AppFontStyle.normalfontstyle,
          color: BaseColors.darkestGrey),
        ),
      ),
      actions: <Widget>[
        Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(10)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        BaseColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: BaseColors.primaryColor),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 24,
                    fontWeight: AppFontStyle.fontw700),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(10)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'cart');
                  },
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 24,
                    fontWeight: AppFontStyle.fontw700),
                  ),
                ),
              ),
              const SizedBox(height: 16,)
            ],
          ),
        )
      ],
    );
  }
}
