import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyUIModel extends Model {
  PropertyEntity _paginatedProperty;

  PropertyUIModel(this._paginatedProperty);

  set(PropertyEntity paginatedProperty) {
    this._paginatedProperty = paginatedProperty;
    notifyListeners();
  }

  PropertyEntity get entity => this._paginatedProperty;
}
