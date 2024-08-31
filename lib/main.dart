import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vscode_test/customer_OR_store/application_logo.dart';

import 'customer_OR_store/store_page_main/store_page_delivery/page_delivery.dart';
import 'customer_OR_store/customer_page_main/customer_page_main.dart';
import 'customer_OR_store/store_page_main/store_page_create/page_create.dart';
import 'customer_OR_store/customer_page_main/customer_page_list/customer_page_list.dart';
import 'customer_OR_store/store_page_main/store_page_transaction/page_transaction.dart';
import 'customer_OR_store/customer_OR_store.dart';
import 'customer_OR_store/store_page_main/store_Page_main.dart';
import 'customer_OR_store/store_page_main/store_page_transaction/userlist_page.dart';
import 'customer_OR_store/customer_page_main/customer_camera/QRreader.dart';
import 'customer_OR_store/store_page_main/store_page_transaction/pointgive_completion_page.dart';

main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  App({super.key});

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/logo',
    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/logo',
        builder: (context, state) => ApplicationLogo(),
      ),
      GoRoute(
        path: '/choice_cs',
        builder: (context, state) => Customer_OR_Store(),
      ),
      GoRoute(
        path: '/s_main',
        builder: (context, state) => const Store_Pagemain(),
      ),
      GoRoute(
        path: '/main', //変更面倒でやってないけど、このmainはcustomerのmainの方を指してる
        builder: (context, state) => const c_Pagemain(),
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
      GoRoute(
        //自分のつけたし
        path: '/scaner',
        builder: (context, state) => const QrScanView(),
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
