// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_import

//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:greencircuit/data/model/usermodel.dart';
import 'package:greencircuit/util/exeption.dart';
import 'package:uuid/uuid.dart';

class Firebase_Firestor {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUser({
    required String email,
    required String username,
    required String profile,
  }) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set({
      'email': email,
      'username': username,
      'profile': profile,
      'followers': [],
      'following': [],
    });
    return true;
  }

  Future<Usermodel> getUser({String? UID}) async {
    try {
      final user = await _firebaseFirestore
          .collection('users')
          .doc(UID ?? _auth.currentUser!.uid)
          .get();
      final snapuser = user.data()!;
      return Usermodel(snapuser['email'], snapuser['followers'],
          snapuser['following'], snapuser['profile'], snapuser['username']);
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }

  Future<bool> CreatePost({
    required String postImage,
    required String caption,
    required String location,
  }) async {
    var uid = const Uuid().v4();
    DateTime data = DateTime.now();
    Usermodel user = await getUser();
    await _firebaseFirestore.collection('posts').doc(uid).set({
      'postImage': postImage,
      'username': user.username,
      'profileImage': user.profile,
      'caption': caption,
      'location': location,
      'uid': _auth.currentUser!.uid,
      'postId': uid,
      'like': [],
      'time': data
    });
    return true;
  }

  Future<bool> CreatReels({
    required String video,
    required String caption,
  }) async {
    var uid = const Uuid().v4();
    DateTime data = DateTime.now();
    Usermodel user = await getUser();
    await _firebaseFirestore.collection('reels').doc(uid).set({
      'reelsvideo': video,
      'username': user.username,
      'profileImage': user.profile,
      'caption': caption,
      'uid': _auth.currentUser!.uid,
      'postId': uid,
      'like': [],
      'time': data
    });
    return true;
  }

  Future<bool> Comments({
    required String comment,
    required String type,
    required String uidd,
  }) async {
    var uid = const Uuid().v4();
    Usermodel user = await getUser();
    await _firebaseFirestore
        .collection(type)
        .doc(uidd)
        .collection('comments')
        .doc(uid)
        .set({
      'comment': comment,
      'username': user.username,
      'profileImage': user.profile,
      'CommentUid': uid,
    });
    return true;
  }

  Future<String> like({
    required List like,
    required String type,
    required String uid,
    required String postId,
  }) async {
    String res = 'Ocurrio un error';
    try {
      if (like.contains(uid)) {
        _firebaseFirestore.collection(type).doc(postId).update({
          'like': FieldValue.arrayRemove([uid])
        });
      } else {
        _firebaseFirestore.collection(type).doc(postId).update({
          'like': FieldValue.arrayUnion([uid])
        });
      }
      res = 'seccess';
    } on Exception catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> flollow({
    required String uid,
  }) async {
    DocumentSnapshot snap = await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    List following = (snap.data()! as dynamic)['following'];
    try {
      if (following.contains(uid)) {
        _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          'following': FieldValue.arrayRemove([uid])
        });
        await _firebaseFirestore.collection('users').doc(uid).update({
          'followers': FieldValue.arrayRemove([_auth.currentUser!.uid])
        });
      } else {
        _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          'following': FieldValue.arrayUnion([uid])
        });
        _firebaseFirestore.collection('users').doc(uid).update({
          'followers': FieldValue.arrayUnion([_auth.currentUser!.uid])
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
