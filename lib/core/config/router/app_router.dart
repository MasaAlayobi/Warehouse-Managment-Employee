import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:mobile_warehouse_managment/feature/Home/view/home_view.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/customer.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/detailsCustomer.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/view/warehouses_view.dart';
import 'package:mobile_warehouse_managment/feature/reports/view/reports.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/supplier.dart';

abstract class AppRouter {
  static const String kLoginView = '/loginView';
  static const String kHomeView = '/HomeView';
  static const String KWarehousesView = '/WarehousesView';
  static const String KReportView = '/Reports';
  static const String KSupplierView = '/Supplier';
  static const String KCustomerView = '/customer';
  static final routter = GoRouter(routes: [
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
    GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    GoRoute(
        path: KWarehousesView, builder: (context, state) => WarehousesView()),
  ]);
}
