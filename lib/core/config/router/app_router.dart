

import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/feature/Home/view/home_view.dart';
import 'package:mobile_warehouse_managment/feature/complaintToAdmin/view/complaintToAdmin.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/view/customer.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/view/add_product_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/view/inventory_view.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/currentOrderPurchases/view/current_order_purchases.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/previousPurchases/purchasesOdrerDetails/view/purchases_order_details.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/previousPurchases/view/previous_purchases_view.dart';
import 'package:mobile_warehouse_managment/feature/quality/expiring_date/view/expiringDate.dart';
import 'package:mobile_warehouse_managment/feature/quality/view/quality.dart';
import 'package:mobile_warehouse_managment/feature/reports/view/reports.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/view/current_order_view.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/orderDetails/view/order_details_view.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/view/previous_sales_view.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/view/all_shipments_view.dart';
import 'package:mobile_warehouse_managment/feature/supplier/AllSupplier/view/supplier.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/showWare/view/warehouses_view.dart';


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
  static const String kPreviousSalesView = '/PreviousSalesView';
  static const String kCurrentOrderView = '/CurrentOrderView';
  static const String kOrderDetailsView = '/OrderDetailsView';
  static const String kQualityView = '/QualityView';
  static const String kExpiringDateView = '/ExpiringDateView';
  static const String kPreviousPurchasesView = '/PreviousPurchasesView';
  static const String kPurchasesOrderDetails = '/PurchasesOrderDetails';
  static const String kCurrentOrderPurchases = '/CurrentOrderPurchases';
  static const String kComplainToAdminView = '/ComplainToAdminView';
  static const String kAllShipmentsView = '/AllShipmentsView';
  static final routter = GoRouter(routes: [
    // GoRoute(path: "/", builder: (context, state) => HomeView()),
    GoRoute(
        path: kComplainToAdminView,
        builder: (context, state) => ComplainToAdminView()),
   
    GoRoute(
      path: KReportView,
      builder: (context, state) => Reports(),
    ),
    GoRoute(
      path: kExpiringDateView,
      builder: (context, state) => ExpiringDateView(),
    ),
    GoRoute(
      path: KSupplierView,
      builder: (context, state) => Supplier(),
    ),
    GoRoute(path: KCustomerView, builder: (context, state) => Customer()),
    GoRoute(
        path:
           "/",
        builder: (context, state) =>HomeView()),
    GoRoute(path: kHomeView,builder: (context, state) => HomeView(),),
    GoRoute(
        path: kWarehousesView, builder: (context, state) => WarehousesView()),
    GoRoute(path: kInventoryView, builder: (context, state) => InventoryView()),
    GoRoute(
        path: kAddProductView, builder: (context, state) => AddProductView()),
    // GoRoute(
    //     path: kProductDetailsView,
    //     builder: (context, state) => ProductDetailsView()),
    // GoRoute(path: kInventoryView, builder: (context, state) => InventoryView()),
    GoRoute(
        path: kPreviousSalesView,
        builder: (context, state) => PreviousSalesView()),
    GoRoute(
        path: kCurrentOrderView,
        builder: (context, state) => CurrentOrderView()),
    GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) => OrderDetailsView()),
    GoRoute(path: kQualityView, builder: (context, state) => QualityView()),
    GoRoute(
        path: kPreviousPurchasesView,
        builder: (context, state) => PreviousPurchasesView()),
    GoRoute(
        path: kPurchasesOrderDetails,
        builder: (context, state) => PurchasesOrderDetails()),
    GoRoute(
        path: kCurrentOrderPurchases,
        builder: (context, state) => CurrentOrderPurchases()),
        GoRoute(
        path: kAllShipmentsView,
        builder: (context, state) => AllShipmentsView()),
  ]);
}
