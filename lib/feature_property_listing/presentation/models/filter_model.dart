import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterUIModel extends Model {
  PropertyFilterEntity _propertyFilter;
  FilterUIModel(this._propertyFilter);

  set entity(PropertyFilterEntity propertyFilter) {
    this._propertyFilter = propertyFilter;
    notifyListeners();
  }

  PropertyFilterEntity get entity => this._propertyFilter;

  PropertyFilterEntity get reset =>
      PropertyFilterEntity(propertyMeta: this._propertyFilter.propertyMeta);
}
