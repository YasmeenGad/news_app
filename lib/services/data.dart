import '../model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [
    CategoryModel(
        categoryName: "Business", image: "assets/images/business.jpg"),
    CategoryModel(
        categoryName: "Entertainment",
        image: "assets/images/entertainment.jpg"),
    CategoryModel(categoryName: "General", image: "assets/images/general.jpg"),
    CategoryModel(categoryName: "Health", image: "assets/images/health.jpg"),
    CategoryModel(categoryName: "sports", image: "assets/images/sport.jpg"),
    CategoryModel(
        categoryName: "Science", image: "assets/images/science.jpg"),
  ];
  return categories;
}
