// ignore_for_file: missing_return

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../../constant/colors/colors.dart';
import '../../provider/auth_provider.dart';
import '../../provider/themeprovider.dart';
import '../../utils/hover_message.dart';
import '../../utils/main_app_utils.dart';
import '../main_screen.dart';
import '../setting_screen/faq_screen.dart';

class LoginOTPVerificationScreen extends StatefulWidget {
  const LoginOTPVerificationScreen({Key key}) : super(key: key);

  @override
  State<LoginOTPVerificationScreen> createState() =>
      _LoginOTPVerificationScreenState();
}

class _LoginOTPVerificationScreenState
    extends State<LoginOTPVerificationScreen> {
  final otpController = TextEditingController();
  GlobalKey<FormState> _otpkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<AuthProvider>(context);

    loginOtpCheck(otp) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (otp != loginProvider.otpModal.message.toString()) {
        Utils.toastMessage("Invalid OTP - Please enter a valid OTP");
      }
      if (otp == loginProvider.otpModal.message.toString()) {
        pref.setString("status", loginProvider.otpModal.status);
        pref.setString("user_id", loginProvider.otpModal.userId.toString());
        pref.setString("mobile", loginProvider.otpModal.mobile.toString());
        pref.setString("name", loginProvider.otpModal.name.toString());
        pref.setString("email", loginProvider.otpModal.email.toString());

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const MainScreen()));
      }
    }

    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                height: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const FaqScreen()));
                        },
                        child: const Icon(Icons.info))
                  ],
                ),
              ),
            ),
            Lottie.asset("assets/lottie/otp2.json", width: 250),
            spacer5Height,
            Text("OTP Verification", style: headerstyle),
            spacer20Height,
            Text(
                "We have send you a one-time password to ${loginProvider.loginEmail}. Please check it your email",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 10.sp)),
            spacer40Height,
            Form(
              key: _otpkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PrimaryColor),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'OTP',
                      labelStyle: TextStyle(color: appColor)),
                  controller: otpController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid OTP';
                    }
                  },
                ),
              ),
            ),
            // TextFields(
            //   // name: "otp",
            //   textEditingController: otpController,
            // ),
            spacer30Height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _otpkey.currentState.validate()
                        ? loginOtpCheck(otpController.text)
                        : Utils.toastMessage("Enter your otp");
                  },
                  child: Container(
                      width: 38.w,
                      height: 6.5.h,
                      // padding: const EdgeInsets.all(fixPadding * 1.2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: PrimaryColor.withOpacity(0.4),
                            // spreadRadius: 2,
                            // blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: GoogleFonts.inter(
                            color: white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                ),
                // spacer10Height,
                InkWell(
                  onTap: () {
                    loginProvider.reLoginSendOtp(context);
                  },
                  child: Container(
                      width: 38.w,
                      height: 6.5.h,
                      // padding: const EdgeInsets.all(fixPadding * 1.2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: themeProvider.darkTheme
                            ? black.withOpacity(0.2)
                            : white,
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: PrimaryColor.withOpacity(0.4),
                        //     // spreadRadius: 2,
                        //     // blurRadius: 2,
                        //   ),
                        // ],
                      ),
                      child: loginProvider.loading
                          ? const CircularProgressIndicator(
                              color: appColor,
                            )
                          : Center(
                              child: Text(
                                'Resend OTP',
                                style: GoogleFonts.inter(
                                  color: appColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
