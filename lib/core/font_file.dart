import 'package:flutter/material.dart';

double getpixelRatio(BuildContext context) {
  double pixelRatio = 0;

  pixelRatio = MediaQuery.of(context).devicePixelRatio;

  return pixelRatio;
}

double getFontSizeTitle(BuildContext context) {
  double pixelRatio = getpixelRatio(context);
  if (pixelRatio >= 4.0) {
    return 22; //16.0;
  } else if (pixelRatio >= 3.0) {
    return 20; //18.0;
  } else if (pixelRatio >= 2.0) {
    return 18; //15.0;
  } else if (pixelRatio >= 1.5) {
    return 16; //11.0;
  } else if (pixelRatio >= 1.0) {
    return 14.0;
  } else {
    return 14.0;
  }
}

double getFontSizeSubTitle(BuildContext context) {
  double pixelRatio = getpixelRatio(context);
  if (pixelRatio >= 4.0) {
    return 14.0; //!4
  } else if (pixelRatio >= 3.0) {
    return 12.0; //14
  } else if (pixelRatio >= 2.0) {
    return 11.0; //12
  } else if (pixelRatio >= 1.5) {
    return 10.0;
  } else if (pixelRatio >= 1.0) {
    return 9.0;
  } else {
    return 9.0;
  }
}

double getFontSizeNormal(BuildContext context) {
  double pixelRatio = getpixelRatio(context);
  if (pixelRatio >= 4.0) {
    return 18.0; //!4
  } else if (pixelRatio >= 3.0) {
    return 16.0; //14
  } else if (pixelRatio >= 2.0) {
    return 15.0; //12
  } else if (pixelRatio >= 1.5) {
    return 14.0;
  } else if (pixelRatio >= 1.0) {
    return 13.0;
  } else {
    return 12.0;
  }
}
