// ignore_for_file: must_be_immutable, unused_import, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/data/firebase_service/firestor.dart';
import 'package:greencircuit/util/image_cached.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Comment extends StatefulWidget {
  final String type;
  final String uid;

  const Comment(this.type, this.uid, {super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final commentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: MediaQuery.of(context).size.width * 0.5 - 50,
              child: Container(
                width: 100,
                height: 3,
                color: Colors.black,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection(widget.type)
                  .doc(widget.uid)
                  .collection('comments')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return commentItem(snapshot.data!.docs[index].data());
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 60,
                width: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: commentController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Añadir un comentario',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (commentController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          await Firebase_Firestor().Comments(
                            comment: commentController.text,
                            type: widget.type,
                            uidd: widget.uid,
                          );
                          setState(() {
                            isLoading = false;
                            commentController.clear();
                          });
                        }
                      },
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Icon(
                              Icons.send,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentItem(final snapshot) {
    return ListTile(
      leading: ClipOval(
        child: SizedBox(
          height: 35,
          width: 35,
          child: CachedImage(
            snapshot['profileImage'],
          ),
        ),
      ),
      title: Text(
        snapshot['username'],
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
      subtitle: Text(
        snapshot['comment'],
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}
