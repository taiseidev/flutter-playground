import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/first_signIn.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/home_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/sign_in_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/error_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/sign_up_page.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/top_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  GetIt.I.registerSingleton(TestNotifier(5));
  runApp(
    GoRouterSample(),
  );
}

class GoRouterSample extends StatelessWidget {
  GoRouterSample({Key? key}) : super(key: key);
  final testNotifierRepository = GetIt.I<TestNotifier>();

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
    // Listenableに変化があればルーターによってルートがリフレッシュされる。
    refreshListenable: testNotifierRepository,
    // 10回までリダイレクトを許容する（無限ループを制限）
    redirectLimit: 10,
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
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/first',
        builder: (context, state) => FirstSignInPage(),
      ),
    ],
    // 該当のルートが見つからないときにエラー画面を表示
    errorBuilder: (context, state) => ErrorPage(
      message: state.error.toString(),
    ),
    // ナビゲーションイベントが起こるたびに発火している
    redirect: (state) {
      if (testNotifierRepository.value == 0) {
        testNotifierRepository.resetCount();
        return '/home';
      }
      // nullを返すと本来の遷移先に遷移してくれる
      return null;
    },
  );
}

class TestNotifier extends ValueNotifier<int> {
  TestNotifier(super.value);

  void countDown() {
    value = value - 1;
  }

  void resetCount() {
    value = 5;
  }
}

// アプリの構成
// ログイン機能
// 未ログインの場合はログイン画面に遷移
// ログイン済みの場合はホーム画面に遷移
// 初回ログインの場合は説明画面を表示
