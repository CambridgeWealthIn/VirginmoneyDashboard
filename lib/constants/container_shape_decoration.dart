import 'package:flutter/material.dart';

import 'colors.dart';

ShapeDecoration containerShapeDecoration() {
    return ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }