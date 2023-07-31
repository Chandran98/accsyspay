import 'dart:async';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../Theme/colors/colors.dart';
import 'auth_screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PrefService prefService = PrefService();

  @override
  void initState() {
    prefService.getstatus("status").then((value) async {
      var data = await prefService.getUserId("user_id");
      var name = await prefService.getUserId("name");
      var email = await prefService.getUserId("email");
      print(name);
      print(email);
      setState(() {
        Provider.of<AuthProvider>(context, listen: false);
      });
      print(value);
      if (value == "success") {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const MainScreen()))));
      } else {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()))));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: appColor,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft, colors: [app3Color, appColor]),
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/images/logo/Vpay_white.png',
          //   ),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Image.asset(
            'assets/images/logo/accsys_black.png',
          ),
        ),
        // child: WillPopScope(
        //   onWillPop: () => exit(0),
        //   child: Scaffold(
        //     backgroundColor: appColor,
        //     body: Container(
        //       alignment: Alignment.center,
        //       child: Image.asset(
        //         'assets/images/logo/splash.png',
        //         width: 650,
        //         // fit: BoxFit.contain,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
