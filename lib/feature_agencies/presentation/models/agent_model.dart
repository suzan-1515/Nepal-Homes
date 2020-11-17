import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class AgentUIModel extends Model {
  AgentEntity _agent;
  AgentUIModel(this._agent);

  set(AgentEntity agent) {
    this._agent = agent;
    notifyListeners();
  }

  AgentEntity get entity => this._agent;
}
