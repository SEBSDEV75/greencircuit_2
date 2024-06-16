// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:greencircuit/data/firebase_service/firestor.dart';
import 'package:greencircuit/data/firebase_service/storage.dart';
import 'package:greencircuit/util/exeption.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;
  Stream<User?> get userStream => _auth.userChanges();
  bool get isEmailVerified => user?.emailVerified ?? false;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }

  Future<void> signup({
    required String username,
    required String email,
    required String password,
    File? profile,
    File? image,
  }) async {
    String URL = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        await _auth
            .createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        )
            .then((credential) {
          credential.user?.sendEmailVerification();
          credential.user?.updateDisplayName(username);
        });

        if (profile != null && profile.path.isNotEmpty) {
          URL = await StorageMethod().uploadImageToStorage('Profile', profile);
        }

        await Firebase_Firestor().CreateUser(
          email: email,
          username: username,
          profile: URL.isNotEmpty
              ? URL
              : 'https://firebasestorage.googleapis.com/v0/b/instagram-8a227.appspot.com/o/person.png?alt=media&token=c6fcbe9d-f502-4aa1-8b4b-ec37339e78ab',
        );
      } else {
        throw Exception('Por favor, llena todos los campos.');
      }
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    } catch (e) {
      if (kDebugMode) {
        print('Error durante el registro: $e');
      }
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) =>
      _auth.sendPasswordResetEmail(email: email);

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> reloadUser() async {
    await user?.reload();
  }
}
