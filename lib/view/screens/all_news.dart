import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/constants/colors.dart';
import '../../model/articles_model.dart';
import '../../model/slider_model.dart';
import '../../services/news.dart';
import '../../services/slider_data.dart';
import '../widgets/showing_category.dart';

class AllNews extends StatefulWidget {
  final String news;

  const AllNews({super.key, required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<ArticleModel> articles = [];
  List<SliderModel> sliders = [];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    getSlider();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
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
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Clrs.kWhite,
                size: 30.sp,
              )),
          backgroundColor: Clrs.kPrimaryClr,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 3),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          title: Text(
            widget.news + " News",
            style: TextStyle(color: Clrs.kWhite),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.white, size: 40.sp),
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                  ? Center(child: CircularProgressIndicator(),)
                  : Container(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                  widget.news == "Breaking" ? sliders.length : articles.length,
                  itemBuilder: (context, index) {
                    return ShowingCategory(
                      url: widget.news == "Breaking"
                          ? sliders[index].url!
                          : articles[index].url!,
                      desc: widget.news == "Breaking"
                          ? sliders[index].description!
                          : articles[index].description!,
                      title: widget.news == "Breaking"
                          ? sliders[index].title!
                          : articles[index].title!,
                      image: widget.news == "Breaking"
                          ? sliders[index].urlToImage!
                          : articles[index].urlToImage!,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
