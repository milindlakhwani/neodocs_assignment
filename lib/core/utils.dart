import 'package:flutter/material.dart';

import 'package:neodocs_assignment/core/globals/my_colors.dart';
import 'package:neodocs_assignment/core/globals/my_fonts.dart';

// Function to show a Snackbar whereever needed
void showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

// TextFormField decoration
InputDecoration textboxDecoration(String text) {
  return InputDecoration(
    filled: true,
    hintText: text,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    hintStyle: MyFonts.medium.setColor(kBlack.withOpacity(0.8)).size(18),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
  );
}
