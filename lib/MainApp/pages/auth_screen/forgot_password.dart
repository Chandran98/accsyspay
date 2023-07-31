// ignore_for_file: missing_return

import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/MainApp/pages/setting_screen/faq_screen.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../../provider/auth_provider.dart';
import '../../utils/main_app_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    var provider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    InkWell(child: const Icon(Icons.info))
                  ],
                ),
              ),
              spacer30Height,
              Text(
                "Reset password",
                style: GoogleFonts.inter(
                    fontSize: 17.sp, fontWeight: FontWeight.w700),
              ),
              spacer20Height,
              Text(
                "Enter the email associated with your account and we'll send an email with instructions to reset your password",
                style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              spacer30Height,
              Form(
                key: _emailkey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: PrimaryColor),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid Email';
                    }
                  },
                ),
              ),
              spacer30Height,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (_emailkey.currentState.validate()) {
                      authProvider.forgotPassword(
                          _emailController.text, context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: provider.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: white,
                          ))
                        : Center(
                            child: Text(
                            'Submit',
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600),
                          )),
                    height: 6.5.h,
                    width: double.infinity,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotOTPVerificationScreen extends StatefulWidget {
  const ForgotOTPVerificationScreen({Key key}) : super(key: key);

  @override
  State<ForgotOTPVerificationScreen> createState() =>
      _ForgotOTPVerificationScreenState();
}

class _ForgotOTPVerificationScreenState
    extends State<ForgotOTPVerificationScreen> {
  final otpController = TextEditingController();
  GlobalKey<FormState> _otpkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => FaqScreen()));
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
                "We have send you a one-time \n password to mail. Please check it your email",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 10.sp)),
            spacer40Height,
            Form(
              key: _otpkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: PrimaryColor),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'OTP',
                  ),
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
            InkWell(
              onTap: () {
                // otpCheck(otpController.text);
                provider.forgotPasswordVerifyOtp(otpController.text, context);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width - 65,
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
                  child: provider.loading
                      ? const CircularProgressIndicator(
                          color: white,
                        )
                      : Text(
                          'Submit',
                          style: white20BoldTextStyle,
                        )),
            )
          ],
        ),
      )),
    );
  }
}

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => FaqScreen()));
                          },
                          child: const Icon(Icons.info))
                    ],
                  ),
                ),
                spacer30Height,
                Text(
                  "Create New password",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                spacer20Height,
                Text(
                  "Your new password must be different from previous used passwords",
                  style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                spacer40Height,
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter New Password';
                            }
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'New Password',
                          ),
                          controller: _newPasswordController,
                        ),
                        spacer10Height,
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Confirm Password';
                            }
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                          controller: _confirmPasswordController,
                        ),
                      ],
                    )),
                spacer50Height,
                InkWell(
                  onTap: () {
                    // if (_emailController.text ==
                    //     authProvider.forgotOtpEmail) {
                    if (_formKey.currentState.validate()) {
                      if (_newPasswordController.text.isEmpty &&
                          _confirmPasswordController.text.isEmpty) {
                        Utils.toastMessage("Please fill your Above Section");
                      } else if (_newPasswordController.text !=
                          _confirmPasswordController.text) {
                        Utils.toastMessage(
                            "New password and Confirm password doesn't match");
                      } else if (_newPasswordController.text ==
                          _confirmPasswordController.text) {
                        authProvider.updatePassword(
                            _confirmPasswordController.text, context);
                      }
                    }
                    // } else {
                    //   Utils.toastMessage("Please enter valid Email Id");
                    // }
                  },
                  child: Container(
                    child: authProvider.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: white,
                          ))
                        : Center(
                            child: Text(
                            'Submit',
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          )),
                    height: 6.5.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
