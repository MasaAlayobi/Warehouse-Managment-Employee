import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:mobile_warehouse_managment/feature/Home/view/home_view.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/customer.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/view/add_product_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/view/inventory_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/view/product_details_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/view/warehouses_view.dart';
import 'package:mobile_warehouse_managment/feature/reports/view/reports.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/supplier.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kHomeView = '/HomeView';
  static const String kWarehousesView = '/WarehousesView';
  static const String kInventoryView = '/InventoryView';
  static const String kProductDetailsView = '/ProductDetailsView';
  static const String kAddProductView = '/AddProductView';
  static const String KReportView = '/Reports';
  static const String KSupplierView = '/Supplier';
  static const String KCustomerView = '/customer';

  static final routter = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => LoginView()),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: KReportView,
      builder: (context, state) => Reports(),
    ),
    GoRoute(
      path: KSupplierView,
      builder: (context, state) => Supplier(),
    ),
    GoRoute(path: KCustomerView, builder: (context, state) => Customer()),
    GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    GoRoute(path: kInventoryView, builder: (context, state) => InventoryView()),
        GoRoute(
        path: kAddProductView,
        builder: (context, state) => AddProductView()),
    GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => ProductDetailsView()),
    GoRoute(
        path: kWarehousesView, builder: (context, state) => WarehousesView()),
    GoRoute(path: kInventoryView, builder: (context, state) => InventoryView()),
  ]);
}
