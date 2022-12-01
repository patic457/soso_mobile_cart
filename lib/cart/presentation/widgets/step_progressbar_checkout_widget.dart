// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:ui_style/ui_style.dart';

class StepProgressbarCheckoutWidget extends StatelessWidget {
  final _processes = [
    'Checkout',
    'Confirmation',
  ];

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      // padding: EdgeInsets.only(right: 100),
      // physics: ClampingScrollPhysics(),
      theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(space: 3.0, thickness: 20.0),
          indicatorTheme: IndicatorThemeData(size: 40.0, position: 0.85),
          nodePosition: 0.3,
          indicatorPosition: MediaQuery.of(context).size.width * 0.013),
      builder: TimelineTileBuilder(
          itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / 2.85,
          // MediaQuery.of(context).size.width /
          // (_processes.length > 2 ? 3 : _processes.length),
          contentsBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 0, right: 0),
                  child: Container(
                    padding: EdgeInsets.only(left:10),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: index <= 1
                              ? BaseColors.primaryColor
                              : BaseColors.greyColor),
                    ),
                  ),
                ),
              ],
            );
          },
          indicatorBuilder: (context, index) => OutlinedDotIndicator(
                position: 0.93,
                borderWidth: 3,
                color: index <= 1 ? BaseColors.primaryColor : BaseColors.greyColor,
                child: GestureDetector(
                  onTap: () {
                    print('--click progress bar tab: ${index}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    width: 36,
                    height: 36,
                    child: Text(
                      (index + 1).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: index <= 1
                              ? BaseColors.primaryColor
                              : BaseColors.greyColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          startConnectorBuilder: (context, index) {
            if (index == 0) {
              return Container();
            } else if (index == 1) {
              return DecoratedLineConnector(
                endIndent: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(64),
                    ),
                    color: index <= 1 ? BaseColors.primaryColor : BaseColors.greyColor),
              );
            } else {
              return DecoratedLineConnector(
                endIndent: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(64),
                    ),
                    color: index <= 1 ? BaseColors.primaryColor : BaseColors.greyColor),
              );
            }
          },
          endConnectorBuilder: (context, index) {
            if (index == 0) {
              return DecoratedLineConnector(
                indent: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(64),
                    ),
                    color: index < 1 ? BaseColors.primaryColor : BaseColors.greyColor),
              );
            } else if (index == _processes.length - 1) {
              return Container();
            } else {
              return DecoratedLineConnector(
                indent: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(64),
                    ),
                    color: index < 1 ? BaseColors.primaryColor : BaseColors.greyColor),
              );
            }
          },
          itemCount: _processes.length),
    );
  }
}
