import 'package:Accsys_Pay/MainApp/Theme/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/pages/auth_screen/register.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/pages/auth/register/registerScreen.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sizer/sizer.dart';
import '../../constant/colors/colors.dart';
import '../../provider/auth_provider.dart';
import '../../provider/themeprovider.dart';
import '../../utils/background.dart';
import '../../utils/textfield.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  bool rememberMe = false;
  bool _hidden = false;

  final _emailNode = FocusNode();
  final _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var loginProvider = Provider.of<AuthProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
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
                        "Sign In",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                            fontSize: 31.sp),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Please sign in to continue",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 11.sp),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Form(
                    key: _formKeyLogin,
                    child: Column(
                      children: [
                        // Container(
                        //   alignment: Alignment.center,
                        //   margin: const EdgeInsets.symmetric(horizontal: 40),
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         suffixIcon: IconButton(
                        //             onPressed: () {
                        //               setState(() {
                        //                 _hidden = !_hidden;
                        //               });
                        //             },
                        //             icon: _hidden
                        //                 ? const Icon(
                        //                     CupertinoIcons.eye_slash,
                        //                     color: appColor,
                        //                   )
                        //                 : const Icon(
                        //                     CupertinoIcons.eye_fill,
                        //                     color: appColor,
                        //                   )),
                        //         // focusedBorder: const OutlineInputBorder(
                        //         //   borderSide: BorderSide(color: appColor),
                        //         // ),
                        //         // border: const OutlineInputBorder(),
                        //         labelText: 'Password',
                        //         labelStyle: TextStyle(color: appColor),
                        //         hintText: "*********"),
                        //     controller: passwordController,
                        //     focusNode: _emailNode,
                        //     obscureText: _hidden,
                        //     // ignore: missing_return
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Please enter Valid Email';
                        //       }
                        //     },
                        //   ),
                        // ),
                        spacer10Height,
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
                              controller: emailController,
                            )),
                        spacer20Height,
                        // spacer20Height,
                        // Container(
                        //     alignment: Alignment.center,
                        //     margin: const EdgeInsets.symmetric(horizontal: 40),
                        //     child: CustomPasswordTextField(
                        //       isValidator: true,
                        //       hintTxt: "****",
                        //       textInputAction: TextInputAction.done,
                        //       fillColor:
                        //           themeProvider.darkTheme ? black : white,
                        //       focusNode: _passNode,
                        //       controller: passwordController,
                        //     )),

                        spacer10Height,
                        spacer5Height,
                        // Container(
                        //   alignment: Alignment.center,
                        //   margin: const EdgeInsets.symmetric(horizontal: 40),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text(" "),
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (_) =>
                        //                       const ForgotPasswordScreen()));
                        //         },
                        //         child: Text(
                        //           "Forgot Password?",
                        //           style: GoogleFonts.inter(
                        //               color: appColor,
                        //               fontWeight: FontWeight.w700),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
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
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  launch(
                                      "https://accsyspay.com/terms-conditions.html");
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'I agree with ',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Terms & Condition',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              color: appColor)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                spacer10Height,
                spacer5Height,
                // Container(
                //   alignment: Alignment.centerRight,
                //   margin:
                //       const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //   child: const Text(
                //     "Forgot your password?",
                //     style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                //   ),
                // ),
                // SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextButton(
                    onPressed: () {},
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    // textColor: Colors.white,
                    // padding: const EdgeInsets.all(0),
                    child: InkWell(
                      onTap: () {
                        if (rememberMe == false) {
                          Utils.toastMessage(
                              " Please Agree with Terms & Condition");
                        } else {
                          if (_formKeyLogin.currentState.validate()) {
                            loginProvider.login(emailController.text,
                                passwordController.text, context);
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 7.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: appColor,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: loginProvider.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: white,
                              ))
                            : Center(
                                child: Text(
                                  "Get OTP",
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't Have an Account?",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign up',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: appColor)),
                        ],
                      ),
                    ),
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
