import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GlassesIn2hFirebaseUser {
  GlassesIn2hFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

GlassesIn2hFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GlassesIn2hFirebaseUser> glassesIn2hFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GlassesIn2hFirebaseUser>(
        (user) => currentUser = GlassesIn2hFirebaseUser(user));
