import 'package:bbmobile/utils/fonts.gen.dart';
import 'package:flutter/material.dart';

class SnackbarCustom extends SnackBar {
  SnackbarCustom({
    super.key,
    required String message,
    super.duration = const Duration(seconds: 3),
  }) : super(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
        );
}
