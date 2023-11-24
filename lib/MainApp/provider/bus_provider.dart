// ignore_for_file: missing_return, avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../Models/bus_modal/after_seat_layout_modal.dart/cancellation_ticket_modal.dart';
import '../Models/bus_modal/after_seat_layout_modal.dart/ticket_history_modal.dart';
import '../Models/bus_modal/available_bus_modal.dart';
import '../Models/bus_modal/cancel_ticket_data_modal.dart';
import '../Models/bus_modal/newModel/bus_detail_model.dart';
import '../Models/bus_modal/print_ticket_modal.dart';
import '../Models/bus_modal/seat_layout_modal.dart';
import '../Models/status_check_modal.dart';
import '../pages/bus_booking/bus_screen/3_seatLayout/main_booking.dart';
import '../../pages/screens.dart';
import '../Models/bus_modal/search_city_modal.dart';
import '../Models/bus_modal/seller_avaiable_modal.dart';
import '../constant/app_url.dart';
import "package:http/http.dart" as http;
import '../pages/bus_booking/bus_screen/2_screen.dart';
import '../pages/bus_booking/bus_screen/5_book_ticker.dart';
import '../pages/bus_booking/bus_screen/6_print_ticket_screen.dart';
import '../utils/alertDialogBox/payment_alert_dialog_box.dart';
import '../utils/main_app_utils.dart';
import 'auth_provider.dart';

class BusBookingProvider extends ChangeNotifier {
  List<City> _cities = [];
  List<City> get cities => _cities;

  ///////////////////////// --------------------------------  //////////////////////////////////

  String _busId = "";
  String source = "";
  String destination = "";
  String sourceCity = "";
  String destinationCity = "";
  String journeyDate = "";
  String travelsName = "";

String   _source="";
String _destination="";
String _doj="";
String _inventoryType="";
String _routeScheduleId="";

  BusDetails availableTrips;

  ///////////////////////// --------------------------------  //////////////////////////////////

  var _busDetails;
  get busDetails => _busDetails;

  var boardingPlaces;
  var departingPlaces;

  var _layout;
  get layout => _layout;
  var _totalFare;
  get totalFare => _totalFare;

  ///////////////////////// --------------------------------  //////////////////////////////////

  String _blockTicketKey = "";
  get blockTicketKey => _blockTicketKey;

  ///////////////////////// --------------------------------  //////////////////////////////////

  String _tinNo = "";
  get tinNo => _tinNo;

  ///////////////////////// --------------------------------  //////////////////////////////////

  TicketPrintModal _tinData;
  TicketPrintModal get tinData => _tinData;

  ///////////////////////// --------------------------------  //////////////////////////////////

  String _cancelSeatNo = "";
  String get cancelSeatNo => _cancelSeatNo;

  CancelTicketDataModal _cancelTicketData;
  CancelTicketDataModal get cancelTicketData => _cancelTicketData;

  ///////////////////////// --------------------------------  //////////////////////////////////

  List<BusTicketHistory> _busticketHistory = [];
  List<BusTicketHistory> get busticketHistory => _busticketHistory;

  ///////////////////////// --------------------------------  //////////////////////////////////
  bool _loading = false;
  get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  ///////////////////////// --------------------------------  //////////////////////////////////

  final PrefService prefService = PrefService();
  Future<void> fetchCities() async {
    final response = await http.get(Uri.parse(AppURl.seatSellerCities));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final wdata = BusCities.fromJson(data);
      print(wdata.cities);
      _cities = wdata.cities;
      notifyListeners();
    } else {
      print('Failed to fetch cities');
    }
  }

  Future<AvailableBusModal> seatAvailableTrips(
      City from, City to, date, context) async {
    sourceCity = from.name.toString();
    destinationCity = to.name.toString();
    journeyDate = date;
    source = from.id.toString();
    destination = to.id.toString();
    final apiUrl = AppURl.seatSellerAvailableTrip;
    final body = {
      'source': from.id.toString(),
      'destination': to.id.toString(),
      'doj': date,
    };

    print(body);
    setLoading(true);
    try {
      final response = await http.post(Uri.parse(apiUrl), body: body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        availableTrips = BusDetails.fromJson(jsonData);
        print(availableTrips);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AvailableBusData(
                      fromI: from,
                      toI: to,
                      dateI: date,
                    )));

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load bus Data');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      // Utils.toastMessage('Failed to connect to server: $e');
    }
  }

  Future<SeatLayoutModal> fetchSeatLayout(
      from, to, doj, inventoryType, routeScheduleId, context) async {
    setLoading(true);
    // _busId = id;
    // travelsName = travels;

    final url = AppURl.seatSellerSeatLayout;
    _source=from;
    _destination=to;
    _doj=doj.toString();
    _inventoryType=inventoryType.toString();
    _routeScheduleId=routeScheduleId.toString();
    try {
      final body = {
        'source': from,
        'destination': to,
        'doj': doj.toString(),
        "inventoryType": inventoryType.toString(),
        "routeScheduleId": routeScheduleId.toString()
      };
      // final body = {"id": "2000005545830099438"};
      print(body);

      var _boardingCities = [];

      var _departingCities = [];
      final response = await http.post(Uri.parse(url), body: body);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        setLoading(false);
        print(233424);

        final responseData = jsonDecode(response.body);
        print(345445);

        var layoutDetails = responseData["details"];
        var layoutSeat = layoutDetails["layout"];

        layoutDetails["boardingPoints"] is List
            ? _boardingCities = layoutDetails["boardingPoints"]
            : _boardingCities.add(layoutDetails["boardingPoints"]);

        layoutDetails["droppingPoints"] is List
            ? _departingCities = layoutDetails["droppingPoints"]
            : _departingCities.add(layoutDetails["droppingPoints"]);

        boardingPlaces = _boardingCities;
        departingPlaces = _departingCities;

        _busDetails = layoutDetails;
        print("boardingPlaces ${layoutDetails["boardingPoints"]}");

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => BusBookingMainPage(layouts: layoutSeat)));

        _layout = layoutSeat;

        notifyListeners();
      } else {
        setLoading(false);
        print('Failed to fetch seat layout');
      }
    } catch (error) {
      setLoading(false);
      print('Failed to connect to the server');
      print(error);
    }
  }

  Future blockTicket(
      bp,
      dp,
      fare,
      userList,
      //  fare, ladiesSeat, address, age, email, gender,
      //     idNo, idType, mobile, name, primary, title, seat,
      context) async {
    _totalFare = fare;
    final apiUrl = AppURl.seatSellerBlockTicket;
    final body = {
      "sourceCity": _source,
      "destinationCity": _destination,
      "doj": _doj,
      "routeScheduleId": _routeScheduleId,
    "inventoryType": _inventoryType,
      "customerName": "test",
      "customerLastName": "testing",
      "customerEmail": "test@gmail.com",
      "customerPhone": "9999999999",
      "emergencyPhNumber": "8888888888",
      "customerAddress": "kphp",
      "boardingPoint": {
        "id": bp["id"],
        "location":bp["location"],
        "time": bp["time"]
      },
      // "droppingPointId": dp,
      "blockSeatPaxDetails": userList
    };
    print(json.encode(body));
    setLoading(true);
    try {
      print(877);

      final response =
          await http.post(Uri.parse(apiUrl), body: json.encode(body));
      print(8723332237);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print(87790900);
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        StatusCheckModal resultData = StatusCheckModal.fromJson(jsonData);
        _blockTicketKey = resultData.message;
        print(resultData.message);
        resultData.status == "success"
            ?
             Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BlockTicketPage()))
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(_blockTicketKey),
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

        print(jsonData);

        notifyListeners();
      } else {
        setLoading(false);
        print("object23");
        Utils.toastMessage('Failed to block Seat');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      // Utils.toastMessage('Failed to connect to server: $e');
    }
  }

  seatBookTicket(fareRate, walletAmount, context) async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.seatSellerBookTicket;
    final body = {
      'blockKey': _blockTicketKey,
      'amount': fareRate,
      'wallet_amount': walletAmount,
      'voucher_amount': "0",
      'voucher_code': "0",
      'voucher_pin': "0",
      'user_id': userId,
    };
    print(body);
    setLoading(true);
    try {
      print(877);
      // List<AvailableTrip> loadData = [];

      final response = await http.post(Uri.parse(apiUrl), body: body);
      print(8723332237);
      if (response.statusCode == 200) {
        print(87790900);
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        StatusCheckModal resultData = StatusCheckModal.fromJson(jsonData);
        _tinNo = resultData.message;

        resultData.status == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return CustomAlertDialog(
                    message: resultData.message,
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
                    message:
                        "Successfully Booked \n Your Tin no: ${resultData.message}",
                    lottie: Lottie.asset("assets/lottie/pays.json"),
                    onTap: () {
                      seatPrintTicket(resultData.message, context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => const PrintTicketScreen()));
                    },
                  );
                });

        notifyListeners();
      } else {
        setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  seatPrintTicket(tin, context) async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.seatSellerPrintTicket;
    final body = {
      'tin': tin,
    };
    print("Tin no. $body");
    setLoading(true);
    try {
      print(877);

      final response = await http.post(Uri.parse(apiUrl), body: body);
      print(8723332237);
      if (response.statusCode == 200) {
        print(87790900);
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        _tinData = TicketPrintModal.fromJson(jsonData);

        print(_tinData.status);
        print("object");
        _tinData.status == "success"
            ? Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PrintTicketScreen()))
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(jsonData["message"]),
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
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  fetchCancelledTicketData(tin, seat, context) async {
    final apiUrl = AppURl.seatSellerCancelTicketData;
    _cancelSeatNo = seat;
    final body = {
      'tin': tin,
    };
    print(body);
    setLoading(true);
    try {
      print(877);
      // List<AvailableTrip> loadData = [];

      final response = await http.post(Uri.parse(apiUrl), body: body);
      print(8723332237);
      if (response.statusCode == 200) {
        print(87790900);
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        CancelTicketDataModal data = CancelTicketDataModal.fromJson(jsonData);

        data.status == "error"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: const Text("Something went wrong"),
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
                })
            : showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: const Text("Charges"),
                    content: Container(
                      height: 16.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cancellation Charges",
                                style: GoogleFonts.inter(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                " ${data.message.totalCancellationCharge}",
                                style: GoogleFonts.inter(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          spacer10Height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ServiceTax",
                                style: GoogleFonts.inter(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                " ${data.message.serviceTaxOnCancellationCharge}",
                                style: GoogleFonts.inter(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          spacer10Height,
                          Divider(),
                          spacer10Height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Refund Amount",
                                style: GoogleFonts.inter(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                " ${data.message.totalRefundAmount}",
                                style: GoogleFonts.inter(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          // spacer20Height,
                        ],
                      ),
                    ),
                    actions: [
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: GoogleFonts.inter(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        onTap: () {
                          seatCancelTicket(tin, seat, context);
                        },
                      ),
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.inter(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
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
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  seatCancelTicket(tin, seat, context) async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.seatSellerCancelTicket + userId;
    print("Api $apiUrl");
    final body = {
      'tin': tin,
      'seatsToCancel': seat,
    };
    // final body = {
    //   'tin': "8885AEP2",
    //   'seatsToCancel': "4",
    // };
    print(body);
    setLoading(true);
    try {
      print(877);

      final response =
          await http.post(Uri.parse(apiUrl), body: json.encode(body));
      print(response);
      print(8723332237);
      if (response.statusCode == 200) {
        print(87790900);
        setLoading(false);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        CancellationTicketModal cancelTicket =
            CancellationTicketModal.fromJson(jsonData);
        print(cancelTicket.message);
        cancelTicket.status == "success"
            ? showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(cancelTicket.message),
                    actions: <Widget>[
                      InkWell(
                        child: Text(
                          "Close",
                          style: GoogleFonts.inter(
                              color: PrimaryColor, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MainScreen()));
                        },
                      )
                    ],
                  );
                })
            : showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: const Text("Message"),
                    content: Text(cancelTicket.message),
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
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      print("error$e");
      setLoading(false);
      Utils.toastMessage('Failed to connect to server');
    }
  }

  Future<BusTicketHistory> busProviderHistory() async {
    var userId = await prefService.getUserId("userid");
    final apiUrl = AppURl.busBookingHistory;
    final body = {'user_id': userId};
    // setLoading(true);
    try {
      List<BusTicketHistory> loadData = [];
      final response = await http.post(Uri.parse(apiUrl), body: body);

      if (response.statusCode == 200) {
        // setLoading(false);
        var jsonData = jsonDecode(response.body);

        var utility = BusTicketHistory.fromJson(jsonData);
        for (var i = 0; i < utility.details.length; i++) {
          loadData.add(utility);
        }
        _busticketHistory = loadData;

        notifyListeners();
      } else {
        // setLoading(false);
        Utils.toastMessage('Failed to load wallet history');
      }
    } catch (e) {
      // setLoading(false);
      print('Failed to connect to server: $e');
    }
  }
}
