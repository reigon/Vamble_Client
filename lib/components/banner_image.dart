import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final bool isConstrained;

  BannerImage(
      {required this.url, this.height, this.width, this.isConstrained = false});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Container();
    }
    try {
      return Container(
        constraints: this.isConstrained
            ? BoxConstraints.expand(height: height, width: width)
            : null,
        child: Image.network(url, fit: BoxFit.cover),
      );
    } catch (e) {
      print("could not load image $url");
      return Container();
    }
  }
}
