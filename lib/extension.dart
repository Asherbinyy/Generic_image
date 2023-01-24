import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
extension BoolOpExtension <T>on bool {
  /// This returns a Widget if the bool is true
  Widget build({
    Widget Function()? onBuild,
    Widget Function()? onFeedback,
    Widget? build,
    Widget? feedback,
  }) {
    return ConditionalBuilder(
      condition: this,
      onBuild: onBuild?.call() ?? build ?? const SizedBox.shrink(),
      onFeedBack: onFeedback?.call() ?? feedback ?? const SizedBox.shrink(),
    );
  }

  /// This returns a Widget if the bool is false

  T conditional ({
    required T onBuild,
    required T onFeedback,
  })=>  this  ? onBuild : onFeedback;

}

class ConditionalBuilder extends StatelessWidget {
  final bool condition;
  final Widget onBuild;
  final Widget? onFeedBack;

  const ConditionalBuilder({
    Key? key,
    required this.condition,
    required this.onBuild,
    this.onFeedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition ? onBuild : onFeedBack ?? const SizedBox.shrink();
  }
}


extension SizeExtension on num  {
  double  toH() => h   ;
  double  toW() => w;
  double toRad  ()=> r;
}
