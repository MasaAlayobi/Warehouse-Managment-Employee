import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:mobile_warehouse_managment/feature/Home/view/home_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/view/warehouses_view.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kHomeView='/HomeView';
  static const String KWarehousesView='/WarehousesView';
  static final routter = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginView(),
    ),
    GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    GoRoute(path: KWarehousesView, builder: (context, state) =>WarehousesView()),
  ]);
}
