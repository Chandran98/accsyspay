// import 'package:Accsys_Pay/MainApp/pages/verficationscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import '../../../MainApp/provider/auth_provider.dart';
// import '../../../utils/button/custom_button.dart';
// import '../../../utils/hover_message.dart';
// import '../../../utils/textbox/text_fields.dart';
// import '../../home/home.dart';

// class Loginscreen extends StatefulWidget {
//   // const Loginscreen({});

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
  

//   @override
//   Widget build(BuildContext context) {
    
//     var loginProvider = Provider.of<AuthProvider>(context);
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
//                     name: "email",
//                     icon: Icons.email,
//                     textEditingController: emailController,
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
//                         loginProvider.login(emailController.text, passwordController.text, context);
//                         // otpcheck();
//                         // login(
//                         //   emailController.text,
//                         //   passwordController.text,
//                         // );
//                       },
//                       child: CustomButton(
//                         name: "Login",
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

//   login(email,  password) async {
//     const String url =  "https://accsyspay.com/api/loginUser";
//     var response = await http.post(Uri.parse(url), body: {
    
//       "email": email,
//       "password": password,
//     });
//     print(response.body);
//     if (response.statusCode == 200) {
      
//       Utils.toastMessage("logged-in successfully");
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => const Home()));
     
//     } else {
//       Utils.toastMessage("Invalid-credentials");
//       print(response);
//       print("failed");
//     }
//   }

// }
