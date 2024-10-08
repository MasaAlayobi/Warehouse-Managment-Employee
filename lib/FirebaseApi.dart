
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FirebaseApi{
 final notificationSettings =  FirebaseMessaging.instance.requestPermission(provisional: true);
  Future  <void> initNotiification()async{ 
    FirebaseMessaging.instance.requestPermission();
    try{
   final apnsToken = await FirebaseMessaging.instance.getToken();
      storage.get<SharedPreferences>().setString('deviceToken',apnsToken.toString());
 if (apnsToken != null) {
 print('token+$apnsToken');
 initPushNotification();
 }
    }catch(e){
      storage.get<SharedPreferences>().setString('deviceToken','there is no token');
      print(storage.get<SharedPreferences>().getString('deviceToken'));
       print("Error getting token: $e");
    }
  } 
void handleMessage(RemoteMessage? message ){
  if (message ==null) return;
  else{
AppRouter.routter.go(AppRouter.kHomeView);
  // NavigatorKey.currentState?.pushNamed(AppRouter.KNotification);
  }
 
 }
 Future initPushNotification()async{
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
 }
}
// void _getToken() async {
//   try {
//     String? token = await FirebaseMessaging.instance.getToken();
//     setState(() {
//       _token = token;
//     });
//     print("Firebase Messaging Token: $_token");
//   } catch (e) {
//     print("Error getting token: $e");
//   }
// }