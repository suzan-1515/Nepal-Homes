import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyDetailUIModel extends Model {
  AgencyDetailEntity _agencyDetail;
  AgencyDetailUIModel(this._agencyDetail);

  set(AgencyDetailEntity agencyDetail) {
    this._agencyDetail = agencyDetail;
    notifyListeners();
  }

  AgencyDetailEntity get entity => this._agencyDetail;
}
