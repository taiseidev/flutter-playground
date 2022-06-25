import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/home_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/sign_in_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/error_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/sign_up_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/top_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    GoRouterSample(),
  );
}

class GoRouterSample extends StatelessWidget {
  GoRouterSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );

  late final _router = GoRouter(
    // initialLocation: '/',
    // webの#を削除
    urlPathStrategy: UrlPathStrategy.path,
    // ルート診断情報の出力を有効にする
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TopPage(),
        routes: [
          GoRoute(
            path: 'signIn',
            builder: (context, state) => const SignInPage(),
          ),
          GoRoute(
            path: 'signUp',
            builder: (context, state) => const SignUpPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
    ],
    // 該当のルートが見つからないときにエラー画面を表示
    errorBuilder: (context, state) => ErrorPage(
      message: state.error.toString(),
    ),
    // ナビゲーションイベントが起こるたびに発火している
    redirect: (state) {},
  );
}





// アプリの構成
// ログイン機能
// 未ログインの場合はログイン画面に遷移
// ログイン済みの場合はホーム画面に遷移
// 初回ログインの場合は説明画面を表示
