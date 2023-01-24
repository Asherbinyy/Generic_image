import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_image/Image/image_asset.dart';
import 'package:generic_image/Image/image_network.dart';
import 'package:generic_image/Image/image_svg.dart';
import 'package:generic_image/Image/image_view.dart';
import 'package:generic_image/Image/options/image_options.dart';
import 'package:generic_image/extension.dart';
import 'package:generic_image/image_type.dart';

class ImageGeneric extends StatelessWidget {
  final ImageOptions? options;
  final ImageProvider? imageProvider;
  final Widget? child;

  const ImageGeneric({
    super.key,
    required this.child,
    this.options,
    this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (options?.previewImage ?? false) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ImageView(
                minScale: options?.previewImageMinScale ?? 0.0,
                maxScale: options?.previewImageMaxScale ?? 1.0,
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          );
        }
      },
      child: child ??
          (imageProvider != null
              ? ImageIcon(
                  imageProvider!,
                  color: options?.color,
                  size: options?.radius,
                )
              : const SizedBox.shrink()),
    );
  }

  factory ImageGeneric.asset({
    Key? key,
    required String url,
    ImageOptions? options,
  }) {
    return ImageGeneric(
      key: key,
      child: ImageAsset(
        url: url,
        options: options,
      ),
    );
  }

  factory ImageGeneric.network({
    Key? key,
    required String url,
    ImageOptions? options,
  }) {
    return ImageGeneric(
        key: key,
        child: ImageNetwork(
          url: url,
          options: options,
        ));
  }

  factory ImageGeneric.file({
    Key? key,
    required File? fileImage,
    ImageOptions? options,
  }) {
    return ImageGeneric(
      key: key,
      child: ConditionalBuilder(
        condition: fileImage != null && fileImage.path != '',
        onBuild: Image.file(
          fileImage ?? File(''),
          fit: options?.fit,
          height: options?.height,
          width: options?.width,
          scale: options?.scale ?? 1,
          alignment: options?.alignment ?? Alignment.center,
          color: options?.color,
        ),
        onFeedBack: const SizedBox.shrink(),
      ),
    );
  }

  factory ImageGeneric.svg({
    Key? key,
    required String url,
    ImageOptions? options,
    bool isNetwork = false,
  }) {

    return ImageGeneric(
        key: key,
        child: ImageSvg(
          url: url,
          options: options,
            // type: isNetwork.conditional(onBuild: ImageType.network, onFeedback: ImageType.asset),

          type: isNetwork ? ImageType.network : ImageType.asset,

        ));
  }
}
