import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({Key key, this.asset, this.size, this.fit})
      : super(key: key);

  final String asset;
  final double size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(asset, height: size, width: size, fit: fit));
  }
}
