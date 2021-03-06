import 'package:flutter/material.dart';

Future<T?> showBaseDialog<T>({
  required BuildContext context,
  required Widget child,
  Widget? fixed,
  VoidCallback? onDismiss,
}) {
  return Navigator.push(
      context,
      _FDialogRoute<T>(
        child: child,
        fixed: fixed,
      )).then((_) {
    if (onDismiss != null) onDismiss();
    return null;
  });
}

class _FDialogRoute<T> extends PopupRoute<T> {
  @override
  final String barrierLabel = 'Barrier';
  final Widget child;
  @required
  Widget? fixed;

  _FDialogRoute({required this.child, this.fixed}) : super();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => const Color.fromARGB(102, 93, 99, 112);

  // late AnimationController _animationController;

  // @override
  // AnimationController createAnimationController() {
  //   _animationController = AnimationController(
  //       duration: const Duration(milliseconds: 200), vsync: navigator.overlay);
  //   return _animationController;
  // }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, _) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            var curved =
                CurvedAnimation(curve: Curves.decelerate, parent: animation);
            return Opacity(
              opacity: curved.value,
              child: child,
            );
          },
        ),
        fixed ?? Container(),
      ],
    );
  }
}
