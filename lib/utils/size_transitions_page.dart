import 'package:flutter/material.dart';

class SizeTransitionsRoute extends PageRouteBuilder {
  final Widget page;

  SizeTransitionsRoute({required this.page})
      : super(
    transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}
