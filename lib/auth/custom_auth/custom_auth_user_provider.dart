import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class LandAndHouseWebAuthUser {
  LandAndHouseWebAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LandAndHouseWebAuthUser> landAndHouseWebAuthUserSubject =
    BehaviorSubject.seeded(LandAndHouseWebAuthUser(loggedIn: false));
Stream<LandAndHouseWebAuthUser> landAndHouseWebAuthUserStream() =>
    landAndHouseWebAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
