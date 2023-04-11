import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    String? email,
  }) = _AppUser;
}

extension FirebaseUserX on User {
  AppUser toAppUser() => AppUser(uid: uid, email: email);
}
