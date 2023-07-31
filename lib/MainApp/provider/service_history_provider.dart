import 'dart:convert';
import 'package:Accsys_Pay/MainApp/pages/service_history/service_history_screen.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import "package:http/http.dart" as http;
import '../utils/hover_message.dart';
import '../Models/Wallet_modal.dart';
import '../Models/service_history_modal.dart';
import '../constant/app_url.dart';
import 'auth_provider.dart';

class ServiceHistoryProvider extends ChangeNotifier {
  List<TransactionHistoryModel> _transactionHistory = [];
  List<TransactionHistoryModel> get transactionHistory => _transactionHistory;
  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<TransactionHistoryModel> serviceHistory(context) async {
    final PrefService prefService = PrefService();
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.serviceHistory;
    final body = {'user_id': userId};
    setLoading(true);
    try {
      List<TransactionHistoryModel> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        var history = TransactionHistoryModel.fromJson(jsonData);
        for (var i = 0; i < history.details.length; i++) {
          loadData.add(history);
        }
        _transactionHistory = loadData;
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => ServiceHistoryScreen()));

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to fetch History');
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server');
    }
  }
}
