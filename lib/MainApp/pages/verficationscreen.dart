// ignore_for_file: missing_return

import 'dart:convert';
import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/app_bar.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../utils/main_app_utils.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
          // backgroundColor: orangeColor,
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomAppBar(
                title: "",
              ),
              Lottie.asset("assets/lottie/otp2.json",
                  fit: BoxFit.cover, width: 250),
              spacer5Height,
              Text("OTP Verification", style: headerstyle),
              spacer20Height,
              Text(
                  "We have send you a one-time password to ${provider.useremail}. Please check it your email",
                  textAlign: TextAlign.center,
                  style: textstyle),
              spacer40Height,
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your OTP';
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'OTP',
                    ),
                    controller: otpController,
                  ),
                ),
              ),
              spacer40Height,
              InkWell(
                onTap: () {
                  // otpCheck(otpController.text);
                  if (_formKey.currentState.validate()) {
                    provider.verifyOtp(otpController.text, context);
                  }
                },
                child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    padding: const EdgeInsets.all(fixPadding * 1.2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: PrimaryColor.withOpacity(0.4),
                      //     spreadRadius: 2,
                      //     blurRadius: 2,
                      //   ),
                      // ],
                    ),
                    child: provider.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: white,
                          ))
                        : Center(
                            child: Text(
                              'Submit',
                              style: white20BoldTextStyle,
                            ),
                          )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
