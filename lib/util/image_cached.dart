// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? imageURL;
  const CachedImage(this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageURL!,
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
        color: Colors.amber,
        child: const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
