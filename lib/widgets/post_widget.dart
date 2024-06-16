// ignore_for_file: prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/data/firebase_service/firestor.dart';
import 'package:greencircuit/util/image_cached.dart';
import 'package:greencircuit/widgets/full_screen_image_page.dart';

import '../core/constants.dart';
import 'comment.dart';
import 'like_animation.dart';

class PostWidget extends StatefulWidget {
  final dynamic snapshot;
  const PostWidget(this.snapshot, {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isAnimating = false;
  String user = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDarkTheme = themeData.brightness == Brightness.dark;
    final Color textColor = isDarkTheme ? Colors.white : Colors.black;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: themeData.primaryColor,
          child: Center(
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: CachedImage(widget.snapshot['profileImage']),
                ),
              ),
              title: Text(
                widget.snapshot['username'],
                style: TextStyle(
                  fontSize: 13,
                  color: textColor,
                ),
              ),
              subtitle: Text(
                widget.snapshot['location'],
                style: TextStyle(
                  fontSize: 11,
                  color: textColor,
                ),
              ),
              trailing: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {
            Firebase_Firestor().like(
                like: widget.snapshot['like'],
                type: 'posts',
                uid: user,
                postId: widget.snapshot['postId']);
            setState(() {
              isAnimating = true;
            });
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImagePage(
                  imageURL: widget.snapshot['postImage'],
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 375,
                child: CachedImage(widget.snapshot['postImage']),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isAnimating ? 1 : 0,
                child: LikeAnimation(
                  isAnimating: isAnimating,
                  duration: const Duration(milliseconds: 400),
                  iconlike: false,
                  End: () {
                    setState(() {
                      isAnimating = false;
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: themeData.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              Row(
                children: [
                  const SizedBox(width: 14),
                  LikeAnimation(
                    isAnimating: widget.snapshot['like'].contains(user),
                    child: IconButton(
                      onPressed: () {
                        Firebase_Firestor().like(
                            like: widget.snapshot['like'],
                            type: 'posts',
                            uid: user,
                            postId: widget.snapshot['postId']);
                      },
                      icon: Icon(
                        widget.snapshot['like'].contains(user)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.snapshot['like'].contains(user)
                            ? Colors.red
                            : icons,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: DraggableScrollableSheet(
                              maxChildSize: 0.6,
                              initialChildSize: 0.6,
                              minChildSize: 0.2,
                              builder: (context, scrollController) {
                                return Comment(
                                    'posts', widget.snapshot['postId']);
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'images/comment.webp',
                      height: 28,
                      color: icons,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 4,
                  bottom: 8,
                ),
                child: Text(
                  widget.snapshot['like'].length.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.snapshot['username']} :  ${widget.snapshot['caption']}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 8),
                child: Text(
                  formatDate(widget.snapshot['time'].toDate(),
                      [yyyy, '-', mm, '-', dd]),
                  style: TextStyle(
                    fontSize: 11,
                    color: themeData.brightness == Brightness.dark
                        ? Colors.black
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
