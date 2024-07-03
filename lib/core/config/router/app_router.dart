import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:mobile_warehouse_managment/feature/Home/view/home_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/view/add_product_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/view/inventory_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/view/product_details_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/view/warehouses_view.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kHomeView='/HomeView';
  static const String kWarehousesView='/WarehousesView';
  static const String kInventoryView='/InventoryView';
  static const String kProductDetailsView='/ProductDetailsView';
  static const String kAddProductView='/AddProductView';
  static final routter = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginView(),
    ),
    GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    GoRoute(path: kWarehousesView, builder: (context, state) =>WarehousesView()),
    GoRoute(path: kInventoryView, builder: (context, state) =>InventoryView()),
    GoRoute(path: kProductDetailsView, builder: (context, state) =>ProductDetailsView()),
    GoRoute(path: kAddProductView, builder: (context, state) =>AddProductView()),
  ]);
}
