import 'package:flutter/material.dart';

class AuthorImage extends StatelessWidget {
  const AuthorImage({
    Key? key,
    this.image,
    this.imageRadius = 30,
  }) : super(key: key);

  final ImageProvider? image;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundImage: image,
        radius: imageRadius - 5,
      ),
    );
  }
}
