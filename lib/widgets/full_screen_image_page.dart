import 'package:flutter/material.dart';
import 'package:greencircuit/util/image_cached.dart';

class FullScreenImagePage extends StatelessWidget {
  final String imageURL;

  const FullScreenImagePage({required this.imageURL, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CachedImage(imageURL),
      ),
    );
  }
}
