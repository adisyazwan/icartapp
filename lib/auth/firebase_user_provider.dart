import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IcartappFirebaseUser {
  IcartappFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

IcartappFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IcartappFirebaseUser> icartappFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IcartappFirebaseUser>(
            (user) => currentUser = IcartappFirebaseUser(user));
