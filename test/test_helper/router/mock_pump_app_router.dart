import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../test_helper.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpRealRouterApp(
    String location,
    Widget Function(Widget child) builder,
  ) {
    return pumpWidget(
      builder(
        MaterialApp.router(
          routeInformationParser: mockRouter(location).routeInformationParser,
          routerDelegate: mockRouter(location).routerDelegate,
        ),
      ),
    );
  }

  Future<void> pumpRouterApp(Widget widget, String initialLocation) {
    final _router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: initialLocation,
          builder: (context, state) => widget,
        ),
        ...Routes()
            .props
            .map(
              (e) => GoRoute(
                path: e! as String,
                builder: (context, state) => Container(
                  key: Key(
                    getRouterKey(e as String),
                  ),
                ),
              ),
            )
            .toList()
      ],
    );

    return pumpWidget(
      MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The mock navigator used to mock navigation calls.
  final MockGoRouter goRouter;

  /// The child [Widget] to render.
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}
