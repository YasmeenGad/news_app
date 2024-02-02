import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/controller/constants/colors.dart';
import 'package:news_app/view/screens/home.dart';
import 'package:news_app/view/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/building.jpg",
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "News from around the \n         world for you",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Clrs.kBlack,
                fontSize: 25.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "Best time to read, take your time \n            to read a little more\n                    of this world",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
                color: Clrs.kBlack26,
                fontSize: 18.sp),
          ),
          const Spacer(),
          CustomButton(
            txt: "Get Started",
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ));
            },
          )
        ]),
      ),
    );
  }
}
