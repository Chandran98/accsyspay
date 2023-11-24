// ignore_for_file: missing_return

import 'dart:convert';
import 'package:Accsys_Pay/MainApp/Models/prepaid_offer_modals.dart';
import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../pages/screens.dart';
import '../pages/recharge/mobile_pin_screen.dart';
import '../pages/recharge/plan_package/prepaidplan.dart';
import '../utils/alertDialogBox/Custom_alert_dialogbox.dart';
import "../Models/Operator_model.dart";
import '../Models/post_paid_model.dart';
import '../Models/prepaid_plan_modals.dart';
import '../Models/utility_files/today_modal.dart';
import '../Models/utility_files/utility_modal.dart';
import '../constant/app_url.dart';
import "package:http/http.dart" as http;
import '../pages/recharge/plan_package/plans_page.dart';
import '../pages/recharge/plan_package/post_paid_screen.dart';
import '../utils/alertDialogBox/payment_alert_dialog_box.dart';
import '../utils/notification_service.dart';
import 'auth_provider.dart';

class RechargeProvider extends ChangeNotifier {
  String _mobile = '';
  get mobile => _mobile;
  String _operatorId = '';
  get operatorId => _operatorId;
  String _postpaidStatus = '';
  get postpaidStatus => _postpaidStatus;

  Operator _fetchoperator;
  Operator get fetchoperator => _fetchoperator;

  PostpaidBillModal _postpaid;
  get postpaid => _postpaid;

  String _rechargeMessage = "";
  get rechargeMessage => _rechargeMessage;
  String _postPaidBillAmount = "";
  get postPaidBillAmount => _postPaidBillAmount;

  String _rechargeStatus = "";
  get rechargeStatus => _rechargeStatus;

  String _postPaidMobile = "";
  get postPaidMobile => _postPaidMobile;

  Charges _mobileCharges;
  get mobileCharges => _mobileCharges;

  List<dynamic> _mobileOperators = [];
  List<dynamic> get mobileOperators => _mobileOperators;

  List<PrepaidPlanOfferModal> _prepaidOffer = [];
  List<PrepaidPlanOfferModal> get prepaidOffer => _prepaidOffer;

  List<PackageDetails> _prepaidPlan = [];
  List<PackageDetails> get prepaidPlan => _prepaidPlan;

  List<dynamic> _mobileCircle = [];
  List<dynamic> get mobileCircle => _mobileCircle;

  List<UtilityOperatorModal> _postpaidOperators = [];
  List<UtilityOperatorModal> get postpaidOperators => _postpaidOperators;

  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<Operator> fetchOperator(mobile, context) async {
    final apiUrl = AppURl.fetchOperator;
    final body = {'mobile': mobile};
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        final jsonData = jsonDecode(response.body);
        var data = Operator.fromJson(jsonData);

        _fetchoperator = data;

        data.status == "success"
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertBox(
                    title: "Message",
                    operator: _fetchoperator.operatorOperator,
                    mobileNo: _fetchoperator.mobile,
                    circle: _fetchoperator.circle,
                    onTap: () {
                      // prepaidMobileOffer(mobile, data.operatorId, context);
                      prepaidMobilePlan(
                          mobile, data.operatorId, data.circleId, context);
                      Navigator.push(
                        context,
                        PageTransition(
                          child: PrePaidPlanScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  );
                })
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(_fetchoperator.message),
                    actions: <Widget>[
                      InkWell(
                        child: Text(
                          "Close",
                          style: GoogleFonts.inter(
                              color: PrimaryColor, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
        notifyListeners();
      } else {
        setLoading(false);
        print("Failed to load wallet history");
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
    }
  }

  Future<dynamic> getAllMobileOperators() async {
    final url = Uri.parse(AppURl.getOperator);
    // setLoading(true);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // setLoading(false);
        final decodedResponse = json.decode(response.body);
        _mobileOperators = decodedResponse;
        notifyListeners();
      } else {
        // setLoading(false);
        // throw Exception('Failed to load data');
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      // setLoading(false);
      print(error);
    }
  }

  Future<void> getCircle() async {
    final url = Uri.parse(AppURl.getCircle);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        _mobileCircle = decodedResponse;
        notifyListeners();
      } else {
        // throw Exception('Failed to load data');
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<Charges> getCharges() async {
    final url = Uri.parse(AppURl.charges);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        Charges data = Charges.fromJson(decodedResponse);
        _mobileCharges = data;

        notifyListeners();
      } else {
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<UtilityOperatorModal> utilityOperator() async {
    final apiUrl = AppURl.utilityOperator;
    final body = {'category': "postpaid"};
    // setLoading(true);
    try {
      List<UtilityOperatorModal> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        // setLoading(false);
        var jsonData = jsonDecode(response.body);

        var utility = UtilityOperatorModal.fromJson(jsonData);
        for (var i = 0; i < utility.details.length; i++) {
          loadData.add(utility);
        }
        _postpaidOperators = loadData;
        print("object ${_postpaidOperators.map((e) => e.details.map((e) => e.operatorId))}");

        notifyListeners();
      } else {
        // setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      // setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<PackageDetails> prepaidMobilePlan(
      mobile, operator, circle, context) async {
    final apiUrl = AppURl.prePaidPlan;
    final body = {'mobile': mobile, "operator": operator, "circle": circle};

    _mobile = mobile;
    _operatorId = operator;
    setLoading(true);
    try {
      List<PackageDetails> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var data = PackageDetails.fromJson(jsonData);
        for (var i = 0; i < data.details.length; i++) {
          loadData.add(data);
        }
        _prepaidPlan = loadData;

        // Navigator.push(
        //   context,
        //   PageTransition(
        //     child: RechargePageScreen(),
        //     type: PageTransitionType.rightToLeft,
        //   ),
        // );

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<PrepaidPlanOfferModal> prepaidMobileOffer(
      mobileController, operatorId, context) async {
    _mobile = mobile;
    _operatorId = operatorId;
    final apiUrl = AppURl.prePaidOffer;
    final body = {'mobile': mobileController, "operator": operatorId};

    print(body);
    setLoading(true);
    try {
      List<PrepaidPlanOfferModal> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var prepaid = PrepaidPlanOfferModal.fromJson(jsonData);
        for (var i = 0; i < prepaid.details.length; i++) {
          loadData.add(prepaid);
        }
        _prepaidOffer = loadData;

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<PayRechargeModal> payRecharge(amount, walletAmount, voucherAmount,
      voucherCode, voucherPin, context) async {
    final apiUrl = AppURl.payRecharge;
    final PrefService prefService = PrefService();
    var userId = await prefService.getUserId("userid");
    var code = voucherCode == "" ? "0" : voucherCode;
    final body = {
      'mobile': mobile,
      "operator": operatorId,
      "amount": amount,
      "wallet_amount": walletAmount,
      "voucher_amount": voucherAmount ?? "0",
      "voucher_code": code,
      "voucher_pin": voucherPin,
      "user_id": userId,
      // "transid": transid,
      // "category": category,
    };
    print(body);
    setLoading(true);
    try {
      print("dsdasf");
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        print("dsdadsfsdffsf");
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        var data = PayRechargeModal.fromJson(jsonData);
        print("dsda324324sf");
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
            : {
                showDialog(
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
                    }),
                NotificationService().showNotification(
                    title: 'Mobile Recharge',
                    body:
                        'You have successfully recharged $amount INR to $mobile')
              };
        print("dsda24343243sf");
        // AlertDialog(title:Text(_rechargeMessage) ,content: Text(_rechargeStatus),);
        // _rechargeStatus = divdata .toString();
        notifyListeners();
      } else {
        print("dsdas234f");
        setLoading(false);
        Utils.toastMessage('Failed - Please try again');
      }
    } catch (e) {
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<PostpaidBillModal> postpaidMobileOffer(
      mobileController, operatorId, context) async {
    _mobile = mobileController;
    _operatorId = operatorId;
    notifyListeners();

    final apiUrl = AppURl.postPaidPlan;
    final body = {'mobile': mobileController, "operator": operatorId};
    print(body);
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        // var data = PostpaidBillModal.fromJson(jsonData);
        _postpaidStatus = jsonData["status"];

                  print(_postpaidStatus);
        // _postPaidBillAmount=jsonData["details"];
        // 9087772949
   
                  print(jsonData["details"]["billAmount"]);
        notifyListeners();
        _postpaidStatus == "error"
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  print(jsonData["details"]['errortext']);
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(jsonData["details"]['errortext']),
                    actions: <Widget>[
                      InkWell(
                        child: Text(
                          "Close",
                          style: GoogleFonts.inter(
                              color: PrimaryColor, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }):
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text("Bill Amount: ${jsonData["details"]['billAmount']}"),
                    actions: <Widget>[
                      InkWell(
                        child: Container(height: 30,width: 80,decoration: BoxDecoration(color: appColor,borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Pay",
                              style: GoogleFonts.inter(
                                  color: white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MobileAuthenticateScreen(
                                        amount: jsonData["details"]['billAmount'])));
                        },
                      )
                    ],
                  );
                });
                // 9940102949
            // : Navigator.push(context,
                // MaterialPageRoute(builder: (_) => const PostpaidPageScreen()));
      } else {
        setLoading(false);
        Utils.toastMessage('Failed - Please try again');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server');
    }
  }
}
