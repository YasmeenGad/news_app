import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/constants/colors.dart';
import '../screens/articles_view.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String url;

  const CustomCard({super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ArticlesView(blogUrl: url);
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                        imageUrl: imageUrl,
                        width: 150.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        child: Text(title,
                            maxLines: 2,
                            style: TextStyle(
                              color: Clrs.kBlack,
                              fontSize: 15.sp,
                            )),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2.7,
                        child: Text(desc,
                            maxLines: 3,
                            style: TextStyle(
                              color: Clrs.kBlack26,
                              fontSize: 15.sp,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
