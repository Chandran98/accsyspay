// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'auth_provider.dart';

// class RazorpayProvider extends ChangeNotifier {
//   Razorpay _razorpay;
//   bool _paymentSuccess = false;
//   bool _paymentError = false;
//   String _paymentErrorMessage = '';

//   String _amount = '';

//   bool get paymentSuccess => _paymentSuccess;
//   bool get paymentError => _paymentError;
//   String get paymentErrorMessage => _paymentErrorMessage;

//   RazorpayProvider() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, postWalletHistory);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   final PrefService prefService = PrefService();
//    openCheckout(amount) async {
//     print(1232123);
//     _amount = amount;
//     var name = await prefService.getname("name");
//     var options = {
//       'key': 'rzp_test_Vf233WNpQJub3B',
//       'amount': amount * 100,
//       'name': name,
//       'description': 'Payment for some random product',
//       // 'prefill': {'contact': '9876543210', 'email': 'customer@example.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
    
//       _razorpay.open(options);
//     // try {
//     //   _razorpay.open(options);
//     // } catch (e) {
//     //   print('Error: ${e.toString()}');
//     // }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     _paymentSuccess = true;
//     notifyListeners();
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     _paymentError = true;
//     _paymentErrorMessage = response.message;
//     notifyListeners();
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     debugPrint('External Wallet: ${response.walletName}');
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }

//   postWalletHistory(PaymentSuccessResponse response) async {
//     var userId = await prefService.getUserId("user_id");
//     print(userId);
//     final apiUrl = 'https://accsyspay.com/api/addWallet';
//     final body = {
//       "user_id": userId,
//       "amount": _amount,
//       "description": "Razorpay-${response.paymentId}"
//     };
//     print(body);

//     try {
//       final response = await http.post(Uri.parse(apiUrl), body: body);
//       print(response.body);
//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         print(jsonData);
//       } else {
//         print('Failed to load wallet history');
//       }
//     } catch (e) {
//       print('Failed to connect to server: $e');
//     }
//   }
// }
