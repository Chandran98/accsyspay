// ignore_for_file: missing_return

import 'dart:convert';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import "package:http/http.dart" as http;
import 'package:lottie/lottie.dart';
import '../Models/utility_files/fetch_amount_modal2.dart';
import '../pages/recharge/fastag_screens/3_acc_info.dart';
import '../utils/hover_message.dart';
import '../Models/prepaid_plan_modals.dart';
import '../Models/utility_files/fetch_biller_modal.dart';
import '../Models/utility_files/fetchdetailsmodal.dart';
import '../Models/utility_files/params_modal.dart';
import '../Models/utility_files/today_modal.dart';
import '../Models/utility_files/utility_modal.dart';
import '../constant/app_url.dart';
import '../pages/utiltiy/4_bills_details_screen.dart';
import '../utils/alertDialogBox/payment_alert_dialog_box.dart';
import '../utils/notification_service.dart';

class UtilityProvider extends ChangeNotifier {
  List<DetailModal> billers = [];
  List<DetailModal> searchedbillers = [];
  String searchText = "";
  String _biller = '';
  get biller => _biller;
  String _categoryId = "";
  get categoryId => _categoryId;

  String _paymentMessage;
  get paymentMessage => _paymentMessage;

  String _paymentStatus = "";
  get paymentStatus => _paymentStatus;

  Charges _mobileCharges;
  get mobileCharges => _mobileCharges;

  String _params1 = "";
  get params1 => _params1;
  String _accountUlity = "";
  get accountUlity => _accountUlity;
  String _params2 = "";
  get params2 => _params2;
  String _params1value = "";
  get params1value => _params1value;
  String _params2value = "";
  get params2value => _params2value;
  String _searchText = "";

  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  List<DetailModal> _fetchbiller = [];
  List<DetailModal> get fetchbiller => _fetchbiller;
  List<DetailModal> _searchfetchbiller = [];
  List<DetailModal> get searchfetchbiller => _searchfetchbiller;

  DetailsBiller _fetchbilldetails;
  DetailsBiller get fetchbilldetails => _fetchbilldetails;

  List<ModalResponse> _paramsModal = [];
  List<ModalResponse> get paramsModal => _paramsModal;

  List<UtilityOperatorModal> _utilityOperators = [];
  List<UtilityOperatorModal> get utilityOperators => _utilityOperators;
  Future<UtilityOperatorModal> utilityOperator() async {
    final apiUrl = AppURl.utilityOperator;
    final body = {'category': "postpaid"};
    setLoading(true);
    try {
      List<UtilityOperatorModal> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var utility = UtilityOperatorModal.fromJson(jsonData);
        for (var i = 0; i < utility.details.length; i++) {
          loadData.add(utility);
        }
        _utilityOperators = loadData;

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

  Future<void> fetchBillers(id) async {
    final apiUrl = AppURl.fetchBiller;
    final body = {'category': id};
    _categoryId = id;

    setLoading(true);
    final url = Uri.parse(apiUrl);

    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      setLoading(false);
      final jsonList = jsonDecode(response.body)['details'] as List<dynamic>;
      billers = jsonList.map((json) => DetailModal.fromJson(json)).toList();
      updateData();
      // notifyListeners();
    } else {
      setLoading(false);
      Utils.toastMessage('Failed to fetch billers');
    }
  }

  updateData() {
    searchedbillers.clear();
    if (searchText.isEmpty) {
      searchedbillers.addAll(billers);
    } else {
      searchedbillers.addAll(billers
          .where((element) =>
              element.service.toLowerCase().contains(searchText))
          .toList());
      searchText = "";
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username;
    updateData();
  }

  Future<ModalDetails> fetchAmountBiller(
      id, param1, account,params1name,params1value,  context) async {
    final PrefService prefService = PrefService();
    var userMobile = await prefService.getMobile("mobile");
    final apiUrl = AppURl.fetchAmount;
    print(param1);

    _params1 = params1name;
    _accountUlity = account;
    _params1value = params1value;
    _params2value = params2value;
_biller=id;
    final body = {
      'biller': id,
      // "param1_value": userMobile,
      "mobile": account,
      "param1_name": params1name,
      "param1_value": params1value,
      // "param2_value": params2value,
      // "category": _categoryId
    };
    print(body);
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
print(response.body);print(response.statusCode);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        print(jsonData);
        DetailsBiller dataModal = DetailsBiller.fromJson(jsonData["details"]);
        _fetchbilldetails = dataModal;
print("_fetchbilldetails$_fetchbilldetails");
        _fetchbilldetails.status == "success"
            ? Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BillerDetailsScreen()))
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text("Failed-please try again"),
                    // content: Text(_fetchbilldetails.details.responseMessage),
                    actions: <Widget>[
                      InkWell(
                        child: const Text(
                          "Close",
                          style: TextStyle(
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
        Utils.toastMessage('No bill available');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
      Utils.toastMessage('No bill available');
    }
  }

  Future<ModalDetails> fastagBiller(
      id, param1, params1value, context) async {
    final PrefService prefService = PrefService();
    var userMobile = await prefService.getMobile("mobile");
    final apiUrl = AppURl.fetchAmount;

    _params1 = param1;
    _params2 = params2;
    _params1value = params1value;
    _params2value = params2value;
_biller=id;
    final body = {
      'biller': id,
      "param1_value": userMobile,
      "mobile": params1value,
    // _params1 = params1;
    // _params2 = params2;
    // _params1value = params1value;
    // _params2value = params2value;

    // final body = {
    //   'biller': id,
    //   "mobile": userMobile,
    //   "param1_name": params1,
    //   "param2_name": params2,
    //   "param1_value": params1value,
    //   "param2_value": params2value,
    //   "category": _categoryId
    };
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        DetailsBiller dataModal = DetailsBiller.fromJson(jsonData["details"]);
        _fetchbilldetails = dataModal;

        _fetchbilldetails.status == "success"
            ? Navigator.push(context,
                MaterialPageRoute(builder: (_) => const FastagAccInfoScreen()))
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text("Failed - Please try again"),
                    // content: Text(_fetchbilldetails.details.responseMessage),
                    actions: <Widget>[
                      InkWell(
                        child: const Text(
                          "Close",
                          style: TextStyle(
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
        Utils.toastMessage('Failed to Fetch Biller');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
      Utils.toastMessage('Failed to Fetch Biller');
    }
  }

  Future<ModalResponse> getBillerParams(billerId, context) async {
    final apiUrl = AppURl.billerParams;
    final body = {'biller': billerId};
    _biller = billerId;

    setLoading(true);
    try {
      List<ModalResponse> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);

        var utility = ModalResponse.fromJson(jsonData);

        for (var i = 0; i < utility.details.length; i++) {
          loadData.add(utility);
        }

        _paramsModal = loadData;

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to Fetch Biller');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server: $e');
      Utils.toastMessage('Failed to Fetch Biller');
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
        // throw Exception('Failed to load data');
        return Utils.toastMessage("Failed to load data");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<PayRechargeModal> payBills(amount, walletAmount, voucherAmount,
      voucherCode, voucherPin, txId, context) async {
    final apiUrl = AppURl.payBills;
    final PrefService prefService = PrefService();
    var userId = await prefService.getUserId("userid");
    var mobile = await prefService.getMobile("mobile");
    var code = voucherCode == "" ? "0" : voucherCode;
    print("my data");
    final body = {
      'mobile': _accountUlity,
      "biller": _biller,
      "amount": amount,
      "wallet_amount": walletAmount,
      "voucher_amount": voucherAmount ?? "0",
      "voucher_code": code,
      "voucher_pin": voucherPin,
      "user_id": userId,
      "category": _categoryId,
      // "transid": txId,
      "param1_name": _params1,
      "param1_value": _params1value,
      "param2_name": _params2,
      "param2_value": _params2value,
    };
    print(body);
    setLoading(true);

    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      print("My object");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print("My daraa$jsonData");

        var data = PayRechargeModal.fromJson(jsonData);
        print("object$data");
        _paymentMessage = data.message.toString();
        _paymentStatus = data.status.toString();
        Utils.toastMessage(_paymentStatus);

        _paymentStatus == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: _paymentMessage,
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
                    message: _paymentMessage,
                    lottie: Lottie.asset("assets/lottie/pays.json"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MainScreen()));
                    },
                  );
                }), NotificationService().showNotification(
                          title: 'Bill Payment',
                          body:
                              'You have successfully billed $amount INR to $mobile')};

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed - Please try again');
      }
    } catch (e) {
      setLoading(false);
      // Utils.toastMessage('Failed to connect to server: $e');
      print('Failed to connect to server: $e');
    }
  }
}
