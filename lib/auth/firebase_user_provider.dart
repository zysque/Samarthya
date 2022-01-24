import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SamarthyaFirebaseUser {
  SamarthyaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SamarthyaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SamarthyaFirebaseUser> samarthyaFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SamarthyaFirebaseUser>(
        (user) => currentUser = SamarthyaFirebaseUser(user));
