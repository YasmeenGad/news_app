import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/constants/colors.dart';

class CustomRawText extends StatelessWidget {
  final String txt1;
  final String txt2;

  const CustomRawText({required this.txt1, required this.txt2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt1,
              style: TextStyle(
                  color: Clrs.kBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
          Text(txt2,
              style: TextStyle(
                color: Clrs.kPrimaryClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,)),
        ],
      ),
    );
  }
}
