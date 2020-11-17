import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyUIModel extends Model {
  AgencyEntity _paginatedAgency;

  AgencyUIModel(this._paginatedAgency);

  set(AgencyEntity paginatedAgency) {
    this._paginatedAgency = paginatedAgency;
    notifyListeners();
  }

  AgencyEntity get entity => this._paginatedAgency;
}
