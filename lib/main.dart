import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routter,
      debugShowCheckedModeBanner: false,
    );
  }
}
