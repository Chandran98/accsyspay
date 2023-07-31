import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:Accsys_Pay/MainApp/utils/app_bar.dart';

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';
import '../../../Models/bus_modal/search_city_modal.dart';
import '../../../../pages/screens.dart';
import '../../../provider/bus_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/hover_message.dart';
import '../../../utils/main_app_utils.dart';
import '3_seatLayout/main_booking.dart';

class AvailableBusData extends StatefulWidget {
  final City fromI;
  final City toI;
  final String dateI;
  const AvailableBusData({this.fromI, this.toI, this.dateI, Key key})
      : super(key: key);

  @override
  State<AvailableBusData> createState() => _AvailableBusDataState();
}

class _AvailableBusDataState extends State<AvailableBusData> {
  City fromD;
  City toD;
  String dateD;

  @override
  void initState() {
    super.initState();

    fromD = widget.fromI;
    toD = widget.toI;
    dateD = widget.dateI;
  }

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<BusBookingProvider>(context);
    final theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          iconTheme: const IconThemeData(color: white),
          actionsIconTheme: const IconThemeData(color: white),
          toolbarHeight: 10.h, // Set this height
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // spacer20Height,
              Text(
                "${fromD.cityName} - ${toD.cityName}",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
              spacer5Height,
              Text(
                "${cityProvider.availableTrips.length} Buses Available",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            spacer20Height,
            Expanded(
              child: ListView.builder(
                itemCount: cityProvider.availableTrips.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = cityProvider.availableTrips[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        print(data['id']);
                        Provider.of<BusBookingProvider>(context, listen: false)
                            .fetchSeatLayout(
                                data['id'], data['travels'], context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: theme.darkTheme ? black : white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: black.withOpacity(0.1),
                              spreadRadius: 1.2,
                              blurRadius: 1.2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data['travels'],
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    color: theme.darkTheme ? white : black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "from ₹ ${_getMinimumFare(data['fares'])}",
                                        style: GoogleFonts.inter(
                                          fontSize: 10.sp,
                                          color: white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            spacer5Height,
                            Text(
                              data['busType'],
                              style: GoogleFonts.inter(
                                fontSize: 9.sp,
                                color: theme.darkTheme ? white : black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            spacer20Height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.time,
                                      color: Colors.red,
                                      size: 4.w,
                                    ),
                                    spacer10Width,
                                    Text(
                                      "${Utils.convertTo12HourFormat(data['departureTime'])} - ${Utils.convertTo12HourFormat(data['arrivalTime'])}",
                                      style: GoogleFonts.inter(
                                        color: theme.darkTheme ? white : black,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.time_solid,
                                      color: Colors.purple,
                                      size: 4.w,
                                    ),
                                    spacer10Width,
                                    Text(
                                      data["duration"],
                                      style: GoogleFonts.inter(
                                        color: theme.darkTheme ? white : black,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.bookmark_solid,
                                      color: Colors.green,
                                      size: 4.w,
                                    ),
                                    spacer10Width,
                                    Text(
                                      '${data['availableSeats']} Seats',
                                      style: GoogleFonts.inter(
                                        color: theme.darkTheme ? white : black,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: fixPadding / 3,
                                    vertical: fixPadding / 2.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "",
                                    style: white12ExtraBoldTextStyle,
                                  ),
                                ),
                                widthSpace,
                                Text(
                                  "Boarding & Drop point",
                                  style: GoogleFonts.inter(
                                    color: theme.darkTheme ? white : black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBusTime(String time) {
    return DateFormat('HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(time) * 100000000000));
  }

  int _getMinimumFare(fares) {
    String minFare = fares.runtimeType == String
        ? fares
        : fares.reduce((current, next) =>
            double.parse(current) < double.parse(next) ? current : next);
    return double.parse(minFare).round();
  }
}
