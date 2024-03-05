import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neodocs_assignment/bar_widget/bar_widget.dart';
import 'package:neodocs_assignment/bar_widget/enums/severity_level.dart';
import 'package:neodocs_assignment/bar_widget/models/bar_widget_item.dart';
import 'package:neodocs_assignment/core/globals/my_fonts.dart';
import 'package:neodocs_assignment/core/globals/my_spaces.dart';

import 'package:neodocs_assignment/core/globals/size_config.dart';
import 'package:neodocs_assignment/core/utils.dart';
import 'package:neodocs_assignment/home/controller/slider_controller.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  // describing lower limit and upper limit range for the bar.
  final double lowerLimit = 0;
  final double upperLimit = 120;

  final TextEditingController valController =
      TextEditingController(); // To take input from the user

  // Icon button or textField callback to update slider position
  void updateSliderState(WidgetRef ref, BuildContext context) {
    // read value from TextField and convert it to double
    double? inputVal = double.tryParse(valController.text);

    // Check for possible errors
    if (inputVal == null) {
      showSnackbar("Please enter a valid value", context);
      return;
    }

    if (inputVal > upperLimit || inputVal < lowerLimit) {
      showSnackbar(
          "Please enter a value between $lowerLimit to $upperLimit", context);
      return;
    }

    // Update the state
    ref.read(sliderStateProvider.notifier).state = inputVal;
  }

  final List<BarWidgetItem> barWidgetItems = [
    BarWidgetItem(
      rangeWidth: 30,
      colorForRange: SevereityLevel.dangerous,
    ),
    BarWidgetItem(
      rangeWidth: 10,
      colorForRange: SevereityLevel.moderate,
    ),
    BarWidgetItem(
      rangeWidth: 20,
      colorForRange: SevereityLevel.ideal,
    ),
    BarWidgetItem(
      rangeWidth: 10,
      colorForRange: SevereityLevel.moderate,
    ),
    BarWidgetItem(
      rangeWidth: 50,
      colorForRange: SevereityLevel.dangerous,
    ),
  ];

  String getSeverityLevel(double sliderVal) {
    double accumulatedValue = lowerLimit;

    for (BarWidgetItem item in barWidgetItems) {
      if (sliderVal < item.rangeWidth + accumulatedValue) {
        return item.colorForRange.levelInfo["indication"];
      }
      accumulatedValue += item.rangeWidth;
    }
    return "";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neodocs Flutter Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double width = constraints.maxWidth;
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    BarWidget(
                      firstVal: lowerLimit,
                      lastVal: upperLimit,
                      barWidth: width,
                      children: barWidgetItems,
                    ),
                    Consumer(
                      builder: (_, WidgetRef ref, __) {
                        final sliderState = ref.watch(sliderStateProvider);
                        return sliderState != -1
                            ? Positioned(
                                bottom: 0,
                                left:
                                    ((sliderState / (upperLimit - lowerLimit)) *
                                        (width)),
                                child: Transform.translate(
                                  // X offset is dependent on icon size (icon size /2 ) and Y offset based on height of bar
                                  offset: const Offset(-18, 35),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.upload,
                                        size: 36,
                                      ),
                                      Text(
                                        "$sliderState",
                                        style: MyFonts.semiBold,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container();
                      },
                    ),
                  ],
                );
              },
            ),
            MySpaces.vLargestGapInBetween,
            // Optional show severity level
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final sliderState = ref.watch(sliderStateProvider);
                return sliderState != -1
                    ? Text(
                        "Severity Level: ${getSeverityLevel(sliderState)}",
                        style: MyFonts.medium.size(18),
                      )
                    : Container();
              },
            ),
            MySpaces.vSmallGapInBetween,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.horizontalBlockSize * 75,
                  child: TextField(
                    style: MyFonts.bold.size(22),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: valController,
                    decoration: textboxDecoration('Enter value'),
                    onSubmitted: (val) => updateSliderState(ref, context),
                    enabled: true,
                  ),
                ),
                IconButton(
                  onPressed: () => updateSliderState(ref, context),
                  iconSize: 48,
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
