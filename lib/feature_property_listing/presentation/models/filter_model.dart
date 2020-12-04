import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterUIModel extends Model {
  PropertyFilter _propertyFilter;
  FilterUIModel(this._propertyFilter);

  set(PropertyFilter propertyFilter) {
    this._propertyFilter = propertyFilter;
    notifyListeners();
  }

  PropertyFilter get entity => this._propertyFilter;
}
