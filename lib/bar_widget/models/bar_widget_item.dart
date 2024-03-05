import 'package:neodocs_assignment/bar_widget/enums/severity_level.dart';

// Individual item in Bar Widget
// rangeWidth signifies the range, e.g. 30-60 means a range width of 30
// colorForRange takes the severity level enum and gives a color and a meaning to the particular range.
class BarWidgetItem {
  double rangeWidth;
  SevereityLevel colorForRange;
  BarWidgetItem({
    required this.rangeWidth,
    required this.colorForRange,
  });
}
