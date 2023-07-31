// import 'package:Accsys_Pay/models/register_mdoel.dart';
// import 'package:Accsys_Pay/MainApp/pages/verficationscreen.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../../utils/button/custom_button.dart';
// import '../../../utils/hover_message.dart';
// import '../../../utils/textbox/text_fields.dart';

// class RegisterScreen extends StatefulWidget {
//   // const RegisterScreen({});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 58.0),
//             child: Form(
//               // key: _formkey,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   TextFields(
//                     name: "Name",
//                     icon: Icons.abc,
//                     textEditingController: nameController,
//                   ),
//                   TextFields(
//                     name: "email",
//                     icon: Icons.email,
//                     textEditingController: emailController,
//                   ),
//                   TextFields(
//                     name: "Mobile",
//                     icon: Icons.phone_android,
//                     textEditingController: mobileController,
//                   ),
//                   TextFields(
//                     name: "Password",
//                     icon: Icons.password,
//                     textEditingController: passwordController,
//                   ),
                  
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   InkWell(
//                       onTap: () {
//                         // otpCheck(emailController.text,mobileController.text);
//                         // register(
//                         //   nameController.text,
//                         //   emailController.text,
//                         //   mobileController.text,
//                         //   passwordController.text,
//                         // );
//                       },
//                       child: CustomButton(
//                         name: "Register",
//                       )
//                       // Container(child: Text("submit")),
//                       )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }

//   // register(name, email, mobile, password) async {
//   //   print(name);
//   //   print(mobile);
//   //   const String url =  "https://accsyspay.com/api/registerUser";
//   //   var response = await http.post(Uri.parse(url), body: {
//   //     "name": name,
//   //     "email": email,
//   //     "mobile": mobile,
//   //     "password": password,
//   //   });
//   //   print(response.body);
//   //   if (response.statusCode == 200) {
//   //     otpCheck(email, mobile);
//   //     //  login(email, mobile);
//   //   } else {
//   //     print(response);
//   //     print("failed");
//   //   }
//   // }

//   // Future <OtpCheck>otpCheck(email, mobile) async {
//   //   const String url = "https://accsyspay.com/api/sendCode";
//   //   var response = await http.post(Uri.parse(url), body: {
//   //     "email": email,
//   //     "mobile": mobile,
//   //     "token": "wr0k6xqvmofj",
//   //   });
//   //   print(response.body);
//   //   if (response.statusCode == 200) {
      
      
//   //     Utils.toastMessage("Submitted successfully");
//   //     Navigator.of(context)
//   //         .push(MaterialPageRoute(builder: (context) => VerificationScreen()));
//   //     print(response);
//   //   } else {
      
//   //     Utils.toastMessage("Submitted successfully");
//   //     Navigator.of(context)
//   //         .push(MaterialPageRoute(builder: (context) => VerificationScreen()));
//   //   }
//   // }

// // Future<OtpCheck> login(email, mobile) async {
// //   const String url = "https://accsyspay.com/api/sendCode";
// //     try {
// //       Response response;
// //       var dio = Dio();
// //       response = await dio.post(url, queryParameters: {
// //        "email": email,
// //       "mobile": mobile,
// //       "token": "oheeg3psga2v",
// //       });
// //       if (response.statusCode == 200) {
        
// //         var res = response.data;

// //      OtpCheck   otpCheck = OtpCheck.fromJson(res);
// //         // _customerId = loginmodel.customerId;
// //        String _status = otpCheck.status;

// //         if (otpCheck.status == true) {
       
// //         } else {
// //           print("Invalid credentials");
// //           // Utils.toastmessage("Invalid credentials");
// //         }

// //         // Utils.toastmessage(response.data.toString());
// //       } else {
// //         // Utils.toastmessage("Invalid credentials");
        
// //           print("Invalid credentials");
// //       }
// //     } catch (e) {
     
     
// //       print(e.toString());
// //     }

// // }
// }