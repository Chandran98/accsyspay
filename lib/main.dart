// ignore_for_file: prefer_const_constructors

import 'package:Accsys_Pay/MainApp/pages/splash_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/banner_provider.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/Theme/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'MainApp/pages/bus_booking/bus_screen/1_search_cities.dart';
import 'MainApp/provider/bus_provider.dart';
import 'MainApp/provider/dth_provider.dart';
import 'MainApp/provider/recharge_provider.dart';
import 'MainApp/provider/service_history_provider.dart';
import 'MainApp/provider/utilty_provider.dart';
import 'MainApp/provider/wallet_provider.dart';
import 'MainApp/utils/Internet connectivity/connectivity.dart';
import 'MainApp/utils/notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.title);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  NotificationService().initNotification();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => RechargeProvider()),
      ChangeNotifierProvider(create: (context) => WalletProvider()),
      ChangeNotifierProvider(create: (context) => BannerProvider()),
      ChangeNotifierProvider(create: (context) => UtilityProvider()),
      ChangeNotifierProvider(create: (context) => ServiceHistoryProvider()),
      ChangeNotifierProvider(create: (context) => DthProvider()),
      ChangeNotifierProvider(create: (context) => BusBookingProvider()),
      StreamProvider<ConnectivityStatus>(
          create: (_) => ConnectivityService().streamController.stream,
          initialData: ConnectivityStatus.Offline)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // const MyApp({Key key}) : super(key:5 key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).darkTheme
              ? darkMode
              : lightMode,
          // home: Jokeer());
          // home: const SearchCities());
          home: SplashScreen());
    });
  }
}
// 88D8DKQB