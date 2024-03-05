import 'package:flutter/material.dart';

// Defines color and indication
enum SevereityLevel {
  dangerous({"color": Colors.red, "indication": "Dangerous"}),
  moderate({"color": Colors.orange, "indication": "Moderate"}),
  ideal({"color": Colors.green, "indication": "Ideal"});

  final Map<String, dynamic> levelInfo;
  const SevereityLevel(this.levelInfo);
}
