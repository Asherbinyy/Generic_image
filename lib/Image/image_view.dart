  import 'package:flutter/material.dart';
import 'package:generic_image/extension.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.child,
    this.minScale = 0.0,
    this.maxScale = 1.0,
   }) : super(key: key);

  final Widget child;
  final double minScale;
  final double maxScale;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      primary: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: InteractiveViewer(
                child: child,
                minScale: minScale,
                maxScale: maxScale,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0.toRad()),
              child: const CloseButton(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   primary: false,
    //   // appBar:AppBars.basic(),
    //   body: SafeArea(
    //     child: Stack(
    //       alignment: Alignment.topLeft,
    //       children: [
    //         Container(
    //           constraints: BoxConstraints.expand(
    //             height: MediaQuery.of(context).size.height,
    //           ),
    //           child: PhotoView(
    //             imageProvider: imageProvider,
    //             minScale: minScale,
    //             maxScale: maxScale,
    //             // heroAttributes: const PhotoViewHeroAttributes(tag: "someTag.Home",),
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(12.0.toRad()),
    //           child: const CloseButton(
    //             color: Colors.grey,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
