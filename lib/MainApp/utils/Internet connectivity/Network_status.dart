import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../constant/colors/colors.dart';
import 'connectivity.dart';

class NetworkSensitive extends StatelessWidget {
  final double opacity;
  final Widget child;
  NetworkSensitive({this.child, this.opacity = 1});
// ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    var connectionstatus = Provider.of<ConnectivityStatus>(context);

    if (connectionstatus == ConnectivityStatus.Wifi) {
      return child;
    }
    if (connectionstatus == ConnectivityStatus.Mobile) {
      return child;
    }

    return SafeArea(
      child: Container(
        // color: white,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              // color: Colors.green,
              height: 300,
              width: 300,
              // child: Image.asset("assets/images/wifioff.jpg")
              child: Lottie.asset("assets/lottie/otp.json"),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            spacer20Height,
            Text(
              "No internet Connection \n  Check your internet connection and try again",
              textAlign: TextAlign.center,
              // style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: black),
            ),
          ],
        ),
      ),
    );
  }
}
