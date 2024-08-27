import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page_delivery.dart';
import 'page_main.dart';
import 'page_create.dart';
import 'page_list.dart';
import 'page_transaction.dart';
import 'customer_OR_store.dart';
import 'store_Page_main.dart';

main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  App({super.key});

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/cs',
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/cs',
        builder: (context, state) => const Customer_OR_Store(),
      ),
      GoRoute(
        path: '/s_main',
        builder: (context, state) => const Store_Pagemain(),
      ),
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
