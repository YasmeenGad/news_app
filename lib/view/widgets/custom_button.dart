import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50.h,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textColor: Clrs.kWhite,
        color: Clrs.kPrimaryClr,
        onPressed: onPressed,
        child: Text(
          txt,
        ),
      ),
    );
  }
}
