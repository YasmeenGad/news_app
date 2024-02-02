import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/constants/colors.dart';
import '../../model/slider_model.dart';
import '../../services/slider_data.dart';

class CustomCarouselSlider extends StatefulWidget {
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int activeIndex = 0;
  bool _loading = true;
  List<SliderModel> sliders = [];

  @override
  void initState() {
    getSlider();
    super.initState();
  }

  Future<void> getSlider() async {
    try {
      await Sliders.getSlider();
      setState(() {
        sliders = Sliders.sliders;
        _loading = false;
      });
    } catch (error) {
      print('Error fetching slider data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (context, index, realIndex) {
              if (index >= 0 && index < sliders.length) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                            imageUrl: sliders[index].urlToImage!,
                            fit: BoxFit.cover,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 250.h),
                      ),
                      Container(
                        height: 200.h,
// padding:EdgeInsets.only(left: 10.0.h),
                        margin: EdgeInsets.only(top: 150.h),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          color: Clrs.kBlack26,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, bottom: 8.h),
                          child: Center(
                            child: Text(
                              maxLines: 2,
                              "${sliders[index].title}",
                              style: TextStyle(
                                color: Clrs.kWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Center(child: CircularProgressIndicator(),)
                          )
                        ]
                    )
                );
              }
            },
            options: CarouselOptions(
              height: 200.h,
              enlargeCenterPage: true,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            )),
        SizedBox(
          height: 18.h,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: sliders.length,
          effect: SlideEffect(
            activeDotColor: Clrs.kPrimaryClr,
            dotHeight: 10.h,
            dotColor: Colors.grey,
            dotWidth: 10.w,
          ),
        )
      ],
    );
  }
}
