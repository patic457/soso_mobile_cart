import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_style/base_color.dart';

import '../../core/themes/app_fontconfig.dart';

class DeleteProductDialog extends StatefulWidget {
  const DeleteProductDialog({super.key});

  @override
  State<DeleteProductDialog> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DeleteProductDialog> {
  @override
  Widget build(BuildContext context) {
    // deleteProductShowDialog(context) {
    //   showDialog<String>(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       title: Center(
    //         child: Text(
    //           'Do you want to delete this product',
    //           style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: AppFontStyle.fontw700,
    //               fontStyle: AppFontStyle.normalfontstyle,
    //               color: BaseColors.darkestGrey),
    //         ),
    //       ),
    //       actions: <Widget>[
    //         Center(
    //           child: Column(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.35,
    //                 child: TextButton(
    //                   style: ButtonStyle(
    //                     padding: MaterialStateProperty.all<EdgeInsets>(
    //                         const EdgeInsets.all(10)),
    //                     foregroundColor: MaterialStateProperty.all<Color>(
    //                       BaseColors.primaryColor,
    //                     ),
    //                     shape:
    //                         MaterialStateProperty.all<RoundedRectangleBorder>(
    //                       RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30.0),
    //                         side: const BorderSide(
    //                           color: BaseColors.primaryColor,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                     //REMOVE
    //                   },
    //                   child: Text(
    //                     "Yes",
    //                     style: TextStyle(
    //                         fontSize: 24, fontWeight: AppFontStyle.fontw700),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 16),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.35,
    //                 child: TextButton(
    //                   style: ButtonStyle(
    //                     padding: MaterialStateProperty.all<EdgeInsets>(
    //                         const EdgeInsets.all(10)),
    //                     foregroundColor:
    //                         MaterialStateProperty.all<Color>(Colors.grey),
    //                     shape:
    //                         MaterialStateProperty.all<RoundedRectangleBorder>(
    //                       RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30.0),
    //                         side: const BorderSide(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   onPressed: () {
    //                     setState(() {
    //                       // increaseAction;
    //                     });
    //                     Navigator.pop(context);
    //                   },
    //                   child: Text(
    //                     "No",
    //                     style: TextStyle(
    //                       fontSize: 24,
    //                       fontWeight: AppFontStyle.fontw700,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 16)
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    // return deleteProductShowDialog(context);
    return Container();
  }
}
