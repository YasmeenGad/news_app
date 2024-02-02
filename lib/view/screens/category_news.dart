import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/widgets/showing_category.dart';

import '../../controller/constants/colors.dart';
import '../../model/showing_category_model.dart';
import '../../services/showing_category.dart';

class CategoryNews extends StatefulWidget {
  final String name;

  const CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  TextEditingController controller = TextEditingController();
  List<ShowingCategoryModel> categories = [];
  bool _loading = true;


  @override
  void initState() {
    getCategories();
    super.initState();
  }

  getCategories() async {
    ShowCategoryNews categoriesNews = ShowCategoryNews();
    await categoriesNews.getCategoriesNews(widget.name);
    categories = categoriesNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(

          backgroundColor: Clrs.kPrimaryClr,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 3),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          title: Text(
            "${widget.name}",
            style: TextStyle(color: Clrs.kWhite),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.search, color: Colors.white, size: 40.sp),
              ),
            )
          ],
        ),
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/pattern.png",
                fit: BoxFit.cover,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
              ),
              _loading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ShowingCategory(
                        url: categories[index].url!,
                        desc: categories[index].description!,
                        title: categories[index].title!,
                        image: categories[index].urlToImage!);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
