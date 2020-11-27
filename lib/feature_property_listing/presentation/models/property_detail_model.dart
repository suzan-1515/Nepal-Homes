import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyDetailUIModel extends Model {
  PropertyDetailEntity _propertyDetail;
  PropertyDetailUIModel(this._propertyDetail);

  set(PropertyDetailEntity propertyDetail) {
    this._propertyDetail = propertyDetail;
    notifyListeners();
  }

  PropertyDetailEntity get entity => this._propertyDetail;
}
