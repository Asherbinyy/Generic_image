import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:generic_image/Image/options/image_options.dart';
import 'package:generic_image/extension.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final ImageOptions? options;

  const ImageNetwork({
    Key? key,
    required this.url,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: options?.scale,
      child: Container(
        height: (options?.radius ?? options?.height)?.toH(),
        width: (options?.radius ?? options?.width)?.toW(),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: options?.borderRadius,
          shape: options?.radius != null ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          fadeInCurve: Curves.easeInBack,
          placeholder: (context, url) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            child: const CircularProgressIndicator.adaptive(),
          ),
          fit: options?.fit,
          errorWidget: (context, url, error) => Center(
            child: Image.asset(
              '${options?.onNetworkErrorImage}',
              fit: BoxFit.cover,
            ),
          ),
          // Center(child: const Icon(Icons.error, color: AppColors.errorColor)),
        ),
      ),
    );
  }
}
