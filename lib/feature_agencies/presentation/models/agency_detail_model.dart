import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyDetailUIModel extends Model {
  AgencyDetailWrapperEntity _agencyDetailWrapper;
  AgencyDetailUIModel(this._agencyDetailWrapper);

  set(AgencyDetailWrapperEntity paginatedAgencyDetail) {
    this._agencyDetailWrapper = paginatedAgencyDetail;
    notifyListeners();
  }

  AgencyDetailWrapperEntity get entity => this._agencyDetailWrapper;
}
