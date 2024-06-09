import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'example/blank_page.dart';
import 'example/counter/default_counter_page.dart';
import 'example/counter/riverpod_counter_page.dart';
import 'example/dialog_sample/dialog_sample_page.dart';
import 'example/error_page.dart';
import 'example/hanburger_menu/hanburger_menu_page.dart';
import 'example/isar/isar_page.dart';
import 'example/navbar/go_router/app_navigation_bar.dart';
import 'example/navbar/go_router/navbar_home_detail_page.dart';
import 'example/navbar/go_router/navbar_home_page.dart';
import 'example/start_page.dart';
import 'example/statemanagement/riverpod_state_page.dart';
import 'example/webview/webview_flutter_sample.dart';
import 'example/webview/webview_windows_sample.dart';

// https://zenn.dev/flutteruniv_dev/articles/stateful_shell_route
// https://github.com/heyhey1028/go_router_samples

// Contextにアクセスできないときに使用することで遷移できる
// navigatorKey.currentState!
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
final historyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'history');

final appRouting = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  // アプリが起動した時
  initialLocation: '/',
  // パスと画面の組み合わせ
  // エラーページ
  errorPageBuilder: (context, state) => _buildMatPage(
    Scaffold(body: ErrorPage(message: state.error.toString())),
    state,
  ),
  // リダイレクト
  redirect: (context, state) {
    // リダイレクトなし
    return null;
  },
  // ルーティング
  routes: [
    // 開始ページ
    _buildMatGoRoute(
      '/',
      const StartPage(),
      'initial',
      // ネストルーター
      [
        _buildMatGoRoute('blank', const BlankPage()),
      ],
    ),
    // 空ページ
    _buildMatGoRoute('/blank', const BlankPage()),
    // ナビページ
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return AppNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(navigatorKey: homeNavigatorKey, routes: <RouteBase>[
          GoRoute(
              name: 'navbar-home',
              path: '/navbar-home',
              builder: (context, state) => const NavbarHomePage(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'navbar-detail',
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (context, state) {
                    final product = state.extra as String;
                    return MaterialPage(
                        //key: state.pageKey,
                        child: NavbarHomeDetailPage(product: product));
                  },
                )
              ]),
        ]),
        StatefulShellBranch(navigatorKey: searchNavigatorKey, routes: [
          _buildNoTranRoute('/navbar-search', const BlankPage(), null, []),
        ]),
        StatefulShellBranch(navigatorKey: historyNavigatorKey, routes: [
          _buildNoTranRoute('/navbar-history', const BlankPage(), null, []),
        ]),
      ],
    ),
    // 状態管理ページ
    _buildMatGoRoute('/statemanagement', const RiverpodStatePage()),
    // DBページ
    _buildMatGoRoute('/isar', const IsarPage()),
    // ハンバーガーメニューページ
    _buildMatGoRoute('/hanburger_menu', const HamburgerMenuPage()),
    // ダイアログページ
    _buildMatGoRoute('/dialog_sample', const DialogSamplePage()),
    // カウンタページ
    _buildMatGoRoute(
        '/counter',
        const DefaultCounterPage(
          title: 'teeesst',
        )),
    // カウンタページ
    _buildMatGoRoute('/rivercounter', const RiverPodCounterPage()),
    // WEBページ
    _buildMatGoRoute('/web', const WebviewFlutterSample()),
    _buildMatGoRoute('/winweb', const WebviewWindowsSample()),
  ],
);

GoRoute _buildGoRoute(
  String path,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder, [
  String? name,
  List<RouteBase>? routes,
  GlobalKey<NavigatorState>? parentNavigatorKey,
]) =>
    GoRoute(
      path: path,
      name: name,
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: pageBuilder,
      routes: routes ?? [],
    );

GoRoute _buildMatGoRoute(String path, Widget child,
        [String? name,
        List<RouteBase>? routes,
        GlobalKey<NavigatorState>? parentNavigatorKey]) =>
    GoRoute(
      path: path,
      name: name,
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: (context, state) => _buildMatPage(child, state),
      routes: routes ?? [],
    );

GoRoute _buildNoTranRoute(String path, Widget child,
        [String? name,
        List<RouteBase>? routes,
        GlobalKey<NavigatorState>? parentNavigatorKey]) =>
    GoRoute(
      path: path,
      name: name,
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: (context, state) => _buildNoTranPage(child, state),
      routes: routes ?? [],
    );

MaterialPage _buildMatPage(Widget child, GoRouterState state) => MaterialPage(
      key: state.pageKey,
      child: child,
    );

NoTransitionPage _buildNoTranPage(Widget child, GoRouterState state) =>
    NoTransitionPage(
      key: state.pageKey,
      child: child,
    );
