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
  final loginInfo = LoginInfo();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  late final _router = GoRouter(
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
    // ユーザーがログインしていない場合はログインページにリダイレクト
    redirect: (state) {
      // ユーザーがログインしていない場合はログインが必要
      // final loggedIn = loginInfo.loggedIn;
      // final loggingIn = state.subloc == '/login';
      // if (!loggedIn) return loggingIn ? null : '/login';

      // ユーザーがログインしているにも関わらず、まだログイン画面にいる場合は
      // ホーム画面に誘導する
      // if (loggingIn) return '/';
      print(state.fullpath);

      // 一切リダイレクトが不要な場合
      return null;
    },
  );
}

class LoginInfo extends ChangeNotifier {
  var _userName = '';
  String get userName => _userName;
  bool get loggedIn => _userName.isNotEmpty;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }
}
