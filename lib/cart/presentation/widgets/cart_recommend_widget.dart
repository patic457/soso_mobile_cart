// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:marketplace/cart/core/themes/app_colors.dart';
import 'package:marketplace/cart/core/themes/app_fontconfig.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_style/base_color.dart';

final List _order = ['order1'];

final List _Card = [
  'card1',
  'card2',
];

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({super.key});

  @override
  State<RecommendedProductWidget> createState() => _RecommendedProductWidget();
}

class _RecommendedProductWidget extends State<RecommendedProductWidget> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              SizedBox(
                width: 2,
              ),
              Text(
                'Recommended Product',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: AppFontStyle.fontw700,
                    fontStyle: AppFontStyle.normalfontstyle),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/2/0/20w_usb-c_power_adapter_3.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        '20 USB-C Power Adapter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 790',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/m/a/magicable_lightning_3_m.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        'สายชาร์จ Apple Lightning 3 เมตร',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 790',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/a/i/airtag_1pack_850x850.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        'AirTag(1 Pack)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 990',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/w/i/wia005dqbk-01.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        'Belkin BOOST CHARGE Magnetic Portable ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 990',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/w/i/wic004-03.jpg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        'Belkin BOOST CHARGE Magnetic Wireless',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 990',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BaseColors.lightestGrey,
                        ),
                        child: Image.network(
                          'https://store.ais.co.th/media/catalog/product/cache/2/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/c/a/caa011bt1mbk-06_1.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(
                        'Belkin BOOST CHARGE PRO Flex USB-C',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontStyle.fontw400,
                          fontStyle: AppFontStyle.normalfontstyle,
                          color: BaseColors.primaryColor,
                          decoration: TextDecoration.underline,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Text(
                        'ราคา ฿ 990',
                        style: TextStyle(
                            color: AppColors.neutraldarkGrey,
                            fontSize: 16,
                            fontWeight: AppFontStyle.fontw400,
                            fontStyle: AppFontStyle.normalfontstyle),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: _Card.length,
              effect: SlideEffect(
                  dotWidth:
                      MediaQuery.of(context).size.width * 0.9 / _Card.length,
                  dotHeight: 4,
                  spacing: 0,
                  radius: 0,
                  activeDotColor: BaseColors.primaryColor,
                  dotColor: AppColors.neutrallightGrey),
            ),
          ],
        ),
        SizedBox(height: 16,)
      ],
    );
  }
}

