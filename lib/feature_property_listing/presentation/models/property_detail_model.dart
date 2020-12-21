import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyDetailUIModel extends Model {
  PropertyDetailWrapperEntity _propertyDetail;
  PropertyDetailUIModel(this._propertyDetail);

  set(PropertyDetailEntity propertyDetail) {
    this._propertyDetail = this._propertyDetail.copyWith(data: propertyDetail);
    notifyListeners();
  }

  PropertyDetailEntity get entity => this._propertyDetail.property;
  List<PropertyDetailEntity> get relatedProperties =>
      this._propertyDetail.relatedProperties;
}
