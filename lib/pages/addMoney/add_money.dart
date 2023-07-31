// import 'dart:convert';

// import 'package:Accsys_Pay/api/walletnot.dart';
// import 'package:Accsys_Pay/pages/screens.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;
// import '../../MainApp/constant/colors/colors.dart';
// import '../../MainApp/constant/constant.dart';
// import '../../utils/button/custom_button.dart';
// import '../../utils/textbox/text_fields.dart';

// class AddMoney extends StatefulWidget {
//   const AddMoney({Key key}) : super(key: key);

//   @override
//   State<AddMoney> createState() => _AddMoneyState();
// }

// class _AddMoneyState extends State<AddMoney> {
//   final amountController = TextEditingController();

//   Razorpay _razorpay;

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, postWalletHistory);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   int paid = 0;

//   void openCheckout(amount) async {
//     RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
//     double money = double.parse(amount);
//     double tMoney = money * 100;
//     String stringMoney = tMoney.toString().replaceAll(regex, '');
//     int totalMoney = int.parse(stringMoney);
//     setState(() {
//       paid = totalMoney;
//     });
//     var options = {
//       'key': 'rzp_test_Vf233WNpQJub3B',
//       'amount': totalMoney,
//       'name': 'chandran',
//       'description': 'Payment',
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     _razorpay.open(options);
//     // try {
//     //   _razorpay.open(options);
//     // } catch (e) {
//     //   print(e.toString());
//     // }
//   }

//   postWalletHistory(PaymentSuccessResponse response) async {
//     final apiUrl = 'https://accsyspay.com/api/addWallet';
//     final body = {
//       "user_id": "22",
//       "amount": "789",
//       "description": "Razorpay-${response.paymentId}"
//     };

//     try {
//       final response = await http.post(Uri.parse(apiUrl), body: body);
//       print(response.body);
//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         print(jsonData);
//       } else {
//         throw Exception('Failed to load wallet history');
//       }
//     } catch (e) {
//       throw Exception('Failed to connect to server: $e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
//     Navigator.push(
//         context, MaterialPageRoute(builder: ((context) => Walletdot())));
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     Fluttertoast.showToast(
//       msg: "ERROR: " + response.code.toString() + " - " + response.message,
//     );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     Fluttertoast.showToast(
//       msg: "EXTERNAL_WALLET: " + response.walletName,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: PrimaryColor,
//         iconTheme: IconThemeData(color: white),
//         titleSpacing: 0,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: Text(
//           'Add Money',
//           // style: black20BoldTextStyle,
//         ),
//       ),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         // padding: const EdgeInsets.all(fixPadding * 2.0),
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 30.0),
//                 child: Text(
//                   'Enter Amount to be added',
//                   style: grey14SemiBoldTextStyle,
//                 ),
//               ),
//               TextFields(
//                 name: "100",
//                 textEditingController: amountController,
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           InkWell(
//               onTap: () {
//                 openCheckout(amountController.text);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: CustomButton(
//                   name: "Continue",
//                 ),
//               )),
//         ],
//       ),
//       // bottomNavigationBar: continueButton(context),
//     );
//   }

//   // amountTextField() {
//   //   return
//   // }

//   // continueButton(context) {
//   //   return Column(
//   //     mainAxisSize: MainAxisSize.min,
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
//   //         child: InkWell(
//   //           borderRadius: BorderRadius.circular(5.0),
//   //           onTap: () => Navigator.push(
//   //             context,
//   //             PageTransition(
//   //               child: const PaymentMethod(),
//   //               type: PageTransitionType.rightToLeft,
//   //             ),
//   //           ),
//   //           child: Container(
//   //             width: MediaQuery.of(context).size.width - 120,
//   //             padding: const EdgeInsets.all(fixPadding * 1.2),
//   //             alignment: Alignment.center,
//   //             decoration: BoxDecoration(
//   //               color: PrimaryColor,
//   //               borderRadius: BorderRadius.circular(5),
//   //               boxShadow: [
//   //                 BoxShadow(
//   //                   color: PrimaryColor.withOpacity(0.4),
//   //                   spreadRadius: 2,
//   //                   blurRadius: 2,
//   //                 ),
//   //               ],
//   //             ),
//   //             child: Text(
//   //               'Continue',
//   //               style: white22BoldTextStyle,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
// }
