// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:ui_style/ui_style.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.secondaryColor,
          title: const Text(
            'Terms and conditions',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                FixedTimeline.tileBuilder(
                  theme: TimelineTheme.of(context).copyWith(
                      nodePosition: 0,
                      indicatorPosition: 0,
                      connectorTheme: ConnectorThemeData(
                        space: 80,
                        indent: 0,
                      ),
                      indicatorTheme: IndicatorThemeData(
                          // size: 10.0,
                          // position: 0.6,
                          )),
                  builder: TimelineTileBuilder(
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Contract 1: Read the term and condition, then tap agree',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: index == 0
                                  ? BaseColors.primaryColor
                                  : Colors.grey,
                            )),
                        Text(
                            '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: index == 0 ? Colors.black : Colors.grey,
                            )),
                      ],
                    ),
                    endConnectorBuilder: (context, index) {
                      if (index == 0) {
                        return const SolidLineConnector(
                          thickness: 4,
                          color: BaseColors.primaryColor,
                        );
                      } else if (index == 4) {
                        return Container(
                          padding: EdgeInsets.all(40),
                        );
                      } else {
                        return const SolidLineConnector(
                          thickness: 4,
                          color: BaseColors.greyColor,
                        );
                      }
                    },
                    indicatorBuilder: (context, index) {
                      if (index == 0) {
                        return DotIndicator(
                          color: Colors.green,
                          child: Container(
                            width: 18,
                            height: 18,
                          ),
                        );
                      } else {
                        return DotIndicator(
                          color: BaseColors.greyColor,
                          child: Container(
                            width: 18,
                            height: 18,
                          ),
                        );
                      }
                    },
                    itemCount: 5,
                    itemExtentBuilder: (context, index) {
                      if (index == 0) {
                        return MediaQuery.of(context).size.width * 0.95;
                      } else {
                        return MediaQuery.of(context).size.width * 0.95;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
