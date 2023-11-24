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
          iconTheme: const IconThemeData(color: white),
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
            : Stack(
                children: [
                  layouts['lower'].isNotEmpty && layouts['upper'].isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            spacer20Width,
                            _seatTypes(),
                            spacer20Width,
                            layouts['Seating'].isNotEmpty
                                ? _seatLayout(
                                    layouts["lowerTotalColumn"],
                                    layouts["lowerTotalRow"],
                                    true,
                                    true,
                                    sleeper: layouts['lower'],
                                    layoutType: "Lower Deck",
                                    seater: layouts['Seating'])
                                : _seatLayout(
                                    layouts["lowerTotalColumn"],
                                    layouts["lowerTotalRow"],
                                    true,
                                    true,
                                    sleeper: layouts['lower'],
                                    layoutType: "Lower Deck"),
                            spacer20Width,
                            _seatLayout(
                                layouts["upperTotalColumn"],
                                layouts["upperTotalRow"],
                                false,
                                true,
                                sleeper: layouts['upper'],
                                layoutType: "Upper Deck"),
                            spacer20Width,
                          ],
                        )
                      : ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            spacer20Width,
                            _seatTypes(),
                            spacer20Width,
                            _seatLayout(
                              layouts["seatTotalColumn"],
                              layouts["seatTotalRow"],
                              true,
                              false,
                              seater: layouts['Seating'],
                            ),
                            spacer20Width,
                          ],
                        ),
                  // spacer40Height,
                  if (selectedSeats.isNotEmpty)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 10.h,
                        width: double.infinity,
                        // padding: const EdgeInsets.all(0),
                        color: theme.darkTheme ? greyColor : appColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child:
                                  // Text(
                                  //     "$seatsCount seats | ${seatNos.join(', ')}"),
                                  Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$seatsCount seats | ${seatNos.join(', ')}",
                                      style: GoogleFonts.inter(
                                          fontSize: 10.sp,
                                          color: white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    spacer10Height,
                                    Text(
                                      "Total Amount ₹  $totalAmount",
                                      style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(5.0),
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
                                      padding: EdgeInsets.only(right: 3.0.w),
                                      child: Container(
                                        height: 5.3.h, width: 32.w,
                                        // width: double.infinity,
                                        // padding: const EdgeInsets.all(
                                        //     fixPadding * 1.2),
                                        // alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF8A2BE2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("Proceed",
                                              style: GoogleFonts.inter(
                                                color: white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                //: 'NunitoSans',
                                              )),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    )
                ],
              ),
      ),
    );
  }

  _seatTypes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              // bottomRight: Radius.circular(25),
              topRight: Radius.circular(25)),
        ),
        child: Container(
          // margin: const EdgeInsets.only(bottom: 140.0, top: 20.0),
          alignment: Alignment.center,
          // height: double.infinity,
          width: 63.w,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
                height: 9.h,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Know about seat types",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w400,
                        ))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/birth_unselected.svg',
                          width: 5.w,
                          height: 5.4.h,
                        ),
                        spacer20Width,
                        Text("Sleeper",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_selected.svg",
                      title: "Seat selected by you",
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_sold.svg",
                      title: "Booked by others",
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_ladies_unselected.svg",
                      title: "Available only for \nfemale passengers",
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_ladies_sold.svg",
                      title: "Booked by \nfemale passengers",
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_male_unselected.svg",
                      title: "Available only for male \npassengers",
                    ),
                    spacer20Height,
                    SeatTypeName(
                      url: "assets/images/seat_male_sold.svg",
                      title: "Booked by \nmale passengers",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _seatLayout(int colN, int rowN, bool isShowWheel, bool isBirth,
      {String layoutType = "",
      List<dynamic> sleeper = const [],
      List<dynamic> seater = const []}) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, bottom: 1.8.h),
      child: Container(
        // width: 30.w,
        color: white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.5),
                  border: const Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(221, 221, 221, 221)))),
              height: 8.5.h,width: 25.h,
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
                    totalAmount += selectedSeat[0]['total_fare'];
                    seatsCount += 1;
                  });
                } else {
                  setState(() {
                    selectedSeats.remove(selectedSeat[0]);
                    seatNos.remove(selectedSeat[0]['seatNo']);
                    totalAmount -= selectedSeat[0]['total_fare'];
                    seatsCount -= 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SeatTypeName extends StatelessWidget {
  String url, title;
  SeatTypeName({Key key, this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          url,
          width: 3.7.w,
          height: 3.7.h,
        ),
        spacer10Width,
        Text(title,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: black,
              fontWeight: FontWeight.w300,
            )),
      ],
    );
  }
}
