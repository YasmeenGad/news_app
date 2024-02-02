import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/view/screens/all_news.dart';

import 'package:news_app/view/widgets/card.dart';
import 'package:news_app/view/widgets/carousel_slider.dart';
import 'package:news_app/view/widgets/catergory_tile.dart';
import 'package:news_app/view/widgets/raw_text.dart';
import '../../controller/constants/colors.dart';
import '../../model/articles_model.dart';
import '../../model/slider_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  List<SliderModel> sliders = [];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    categories = getCategories();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Clrs.kPrimaryClr,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 3),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          title: Text(
            "News",
            style: TextStyle(color: Clrs.kWhite),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/pattern.png",
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            _loading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.0.w),
                      child: SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 7,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                image: categories[index].image,
                                categoryName:
                                categories[index].categoryName);
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AllNews(news: "Breaking"),
                            ));
                      },
                      child: const CustomRawText(
                          txt1: "Breaking News", txt2: "View All"),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomCarouselSlider(),
                    SizedBox(
                      height: 12.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AllNews(news: "Trending"),
                            ));
                      },
                      child: const CustomRawText(
                          txt1: "Trending News", txt2: "View All"),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            imageUrl: articles[index].urlToImage!,
                            title: articles[index].title!,
                            desc: articles[index].description!,
                            url: articles[index].url!,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
