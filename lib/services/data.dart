import 'package:taaza_khabar/models/category_model.dart';

List<CategoryModel> getCategory(){
  List<CategoryModel> category =[];

  CategoryModel categoryModel =  CategoryModel();

  categoryModel.categoryName="Business";
  categoryModel.image ="assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName="Entertainment";
  categoryModel.image ="assets/images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName="Science";
  categoryModel.image ="assets/images/science.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName="Sports";
  categoryModel.image ="assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName="Technology";
  categoryModel.image ="assets/images/technology.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  return category;
}