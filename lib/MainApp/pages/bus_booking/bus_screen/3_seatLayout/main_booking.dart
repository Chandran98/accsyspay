import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';
import 'package:Accsys_Pay/MainApp/utils/busBooking/seat_state.dart';
import '../../../../constant/colors/colors.dart';
import '../../../../provider/bus_provider.dart';
import '../../../../provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/pages/bus_booking/bus_screen/4_pickup_point.dart';
import '../../../../utils/buttons/custom_button.dart';
import '../../../../utils/main_app_utils.dart';
import 'seat_layout.dart';

import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class BusBookingMainPage extends StatefulWidget {
  final Map<String, dynamic> layouts;

  const BusBookingMainPage({Key key, this.layouts}) : super(key: key);

  @override
  _BusBookingMainPageState createState() => _BusBookingMainPageState();
}

class _BusBookingMainPageState extends State<BusBookingMainPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> layouts;

  double totalAmount = 0;
  int seatsCount = 0;
  List<dynamic> selectedSeats = [];
  List<String> seatNos = [];

  @override
  void initState() {
    super.initState();
    layouts = widget.layouts;
  }

  void onBack() {
    // ignore: prefer_const_constructors
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<BusBookingProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          toolbarHeight: 60,
          centerTitle: true,
          iconTheme: IconThemeData(color: white),
          title: Text("Select Seat",
              style: GoogleFonts.inter(
                color: Colors.white,
              )
              // color: theme.darkTheme ? Colors.white : Colors.black),
              ),
          backgroundColor: appColor,
        ),
        body: cityProvider.loading
            ? Center(child: Lottie.asset("assets/lottie/bus.json"))
            : Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                    alignment: Alignment.center,
                    width: 500,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        layouts['lower'].isNotEmpty &&
                                layouts['upper'].isNotEmpty
                            ? SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    spacer20Width,
                                    _seatTypes(),
                                    spacer20Width,
                                    layouts['Seating'].isNotEmpty
                                        ? _seatLayout(
                                            int.parse(
                                                layouts["lowerTotalColumn"]),
                                            int.parse(layouts["lowerTotalRow"]),
                                            true,
                                            true,
                                            sleeper: layouts['lower'],
                                            layoutType: "Lower Deck",
                                            seater: layouts['Seating'])
                                        : _seatLayout(
                                            int.parse(
                                                layouts["lowerTotalColumn"]),
                                            int.parse(layouts["lowerTotalRow"]),
                                            true,
                                            true,
                                            sleeper: layouts['lower'],
                                            layoutType: "Lower Deck"),
                                    spacer20Width,
                                    _seatLayout(
                                        int.parse(layouts["upperTotalColumn"]),
                                        int.parse(layouts["upperTotalRow"]),
                                        false,
                                        true,
                                        sleeper: layouts['upper'],
                                        layoutType: "Upper Deck"),
                                    spacer20Width,
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    spacer20Width,
                                    _seatTypes(),
                                    spacer20Width,
                                    _seatLayout(
                                      int.parse(layouts["seatTotalColumn"]
                                          .toString()),
                                      int.parse(
                                          layouts["seatTotalRow"].toString()),
                                      true,
                                      false,
                                      seater: layouts['Seating'],
                                    ),
                                    spacer20Width,
                                  ],
                                ),
                              ),
                        spacer40Height,
                        if (selectedSeats.isNotEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              // padding: const EdgeInsets.all(0),
                              color: theme.darkTheme ? greyColor : white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                    "$seatsCount seats | ${seatNos.join(', ')}"),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Text("₹ $totalAmount"),
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons
                                                              .add_box_outlined,
                                                          color: Color.fromARGB(
                                                              255, 32, 31, 31)),
                                                      onPressed: () => {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          onTap: () {
                                            selectedSeats.isEmpty
                                                ? Utils.toastMessage(
                                                    "Please Select seats")
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (builder) =>
                                                            BoardingPoint(
                                                                totalAmount:
                                                                    totalAmount
                                                                        .toString(),
                                                                seatData:
                                                                    selectedSeats)));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Container(
                                              height: 7.3.h,
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(
                                                  fixPadding * 1.2),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: PrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text("Proceed",
                                                  style: GoogleFonts.inter(
                                                    color: white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    //: 'NunitoSans',
                                                  )),
                                            ),
                                          ))),
                                  spacer10Height
                                ],
                              ),
                            ),
                          )
                      ],
                    )),
              ),
      ),
    );
  }

  _seatTypes() {
    return SizedBox(
      height: 500,
      width: 250,
      child: Container(
        margin: const EdgeInsets.only(bottom: 140.0, top: 20.0),
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            // border: Border.all(color: const Color.fromARGB(221, 221, 221, 221)),

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 90, left: 20),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  // color: appColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_unselected.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Available",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/birth_unselected.svg',
                        width: 50,
                        height: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Sleeper",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_sold.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Booked by others",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_selected.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Seat selected by you",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_ladies_unselected.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Available only for \nfemale passengers",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_ladies_sold.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Blocked only for \nfemale passengers",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_male_sold.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Blocked only for \nMale passengers",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                  spacer10Height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        'assets/images/seat_male_unselected.svg',
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text("Available for male \npassengers",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: black,
                                fontWeight: FontWeight.w300,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  // border: Border(
                  //     bottom: BorderSide(
                  //         color: Color.fromARGB(221, 221, 221, 221)))
                ),
                height: 70,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Know about seat types",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w400,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _seatLayout(int colN, int rowN, bool isShowWheel, bool isBirth,
      {String layoutType = "",
      List<dynamic> sleeper = const [],
      List<dynamic> seater = const []}) {
    return SizedBox(
      height: double.infinity,
      width: 250,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: const Color.fromARGB(221, 221, 221, 221)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            SeatLayoutPage(
              colN: colN,
              rowN: rowN,
              seater: seater,
              sleeper: sleeper,
              selectedSeats: selectedSeats,
              onSeatStateChanged: (rowI, colI, seatState, selectedSeat) {
                if (seatState == SeatState.selected) {
                  setState(() {
                    selectedSeats.add(selectedSeat[0]);
                    seatNos.add(selectedSeat[0]['seatNo']);
                    totalAmount += double.parse(selectedSeat[0]['total_fare']);
                    seatsCount += 1;
                  });
                } else {
                  setState(() {
                    selectedSeats.remove(selectedSeat[0]);
                    seatNos.remove(selectedSeat[0]['seatNo']);
                    totalAmount -= double.parse(selectedSeat[0]['total_fare']);
                    seatsCount -= 1;
                  });
                }
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(221, 221, 221, 221)))),
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(layoutType,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.w600,
                            ))),
                    if (isShowWheel)
                      Image.asset("assets/images/steering_wheel.png")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
