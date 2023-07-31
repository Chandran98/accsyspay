import 'dart:async';
import 'dart:io';
import 'package:Accsys_Pay/MainApp/pages/auth_screen/login.dart';

import 'package:Accsys_Pay/pages/screens.dart';
import 'package:provider/provider.dart';

import '../../MainApp/constant/constant.dart';
import '../MainApp/pages/main_screen.dart';
import '../MainApp/provider/auth_provider.dart';
import 'auth/login/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final PrefService prefService = PrefService();

  @override
  void initState() {
    prefService.getstatus("status").then((value) async {
      var data = await prefService.getUserId("user_id");

      setState(() {
        Provider.of<AuthProvider>(context, listen: false);
      });
      print(value);
      if (value == "success") {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MainScreen()))));
      } else {
        return Timer(
            const Duration(seconds: 2),
            (() => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginScreen()))));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage(
            'assets/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: WillPopScope(
        onWillPop: () => exit(0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/logo.png',
              // height: 109,
              width: 270,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
