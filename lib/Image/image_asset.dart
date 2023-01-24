 import 'package:flutter/material.dart';
 import 'package:generic_image/Image/options/image_options.dart';
import 'package:generic_image/extension.dart';

class ImageAsset extends StatelessWidget {

  final String url;
  final ImageOptions ?options;
  const ImageAsset({Key? key, required this.url,   this.options , }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: options?.scale,
      child: Container(
        height: (options?.radius??options?.height)?.toH(),
        width: (options?.radius ?? options?.width)?.toW(),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: options?.backgroundColor,
          borderRadius: options?.borderRadius,
          shape: options?.radius!=null ? BoxShape.circle  : BoxShape.rectangle,
        ),
        child: Image.asset(
          url,
          // width: options?.width,
          // height: options?.height,
          fit: options?.fit,
          color: options?.color,
          alignment: options?.alignment ?? Alignment.center,
        ),
      ),
    );
  }
}
