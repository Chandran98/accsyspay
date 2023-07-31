// import 'dart:io';
// import 'package:Accsys_Pay/pages/auth/register/registerScreen.dart';
// import 'package:Accsys_Pay/pages/screens.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../../MainApp/constant/constant.dart';

// class Login extends StatefulWidget {
//   const Login({Key key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   double height, width;
//   String isSelected = 'login';
//   bool password = true;
//   bool psw = true;
//   bool confirmPsw = true;
//   DateTime currentBackPressTime;

//   @override
//   Widget build(BuildContext context) {
      

//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () async {
//         bool backStatus = onWillPop();
//         if (backStatus) {
//           exit(0);
//         }
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: orangeColor,
//         body: SizedBox(
//           height: height,
//           child: Stack(
//             children: [
//               Positioned(
//                 bottom: 0.0,
//                 child: bgImage(),
//               ),
//               centerContainer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       Fluttertoast.showToast(
//         msg: 'Press Back Once Again to Exit.',
//         backgroundColor: blackColor,
//         textColor: whiteColor,
//       );
//       return false;
//     } else {
//       return true;
//     }
//   }

//   bgImage() {
//     return SizedBox(
//       height: height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: height * 0.42,
//             width: width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/bg2.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             height: 180,
//             width: width,
//             alignment: Alignment.bottomCenter,
//             padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
//             decoration: const BoxDecoration(
//               color: whiteColor,
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(45), topLeft: Radius.circular(45)),
//             ),
//             child: Image.asset(
//               'assets/logo1.png',
//               height: 55,
//               width: 130,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   centerContainer() {
//     return Positioned(
//       top: 40,
//       bottom: 100,
//       left: 20,
//       right: 20,
//       child: Container(
//         margin: const EdgeInsets.only(top: fixPadding * 3.0),
//         padding: const EdgeInsets.fromLTRB(
//           fixPadding * 2.0,
//           fixPadding * 2.0,
//           fixPadding * 2.0,
//           fixPadding * 2.0,
//         ),
//         decoration: BoxDecoration(
//           color: whiteColor,
//           borderRadius: BorderRadius.circular(50),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 2),
//               color: blackColor.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 2,
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             tabBar(),
//             isSelected == 'login' ? loginDetail() : registerDetail(),
//           ],
//         ),
//       ),
//     );
//   }

//   tabBar() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//         fixPadding * 2.0,
//         fixPadding * 1.5,
//         fixPadding * 2.0,
//         fixPadding,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: () {
//               setState(() {
//                 isSelected = 'login';
//               });
//             },
//             child: Text(
//               'Login',
//               style: isSelected == 'login'
//                   ? PrimaryColor25ExtraBoldTextStyle
//                   : grey25ExtraBoldTextStyle,
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 isSelected = 'register';
//               });
//             },
//             child: Text(
//               'Register',
//               style: isSelected == 'register'
//                   ? PrimaryColor25ExtraBoldTextStyle
//                   : grey25ExtraBoldTextStyle,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   loginDetail() {
//     return Column(
//       children: [
//         Text(
//           'Welcome Back',
//           style: black20BoldTextStyle,
//         ),
//         Text(
//           'We’re happy to see you again',
//           style: grey16SemiBoldTextStyle,
//         ),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         mobileNumberTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         passwordTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         loginButton(),
//         heightSpace,
//         heightSpace,
//         Row(
//           children: [
//             Text(
//               'Don’t have an account? ',
//               style: black18SemiBoldTextStyle,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   isSelected = 'register';
//                 });
//               },
//               child: Text(
//                 'Register Now',
//                 style: PrimaryColor17SemiBoldTextStyle,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   mobileNumberTextField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         keyboardType: TextInputType.phone,
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.phone_android,
//             color: greyColor,
//             size: 20,
//           ),
//           hintText: 'Mobile Number',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   passwordTextField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [
//               BoxShadow(
//                 color: blackColor.withOpacity(0.1),
//                 spreadRadius: 1.2,
//                 blurRadius: 1.2,
//               ),
//             ],
//           ),
//           child: TextField(
//             obscureText: password,
//             cursorColor: PrimaryColor,
//             style: black18SemiBoldTextStyle,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(
//                 Icons.lock,
//                 color: greyColor,
//                 size: 20,
//               ),
//               suffixIcon: InkWell(
//                 onTap: () {
//                   setState(() {
//                     password = !password;
//                   });
//                 },
//                 child: Icon(
//                   password ? Icons.visibility : Icons.visibility_off,
//                   color: greyColor,
//                   size: 15,
//                 ),
//               ),
//               hintText: 'Password',
//               hintStyle: grey18SemiBoldTextStyle,
//               border: const UnderlineInputBorder(borderSide: BorderSide.none),
//             ),
//           ),
//         ),
//         heightSpace,
//         Text(
//           'Forget password?',
//           style: PrimaryColor14ExtraBoldTextStyle,
//         ),
//       ],
//     );
//   }

//   loginButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         InkWell(
//           borderRadius: BorderRadius.circular(5.0),
//           onTap: () => Navigator.push(
//             context,
//             PageTransition(
//               child: const Verification(),
//               type: PageTransitionType.rightToLeft,
//             ),
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.width - 120,
//             padding: const EdgeInsets.all(fixPadding * 1.2),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: PrimaryColor,
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: [
//                 BoxShadow(
//                   color: PrimaryColor.withOpacity(0.4),
//                   spreadRadius: 2,
//                   blurRadius: 2,
//                 ),
//               ],
//             ),
//             child: Text(
//               'Login',
//               style: white22BoldTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   registerDetail() {
//     return Column(
//       children: [
//         Text(
//           'Welcome to Digital Paymentt',
//           style: black20BoldTextStyle,
//         ),
//         Text(
//           'Let’s create your account',
//           style: grey16SemiBoldTextStyle,
//         ),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         nameTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         emailTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         phoneNumberTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         createPswTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         confirmPswTextField(),
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         heightSpace,
//         registerButton(),
//         heightSpace,
//         heightSpace,
//         Row(
//           children: [
//             Text(
//               'Already have an account? ',
//               style: black18SemiBoldTextStyle,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   isSelected = 'login';
//                 });
//               },
//               child: Text(
//                 'Login Now',
//                 style: PrimaryColor18SemiBoldTextStyle,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   nameTextField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.person,
//             color: greyColor,
//             size: 20,
//           ),
//           hintText: 'Full Name',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   emailTextField() {
//     return 
//     Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         keyboardType: TextInputType.emailAddress,
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.email,
//             color: greyColor,
//             size: 20,
//           ),
//           hintText: 'Email Address',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   phoneNumberTextField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         keyboardType: TextInputType.phone,
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.phone_android,
//             color: greyColor,
//             size: 20,
//           ),
//           hintText: 'Mobile Number',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   createPswTextField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         obscureText: psw,
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.lock,
//             color: greyColor,
//             size: 20,
//           ),
//           suffixIcon: InkWell(
//             onTap: () {
//               setState(() {
//                 psw = !psw;
//               });
//             },
//             child: Icon(
//               psw ? Icons.visibility : Icons.visibility_off,
//               color: greyColor,
//               size: 15,
//             ),
//           ),
//           hintText: 'Create Password',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   confirmPswTextField() {
//     return Container(
//       decoration: BoxDecoration(
//         color: whiteColor,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: blackColor.withOpacity(0.1),
//             spreadRadius: 1.2,
//             blurRadius: 1.2,
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: TextEditingController(),
//         obscureText: confirmPsw,
//         cursorColor: PrimaryColor,
//         style: black18SemiBoldTextStyle,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.lock,
//             color: greyColor,
//             size: 20,
//           ),
//           suffixIcon: InkWell(
//             onTap: () {
//               setState(() {
//                 confirmPsw = !confirmPsw;
//               });
//             },
//             child: Icon(
//               confirmPsw ? Icons.visibility : Icons.visibility_off,
//               color: greyColor,
//               size: 15,
//             ),
//           ),
//           hintText: 'Confirm Password',
//           hintStyle: grey18SemiBoldTextStyle,
//           border: const UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }

//   registerButton() {
//     return 
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         InkWell(
//           borderRadius: BorderRadius.circular(5.0),
//           onTap: () {
//             // _registerProvider.register(name, email, phone, password, confirmPassword, context) 
//               Navigator.push(
//             context,
//             PageTransition(
//               child:  RegisterScreen(),
//               type: PageTransitionType.rightToLeft,
//             ),
//           );
//          },
//        child: Container(
//             width: MediaQuery.of(context).size.width - 120,
//             padding: const EdgeInsets.all(fixPadding * 1.2),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: PrimaryColor,
//               borderRadius: BorderRadius.circular(5),
//               boxShadow: [
//                 BoxShadow(
//                   color: PrimaryColor.withOpacity(0.4),
//                   spreadRadius: 2,
//                   blurRadius: 2,
//                 ),
//               ],
//             ),
//             child: Text(
//               'Register',
//               style: white22BoldTextStyle,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
