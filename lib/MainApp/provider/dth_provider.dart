// ignore_for_file: avoid_print, non_constant_identifier_names, missing_return

import 'dart:convert';
import 'package:Accsys_Pay/pages/screens.dart';
import "package:http/http.dart" as http;
import 'package:lottie/lottie.dart';
import '../Models/DthModal/dth_Account_modal.dart';
import '../Models/DthModal/dth_plan_modal.dart';
import '../Models/prepaid_plan_modals.dart';
import '../pages/main_screen.dart';
import '../pages/recharge/dth_screens/3_dth_account_info.dart';
import '../utils/alertDialogBox/payment_alert_dialog_box.dart';
import '../utils/hover_message.dart';
import '../constant/app_url.dart';
import 'package:flutter/foundation.dart';

import '../utils/notification_service.dart';
import 'auth_provider.dart';

class DTHOperator {
  final int id;
  final String name;

  DTHOperator({this.id, this.name});
}

class DthProvider with ChangeNotifier {
  List<DthPlanModal> _dthPlan = [];
  List<DthPlanModal> get dthPlan => _dthPlan;
  String _dthAccount = '';
  get dthAccount => _dthAccount;

  DthAccountModal _dthAccountDetails;
  DthAccountModal get dthAccountDetails => _dthAccountDetails;
  String _operatorId = '';
  get operatorId => _operatorId;

  String _rechargeMessage = "";
  get rechargeMessage => _rechargeMessage;

  String _rechargeStatus = "";
  get rechargeStatus => _rechargeStatus;
  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<List<DTHOperator>> getAllDTHOperators() async {
    final apiUrl = AppURl.dthOperatorList;
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final List<DTHOperator> operators = data.map((item) {
          return DTHOperator(
            id: item['id'],
            name: item['name'],
          );
        }).toList();

        return operators;
      } else {
        Utils.toastMessage('Failed to fetch DTH operators');
      }
    } catch (error) {
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<DthAccountModal> dthAccountInfo(operatorId, accountId, context) async {
    final apiUrl = AppURl.fetchDthAcc;
    final body = {"operator": operatorId, "account": accountId};
    _dthAccount = accountId;
    _operatorId = operatorId;
    print(body);
    setLoading(true);
    try {
      print("body3");
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        print("boday3");
        setLoading(false);
        print(323);
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        var data = DthAccountModal.fromJson(jsonData);
        print(data);
        data.status == "success"
            ? _dthAccountDetails = data
            : Utils.toastMessage('Failed- Please try again');
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const DthAccountInfoPage()));

        notifyListeners();
        print("body3");
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to DTH Plan');
      }
    } catch (e) {
      setLoading(false);

      print('Failed to connect to server: $e');
      Utils.toastMessage('Failed to connect to server ');
    }
  }

  Future<DthPlanModal> dthFetchPlan(operator) async {
    final apiUrl = AppURl.fetchDthPlan;
    final body = {"operator": operator};

    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      List<DthPlanModal> loadData = [];
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var data = DthPlanModal.fromJson(jsonData);

        for (var i = 0; i < data.details.length; i++) {
          loadData.add(data);
        }
        _dthPlan = loadData;

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to DTH Plan');
      }
    } catch (e) {
      setLoading(false);

      print('Failed to connect to server: $e');
      Utils.toastMessage('Failed to connect to server ');
    }
  }

  Future<PayRechargeModal> payDthRecharge(amount, walletAmount, voucherAmount,
      voucherCode, voucherPin, context) async {
    final apiUrl = AppURl.payDthRecharge;
    final PrefService prefService = PrefService();
    var userId = await prefService.getUserId("userid");
    var code = voucherCode == "" ? "0" : voucherCode;
    final body = {
      'account': dthAccount,
      "operator": operatorId,
      "amount": amount,
      "wallet_amount": walletAmount,
      "voucher_amount": voucherAmount ?? "0",
      "voucher_code": code,
      "voucher_pin": voucherPin,
      "user_id": userId,
    };

    print("body");

    print(body);
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      print(324);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(33423);
        print(jsonData);
        var data = PayRechargeModal.fromJson(jsonData);
        _rechargeMessage = data.message.toString();
        _rechargeStatus = data.status.toString();
        _rechargeStatus == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: _rechargeMessage,
                    lottie: SizedBox(
                        height: 150,
                        child: Lottie.asset("assets/lottie/error.json")),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  );
                })
            : {showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: _rechargeMessage,
                    lottie: Lottie.asset("assets/lottie/pays.json"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MainScreen()));
                    },
                  );
                }),  NotificationService().showNotification(
            title: 'Bill Payment',
            body: 'You have successfully billed $amount INR to your DTH $dthAccount')};

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed - Please try again');
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }
}
