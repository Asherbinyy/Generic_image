
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_image/Image/options/image_options.dart';
import 'package:generic_image/extension.dart';
import 'package:generic_image/image_type.dart';

class ImageSvg extends StatelessWidget {
  final String url;
  final ImageOptions ? options;
  final ImageType type;

  ImageSvg({
    super.key,
    required this.url,
      this.options,
    this.type = ImageType.sVGAsset,
  })  : assert(type == ImageType.sVGAsset || type == ImageType.sVGNetwork,
            'type must be SVGAsset or SVGNetwork'),
        assert(url.isNotEmpty, 'url must not be empty');

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: options?.scale,
      child: ConditionalBuilder(
        condition: url.isNotEmpty,
        onBuild: Container(
          height: (options?.radius ?? options?.height)?.toH(),
          width: (options?.radius ?? options?.width)?.toW(),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: options?.backgroundColor,
            borderRadius: options?.borderRadius,
            shape:
                options?.radius != null ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: type == ImageType.sVGAsset
              ? SvgPicture.asset(
                  url,
                  fit: options?.fit ?? BoxFit.contain,
                  // height: options?.height,
                  // width: options?.width,
                  alignment: options?.alignment ?? Alignment.center,
                  color: options?.color,
                )
              : SvgPicture.network(
                  url,
                  fit: options?.fit ?? BoxFit.contain,
                  // height: options?.height,
                  // width: options?.width,
                  alignment: options?.alignment ?? Alignment.center,
                  color: options?.color,
                ),
        ),
        onFeedBack: SizedBox.shrink(),
      ),
    );
  }
}
