import 'package:flutter/foundation.dart';

mixin Storage {
  Future<dynamic> loadUser();

  Future saveUser({@required String userJson});

  Future deleteUser();
}
