// ignore_for_file: avoid_print, non_constant_identifier_names, missing_return

import 'dart:convert';
import 'package:Accsys_Pay/MainApp/Models/razorpay_modal.dart';
import 'package:Accsys_Pay/MainApp/Models/wallet_history_model.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import "package:http/http.dart" as http;
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Models/auth_models/register_mdoel.dart';
import '../Models/utility_files/today_modal.dart';
import '../pages/main_screen.dart';
import '../utils/alertDialogBox/payment_alert_dialog_box.dart';
import '../utils/hover_message.dart';
import '../Models/Wallet_modal.dart';
import '../constant/app_url.dart';
import '../utils/notification_service.dart';
import 'auth_provider.dart';

class WalletProvider extends ChangeNotifier {
  String _handlingCharges = "";
  get handlingCharges => _handlingCharges;
  String _kaitPrice = "";
  get kaitPrice => _kaitPrice;

  String _balance;
  get balance => _balance;
  String _totalInflowAmount;
  get totalInflowAmount => _totalInflowAmount;
  String _totalOutflowAmount;
  get totalOutflowAmount => _totalOutflowAmount;

  List<WalletHistoryModel> _walletHistoryList = [];
  List<WalletHistoryModel> get walletHistoryList => _walletHistoryList;

  List<WalletHistoryModel> _walletInflowHistoryList = [];
  List<WalletHistoryModel> get walletInflowHistoryList =>
      _walletInflowHistoryList;
  List<WalletHistoryModel> _walletOutflowHistoryList = [];
  List<WalletHistoryModel> get walletOutflowHistoryList =>
      _walletOutflowHistoryList;

  String _voucherBalance = "";
  get voucherBalance => _voucherBalance;

  PaymentResponse _paymentResponse;
  get paymentResponse => _paymentResponse;

  String _voucherStatus = "";
  get voucherStatus => _voucherStatus;

  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  final PrefService prefService = PrefService();

  Future<WalletBalance> walletBalance() async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.walletBalance;
    final body = {'user_id': userId};

    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var data = WalletBalance.fromJson(jsonData);
        var datalength = data.balance.length > 8
            ? data.balance.substring(0, 8)
            : data.balance;
        _balance = datalength;

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet Balance');
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<VoucherCheck> voucherCheck(voucher, pin) async {
    final apiUrl = AppURl.voucherCheck;
    final body = {'voucher': voucher, "pin": pin};

    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        var data = VoucherCheck.fromJson(jsonData);

        _voucherBalance = data.balance.toString();
        _voucherStatus = data.status.toString();

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed - Please try again ');
      }
    } catch (e) {
      setLoading(false);
      // Utils.toastMessage('Failed to connect to server: $e');
      print('Failed to connect to server');
    }
  }

  cancelVocher() async {
    _voucherBalance = "0";
    notifyListeners();
  }

  Future<List<WalletHistoryModel>> postWalletHistory() async {
    var userId = await prefService.getUserId("userid");
    print(userId);
    final apiUrl = AppURl.walletHistory;
    final body = {'user_id': userId};

    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      print("userIdadsa");
      if (response.statusCode == 200) {
        setLoading(false);
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        final walletHistory = jsonData
            .map((history) => WalletHistoryModel.fromJson(history))
            .toList();

        final walletInflowHistory = walletHistory
            .where((element) => element.mode.toString() == "1")
            .toList();
        final walletOutflowHistory = walletHistory
            .where((element) => element.mode.toString() == "0")
            .toList();

        final TotalInflowAmount = walletHistory
            .where((element) => element.mode.toString() == "1")
            .map((e) => e.amount)
            .reduce((value, element) => (element + value));
        final TotalOutflowAmount = walletHistory
            .where((element) => element.mode.toString() == "0")
            .map((e) => e.amount)
            .reduce((value, element) => (element + value));
        _totalOutflowAmount = TotalOutflowAmount.floor().toString() == "null"
            ? "0"
            : TotalOutflowAmount.floor().toString();
        _totalInflowAmount = TotalInflowAmount.ceil().toString() == "null"
            ? "0"
            : TotalInflowAmount.ceil().toString();
        print("Inflow cash ${_totalOutflowAmount}");
        print("Outflow cash ${_totalInflowAmount}");

        _walletInflowHistoryList = walletInflowHistory;
        _walletOutflowHistoryList = walletOutflowHistory;
        _walletHistoryList = walletHistory;
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      setLoading(false);
      // throw Exception('Failed to connect to server: $e');
      print('Failed to connect to server: $e');
    }
  }

  Future<PaymentResponse> razorScanAndPay(upiId, amount, context) async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.razorScanPay;
    final body = {"user_id": userId, 'vpa': upiId, "amount": amount};
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        PaymentResponse data = PaymentResponse.fromJson(jsonData);
        _paymentResponse = data;
        _paymentResponse.status == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: _paymentResponse.message,
                    lottie: SizedBox(
                        height: 150,
                        child: Lottie.asset("assets/lottie/error.json")),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  );
                })
            : showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: _paymentResponse.message,
                    lottie: Lottie.asset("assets/lottie/pays.json"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MainScreen()));
                    },
                  );
                });

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed - Please try again ');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
    }
  }

  Future<Charges> getCharges() async {
    final url = Uri.parse(AppURl.charges);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        Charges data = Charges.fromJson(decodedResponse);
        _handlingCharges = data.charges.toString();

        notifyListeners();
      } else {
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<KaitModal> getKaitPrice() async {
    const appUrl =
        "https://bxnzaopdi.kairaaexchange.com/restapi/markets?market_pair=KAITCOIN_INR";
    final url = Uri.parse(appUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);

        KaitModal data = KaitModal.fromJson(decodedResponse);
        _kaitPrice = data.markets[0].lastPrice.toString();
        print(_kaitPrice);

        notifyListeners();
      } else {
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<OtpCheck> convertVoucher(voucher, pin, amount, context) async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.voucherToWallet;
    final body = {
      "voucher": voucher,
      "pin": pin,
      'user_id': userId,
      "amount": amount
    };
    print(body);

    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var data = OtpCheck.fromJson(jsonData);

        data.status == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: data.message,
                    lottie: SizedBox(
                        height: 150,
                        child: Lottie.asset("assets/lottie/error.json")),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  );
                })
            : {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return CustomAlertDialog(
                        message: data.message,
                        lottie: Lottie.asset("assets/lottie/pays.json"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MainScreen()));
                        },
                      );
                    }),
                NotificationService().showNotification(
                    title: 'ACCSYS To INR',
                    body:
                        'You have successfully converted $amount ACCSYS to INR')
              };

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet Balance');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
    }
  }
}
