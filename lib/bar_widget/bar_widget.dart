import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:neodocs_assignment/core/globals/my_fonts.dart';
import 'package:neodocs_assignment/bar_widget/models/bar_widget_item.dart';

class BarWidget extends StatelessWidget {
  final double firstVal; // minimum value of a test metadata
  final double lastVal; // maximum value of a test metadata
  final double barWidth; // width of the bar
  final List<BarWidgetItem>
      children; // BarWidgetItems all ranges should add upto lastVal - firstVal

  const BarWidget({
    required this.firstVal,
    required this.lastVal,
    required this.children,
    required this.barWidth,
    super.key,
  });

  BorderRadiusGeometry? getBorderRadius(int index) {
    if (index == 1) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    } else if (index == children.length) {
      return const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final totalRange = lastVal - firstVal;
    double accumulatedWidth = 0;
    int ind = 0;
    return SizedBox(
      width: barWidth,
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${firstVal.toInt()}",
            style: MyFonts.medium.size(14),
          ),
          Row(
            children: [
              ...children.map((barWidgetItem) {
                accumulatedWidth += barWidgetItem.rangeWidth;
                ind += 1;
                return Container(
                  height: 25,
                  width: (barWidgetItem.rangeWidth / totalRange) * (barWidth),
                  decoration: BoxDecoration(
                    color: barWidgetItem.colorForRange.levelInfo['color'],
                    borderRadius: getBorderRadius(ind),
                  ),
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: Offset(8, (ind % 2 != 0) ? -20 : 20),
                    child: Text(
                      "${accumulatedWidth.toInt()}",
                      textAlign: TextAlign.end,
                      style: MyFonts.medium.size(14),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
