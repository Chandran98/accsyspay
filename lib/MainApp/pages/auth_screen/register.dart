import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/pages/auth_screen/login.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/background.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Theme/colors/colors.dart';
import '../../provider/themeprovider.dart';
import '../../utils/main_app_utils.dart';
import '../../utils/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _formKeyRegister = GlobalKey<FormState>();
  bool rememberMe = false;

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var regProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.darkTheme ? white : black,
                            fontSize: 30.sp),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Please sign in to continue",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 10.sp),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Form(
                    key: _formKeyRegister,
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: CustomTextField(
                              validatorMessage: "Please enter username",
                              isValidator: true,
                              fillColor:
                                  themeProvider.darkTheme ? black : white,
                              hintText: "Name",
                              // focusNode: _emailNode,
                              // nextNode: _passNode,
                              textInputType: TextInputType.emailAddress,
                              controller: _nameController,
                            )),
                        SizedBox(height: size.height * 0.03),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: CustomTextField(
                              validatorMessage: "Please enter email-id",
                              isValidator: true,
                              fillColor:
                                  themeProvider.darkTheme ? black : white,
                              hintText: "Email",
                              // focusNode: _emailNode,
                              // nextNode: _passNode,
                              textInputType: TextInputType.emailAddress,
                              controller: _emailController,
                            )),
                        SizedBox(height: size.height * 0.03),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: CustomTextField(
                              validatorMessage: "Please enter Mobile no.",
                              isValidator: true,
                              fillColor:
                                  themeProvider.darkTheme ? black : white,
                              isPhoneNumber: true,
                              hintText: "Phone",
                              // focusNode: _emailNode,
                              // nextNode: _passNode,
                              textInputType: TextInputType.number,
                              controller: _mobileController,
                            )),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  // margin:
                                  //     const EdgeInsets.symmetric(horizontal: 40),
                                  child: CustomTextField(
                                    validatorMessage:
                                        "Please set Your 4 Digit Pin.",
                                    isValidator: true,
                                    fillColor:
                                        themeProvider.darkTheme ? black : white,
                                    isPhoneNumber: true,
                                    hintText: "Pin",
                                    // focusNode: _emailNode,
                                    // nextNode: _passNode,
                                    textInputType: TextInputType.number,
                                    controller: _passwordController,
                                  )),
                              spacer10Height,
                              const Text(
                                "* Please set your 4 Digit pin",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: rememberMe,
                                  activeColor: appColor,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = !rememberMe;
                                    });
                                  }),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text("I agree with Terms & Condition ")
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      if (rememberMe == false) {
                        Utils.toastMessage(
                            " Please Agree with Terms & Condition");
                      } else {
                        if (_formKeyRegister.currentState.validate()) {
                          if (_passwordController.text.length == 4) {
                            regProvider.register(
                                _nameController.text,
                                _emailController.text,
                                _mobileController.text,
                                _passwordController.text,
                                context);
                          } else {
                            Utils.toastMessage("Only 4 Digit Pin is allowed");
                          }
                        }
                      }
                    },
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    // textColor: Colors.white,
                    // padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 7.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: regProvider.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: white,
                            ))
                          : Center(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.inter(
                                    color: white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()))
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already Have an Account?",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.sp,
                            color: black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign in',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  color: appColor)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
