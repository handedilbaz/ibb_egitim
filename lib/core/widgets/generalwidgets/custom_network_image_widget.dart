import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key key, this.link, this.size, this.fit})
      : super(key: key);

  final String link;
  final double size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(link, height: size, width: size, fit: fit);
  }
}
