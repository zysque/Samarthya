import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SaamarthFirebaseUser {
  SaamarthFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SaamarthFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SaamarthFirebaseUser> saamarthFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SaamarthFirebaseUser>(
            (user) => currentUser = SaamarthFirebaseUser(user));
