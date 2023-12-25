import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//extension for sizebox
extension Spacing on num {
  SizedBox get ph => SizedBox(height: toDouble().h);

  SizedBox get pw => SizedBox(width: toDouble().w);
}
