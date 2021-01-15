import 'package:flutter/foundation.dart';

mixin RemoteService {
  Future<dynamic> fetchProfile({@required String token});
}
