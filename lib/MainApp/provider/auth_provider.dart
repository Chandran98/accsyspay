import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../Models/auth_models/login_otp_modal.dart';
import '../Models/auth_models/register_mdoel.dart';
import '../Models/bus_modal/cancel_ticket_data_modal.dart';
import '../Models/profile_model.dart';
import '../Models/status_check_modal.dart';
import '../pages/auth_screen/forgot_password.dart';
import '../pages/auth_screen/login.dart';
import '../pages/auth_screen/login_otp_screen.dart';
import '../pages/main_screen.dart';
import '../pages/verficationscreen.dart';
import '../constant/app_url.dart';
import '../Models/auth_models/login_model.dart';
import '../utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/token_generator.dart';

class AuthProvider extends ChangeNotifier {
  // LoginModel loginModel;
  LoginModal otpModal;
  OtpCheck otpCheck;
  String _customerId = "";
  get customerId => _customerId;
  ProfileModal _profileData;
  ProfileModal get profileData => _profileData;

  OtpCheck _pinData;
  OtpCheck get pinData => _pinData;

  String _username = "";
  get username => _username;

  String _useremail = "";
  get useremail => _useremail;
  String _loginEmail = "";
  get loginEmail => _loginEmail;

  String _userphone = "";
  get userphone => _userphone;

  String _userpassword = "";
  get userpassword => _userpassword;

  String _token = "";
  get token => _token;

  String _forgotOtpToken = "";
  get forgotOtpToken => _forgotOtpToken;
  String _forgotOtpEmail = "";
  get forgotOtpEmail => _forgotOtpEmail;

  String _status;
  get status => _status;
  bool _loading = false;
  get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  final PrefService prefService = PrefService();
  // ignore: missing_return
  Future<LoginModel> login(String email, String password, context) async {
    setLoading(true);

    _loginEmail = email;
    // SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var url = AppURl.sendLoginOTP;
      print(url);
      var response = await http.post(Uri.parse(url), body: {
        "email": email,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        otpModal = LoginModal.fromJson(jsonData);

        otpModal.status == "error"
            ? Utils.toastMessage(otpModal.message)
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => LoginOTPVerificationScreen()));

        _customerId = otpModal.userId;
        _status = otpModal.status;

        print(jsonData);
        // pref.setString("status", otpModal.status);
        // pref.setString("user_id", otpModal.userId.toString());
        // pref.setString("mobile", otpModal.mobile.toString());
        // pref.setString("name", otpModal.name.toString());
        // pref.setString("email", otpModal.email.toString());
        // // _userId = pref.getString(
        // //   "user_id",
        // // );

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Something went wrong");
      }
    } catch (e) {
      print(e);
      Utils.toastMessage(
        "Failed to load please try again",
      );
      setLoading(false);
    }
  }

  // ignore: missing_return
  Future<LoginModel> reLoginSendOtp(context) async {
    setLoading(true);
    try {
      var url = AppURl.sendLoginOTP;

      print(_loginEmail);
      var response = await http.post(Uri.parse(url), body: {
        "email": _loginEmail,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        otpModal = LoginModal.fromJson(jsonData);

        otpModal.status == "error"
            ? Utils.toastMessage(otpModal.message)
            : Utils.toastMessage("We have again sent OTP to $_loginEmail");

        _customerId = otpModal.userId;
        _status = otpModal.status;

        print(jsonData);

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Something went wrong");
      }
    } catch (e) {
      print(e);
      Utils.toastMessage(
        "Failed to load please try again",
      );
      setLoading(false);
    }
  }

  Future register(name, email, phone, password, context) async {
    setLoading(true);
    _username = name;
    _useremail = email;
    _userphone = phone;
    _userpassword = password;

    String generateRandomString() {
      final random = Random();
      const allChars =
          'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
      final randomString = List.generate(
          12, (index) => allChars[random.nextInt(allChars.length)]).join();
      return randomString;
    }

    String voidToken = generateRandomString();
    try {
      final String url = AppURl.optCheckUrl;

      final body = {
        'mobile': phone,
        "email": email,
        "token": voidToken.toString()
      };
      _token = voidToken;
      var response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        final userCheck = OtpCheck.fromJson(jsonDecode(response.body));
        userCheck.status.toString() == "error"
            ? Utils.toastMessage(userCheck.message)
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const OTPVerificationScreen()));
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      print("failed");
    }
  }

  verifyOtp(otp, context) async {
    var url = AppURl.verifiedUrl;
    final body = {'token': _token, "code": otp};
    setLoading(true);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      setLoading(false);
      otpCheck = OtpCheck.fromJson(jsonDecode(response.body));
      registerUser(context);
      otpCheck.status == "success"
          ? Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()))
          : const SizedBox();

      Utils.toastMessage(otpCheck.message);
    } else {
      setLoading(false);
      Utils.toastMessage("Failed-Please try again");
    }
  }

  updateProfile(name, mobile, pin, context) async {
    var userId = await prefService.getUserId("userid");
    var url = AppURl.profileUpdate;
    final body = {'user_id': userId, "name": name, "phone": mobile, "pin": pin};
    print(body);
    setLoading(true);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      setLoading(false);
      print("dsf");
      otpCheck = OtpCheck.fromJson(jsonDecode(response.body));
      print("dsfs");
      otpCheck.status == "success"
          ? Navigator.push(
              context, MaterialPageRoute(builder: (_) => const MainScreen()))
          : const SizedBox();

      Utils.toastMessage(otpCheck.message);
    } else {
      setLoading(false);
      Utils.toastMessage("Failed-Please try again");
    }
  }

  registerUser(context) async {
    try {
      final String url = AppURl.registerUrl;
      setLoading(true);
      var response = await http.post(Uri.parse(url), body: {
        "name": _username,
        "email": _useremail,
        "mobile": _userphone,
        "password": _userpassword,
      });
      if (response.statusCode == 200) {
        setLoading(false);

        otpCheck = OtpCheck.fromJson(jsonDecode(response.body));
        // otpCheck == "success"
        //     ? Navigator.push(
        //         context, MaterialPageRoute(builder: (_) => LoginAuth()))
        //     : SizedBox();

        Utils.toastMessage(otpCheck.message);
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("failed");
    }
  }

// Forgot Password

  forgotPassword(email, context) async {
    setLoading(true);
    String token = TokenGenerator().generateRandomString();
    try {
      final String url = AppURl.forgotVerification;

      final body = {"email": email, "token": token};
      _forgotOtpToken = token;
      _forgotOtpEmail = email;
      var response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        otpCheck = OtpCheck.fromJson(jsonDecode(response.body));

        otpCheck.status == "success"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ForgotOTPVerificationScreen()))
            : Utils.toastMessage(otpCheck.message);
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("failed");
    }
  }

  forgotPasswordVerifyOtp(otp, context) async {
    var url = AppURl.verifiedUrl;
    final body = {'token': _forgotOtpToken, "code": otp};
    setLoading(true);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      setLoading(false);
      otpCheck = OtpCheck.fromJson(jsonDecode(response.body));
      registerUser(context);
      otpCheck.status == "success"
          ? Navigator.push(context,
              MaterialPageRoute(builder: (_) => const UpdatePasswordScreen()))
          : Utils.toastMessage(otpCheck.message);
    } else {
      setLoading(false);
      Utils.toastMessage("Failed-Please try again");
    }
  }

  updatePassword(password, context) async {
    try {
      final String url = AppURl.updatePasswordUrl;
      setLoading(true);
      final body = {"email": _forgotOtpEmail, "password": password};

      var response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        setLoading(false);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("failed");
    }
  }

  getProfileInfo() async {
    var userId = await prefService.getUserId("userid");
    print("object");
    try {
      final String url = AppURl.getProfileInfo;
      setLoading(true);
      final body = {"user_id": userId};

      var response = await http.post(Uri.parse(url), body: body);
      print("objectasdd");
      if (response.statusCode == 200) {
        setLoading(false);
        print("objdsaect");
        var jsonData = jsonDecode(response.body);
        ProfileModal profile = ProfileModal.fromJson(jsonData);
        _profileData = profile;
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("failed");
    }
  }

  verifyYourPin(pin, context) async {
    var userId = await prefService.getUserId("userid");
    print("object");

    try {
      final String url = AppURl.verifyPin;
      setLoading(true);
      final body = {"user_id": userId, "pin": pin};

      var response = await http.post(Uri.parse(url), body: body);
      print("objectasdd");
      if (response.statusCode == 200) {
        setLoading(false);
        print("objdsaect");
        var jsonData = jsonDecode(response.body);
        OtpCheck profile = OtpCheck.fromJson(jsonData);

        profile.status == "error"
            ? Utils.toastMessage("Invalid Pin")
            : {
                Utils.toastMessage("You can Proceed to Recharge"),
                Navigator.of(context).pop()
              };

        _pinData = profile;
        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage("Failed-Please try again");
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("failed");
    }
  }
}

class PrefService {
  Future setstatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("status", status);
  }

  Future removestatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("status");
  }

  Future getstatus(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var ID = pref.getString("status");
    return ID;
  }

  Future setuserid(userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_id", userId);
  }

  Future removeuserid(userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("user_id");
  }

  Future getUserId(userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var userID = pref.getString("user_id");
    return userID;
  }

  Future setname(name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }

  Future removename(name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("name");
  }

  Future getname(name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var name = pref.getString("name");
    return name;
  }

  Future setemail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
  }

  Future removeemail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("email");
  }

  Future getemail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_emails
    var email = pref.getString("email");
    return email;
  }

  Future setMobile(mobile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("mobile", mobile);
  }

  Future getMobile(mobile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    var mobile = pref.getString("mobile");
    return mobile;
  }
}
