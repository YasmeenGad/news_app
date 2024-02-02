import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/controller/constants/colors.dart';
import '../screens/category_news.dart';

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  const CategoryTile({required this.image, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(
                      name: categoryName,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(right: 8.0.w),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  width: 150.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 150.w,
                height: 80.h,
                decoration: BoxDecoration(
                    color: Clrs.kBlack26,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Clrs.kWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
