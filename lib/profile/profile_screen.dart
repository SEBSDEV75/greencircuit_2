// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_import, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/data/firebase_service/firestor.dart';
import 'package:greencircuit/data/model/usermodel.dart';
import 'package:greencircuit/load_images/post_screen.dart';
import 'package:greencircuit/util/image_cached.dart';
import 'package:greencircuit/widgets/post_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants.dart';
import 'profile_settings_page.dart';

class ProfileScreen extends StatefulWidget {
  String Uid;
  ProfileScreen({super.key, required this.Uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int post_lenght = 0;
  bool yourse = false;
  List following = [];
  bool follow = false;
  @override
  void initState() {
    super.initState();
    getdata();
    if (widget.Uid == _auth.currentUser!.uid) {
      setState(() {
        yourse = true;
      });
    }
  }

  getdata() async {
    DocumentSnapshot snap = await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    following = (snap.data()! as dynamic)['following'];
    if (following.contains(widget.Uid)) {
      setState(() {
        follow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FutureBuilder(
                  future: Firebase_Firestor().getUser(UID: widget.Uid),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Head(snapshot.data!);
                  },
                ),
              ),
              StreamBuilder(
                stream: _firebaseFirestore
                    .collection('posts')
                    .where('uid', isEqualTo: widget.Uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()));
                  }
                  post_lenght = snapshot.data!.docs.length;
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final snap = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PostScreen(snap.data())));
                        },
                        child: CachedImage(
                          snap['postImage'],
                        ),
                      );
                    }, childCount: post_lenght),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Head(Usermodel user) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                child: ClipOval(
                  child: SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: CachedImage(user.profile),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 35.w),
                      Text(
                        post_lenght.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 53.w),
                      Text(
                        user.followers.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 70.w),
                      Text(
                        user.following.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        'Posts',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Text(
                        'Seguidores',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(width: 19.w),
                      Text(
                        'Seguidos',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.username,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  user.bio,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Visibility(
            visible: !follow,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: GestureDetector(
                onTap: () {
                  if (yourse == false) {
                    Firebase_Firestor().flollow(uid: widget.Uid);
                    setState(() {
                      follow = true;
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: yourse ? gray900 : gray900,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: yourse
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileSettingsPage(),
                            ));
                          },
                          child: const Text(
                            'Edita tu perfil',
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        )
                      : const Text(
                          'Seguir',
                          style: TextStyle(color: white),
                        ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: follow,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Firebase_Firestor().flollow(uid: widget.Uid);
                        setState(() {
                          follow = false;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: gray900,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: gray900),
                          ),
                          child: const Text('Dejar de seguir')),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: gray900,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: gray900),
                      ),
                      child: const Text(
                        'Mensaje',
                        style: TextStyle(color: gray900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: double.infinity,
            height: 30.h,
            child: const TabBar(
              unselectedLabelColor: icons,
              labelColor: icons2,
              indicatorColor: icons2,
              tabs: [
                Icon(Icons.grid_on),
                Icon(Icons.video_collection),
                Icon(Icons.person),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }
}
