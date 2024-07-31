import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController _skuController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _skuController,
//               decoration: InputDecoration(
//                 labelText: 'SKU',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 _skuController.clear();
//                 // فتح صفحة ماسح الباركود وانتظار النتيجة
//                 final scannedSku = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => QRViewExample()),
//                 );
//                 // إذا كانت النتيجة غير null، قم بتحديث TextField
//                 if (scannedSku != null) {
//                   _skuController.text = scannedSku;
//                 }
//               },
//               child: Text('Scan Barcode'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

 class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..repeat(reverse: true);
    _animation = Tween<double>(begin:150, end: 500).animate(_animationController!);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        controller!.pauseCamera();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        controller!.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text('Barcode Type: ${result!.format}   Data: ${result!.code}')
                      : Text('Scan a code'),
                ),
              )
            ],
          ),
          AnimatedBuilder(
            animation: _animation!,
            builder: (context, child) {
              return Positioned(
                top: _animation!.value,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Container(
                  height: 2,
                  color: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      // يمكنك معالجة بيانات QR هنا للحصول على SKU
      String? sku = scanData.code;
      print('Scanned SKU: $sku');
      // إرجاع النتيجة إلى الصفحة السابقة
      Navigator.pop(context, sku);
      controller.pauseCamera();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    _animationController?.dispose();
    super.dispose();
  }
}