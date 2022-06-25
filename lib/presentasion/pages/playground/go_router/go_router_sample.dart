import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/go_router1.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/go_router_error_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/go_router_home.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(GoRouterSample());
}

class GoRouterSample extends StatelessWidget {
  GoRouterSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  final _router = GoRouter(
    initialLocation: '/',
    // webの#を削除
    urlPathStrategy: UrlPathStrategy.path,
    // ルート診断情報の出力を有効にする
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => GoRouterHome(),
      ),
      GoRoute(
        path: '/1',
        builder: (context, state) => GoRouter1(),
      ),
    ],
    errorBuilder: (context, state) => GoRouterErrorPage(
      message: state.error.toString(),
    ),
  );
}
