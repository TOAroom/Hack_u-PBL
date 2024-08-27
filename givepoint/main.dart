import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointcard/pointgive_completion_page.dart';

import 'page_delivery.dart';
import 'page_main.dart';
import 'page_create.dart';
import 'page_list.dart';
import 'page_transaction.dart';
import 'userlist_page.dart';

main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  App({super.key});

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/main',
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/main',
        builder: (context, state) => const Pagemain(),
      ),
      GoRoute(
        path: '/create',
        builder: (context, state) => const Pagecreate(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => const Pagelist(),
      ),
      GoRoute(
        path: '/delivery',
        builder: (context, state) => const Pagedelivery(),
      ),
      GoRoute(
        path: '/transaction',
        builder: (context, state) => const Pagetransaction(),
      ),
      GoRoute(
        path: '/givepoint',
        builder: (context, state) => const Givepoint(),
      ),
      GoRoute(
        path: '/givecompletion',
        builder: (context, state) => const PointgiveCompletion(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
