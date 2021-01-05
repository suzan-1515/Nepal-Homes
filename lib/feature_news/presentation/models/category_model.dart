import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsCategoryUIModel extends Model {
  CategoryEntity _category;

  NewsCategoryUIModel(this._category);

  set(CategoryEntity category) {
    this._category = category;
    notifyListeners();
  }

  CategoryEntity get entity => this._category;
}
