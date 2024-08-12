// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_import, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final String Uid;
  const ProfileScreen({Key? key, required this.Uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int postLength = 0;
  bool isYourself = false;
  List following = [];
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    getData();
    if (widget.Uid == _auth.currentUser!.uid) {
      setState(() {
        isYourself = true;
      });
    }
  }

  getData() async {
    DocumentSnapshot snap = await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    following = (snap.data()! as dynamic)['following'];
    if (following.contains(widget.Uid)) {
      setState(() {
        isFollowing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.h,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Perfil'),
                  background: FutureBuilder(
                    future: Firebase_Firestor().getUser(UID: widget.Uid),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Head(snapshot.data!);
                    },
                  ),
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
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  postLength = snapshot.data!.docs.length;
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final snap = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostScreen(snap.data()),
                            ),
                          );
                        },
                        child: CachedImage(snap['postImage']),
                      );
                    }, childCount: postLength),
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
                        postLength.toString(),
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
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      SizedBox(width: 25.w),
                      Text(
                        'Seguidores',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      SizedBox(width: 19.w),
                      Text(
                        'Seguidos',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                ],
              ),
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          if (!isFollowing)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: GestureDetector(
                onTap: () {
                  if (!isYourself) {
                    Firebase_Firestor().flollow(uid: widget.Uid);
                    setState(() {
                      isFollowing = true;
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isYourself ? gray500 : primary,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    isYourself ? 'Edita tu perfil' : 'Seguir',
                    style: TextStyle(color: white, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          if (isFollowing)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Firebase_Firestor().flollow(uid: widget.Uid);
                        setState(() {
                          isFollowing = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: gray900,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: gray900),
                        ),
                        child: Text(
                          'Dejar de seguir',
                          style: TextStyle(color: white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: gray900,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: gray900),
                      ),
                      child: Text(
                        'Mensaje',
                        style: TextStyle(color: white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: const TabBar(
              unselectedLabelColor: icons,
              labelColor: icons2,
              indicatorColor: icons2,
              tabs: [
                Icon(Icons.grid_on),
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
