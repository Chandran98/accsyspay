import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../pages/screens.dart';
import '../utils/hover_message.dart';
import '../constant/app_url.dart';

class BannerProvider extends ChangeNotifier {
  List<String> _imageUrls = [];
  List<String> get imageUrls => _imageUrls;
  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
  }

  fetchBanner() async {
    setLoading(true);
    final apiUrl = AppURl.bannerUrl;

    
    try {
      
    final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setLoading(false);
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          List<dynamic> details = data['details'];

          _imageUrls = details.cast<String>();

          notifyListeners();
        }
      } else {
        setLoading(false);
        Utils.toastMessage("Failed to load Banners");
      }
    } catch (e) {
      setLoading(false);
      print('Failed to connect to server');
    }
  }
}
