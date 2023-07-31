import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../pages/screens.dart';
import '../../../provider/bus_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/hover_message.dart';
import '../../../utils/main_app_utils.dart';
import '../../main_screen.dart';
import '../../setting_screen/faq_screen.dart';

class PrintTicketScreen extends StatefulWidget {
  const PrintTicketScreen({Key key}) : super(key: key);

  @override
  State<PrintTicketScreen> createState() => _PrintTicketScreenState();
}

class _PrintTicketScreenState extends State<PrintTicketScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    List userSeat = [];
    final busProvider = Provider.of<BusBookingProvider>(context);
    final theme = Provider.of<ThemeProvider>(context);
    final blockProvider = busProvider.tinData.message;
    blockProvider.inventoryItems is List
        ? "Array"
        : userSeat.add(blockProvider.inventoryItems.seatName);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: appColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                            )),
                        Expanded(
                          child: Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: PrimaryColor,
                                  // fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const FaqScreen()));
                          },
                          child: const Icon(
                            Icons.info,
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  spacer30Height,
                  Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          // height: 47.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              // bottomLeft: Radius.circular(25),
                              // bottomRight: Radius.circular(25)
                            ),
                            color: theme.darkTheme ? blackColor : Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacer50Height,
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 23.h,
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     // color: appColor,
                                          //     ),
                                          color: appColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, left: 14, right: 14),
                                        child: Column(
                                          children: [
                                            Text(
                                              blockProvider.travels,
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.sp),
                                            ),
                                            spacer5Height,
                                            Text(blockProvider.busType),
                                            spacer40Height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Boarding",
                                                      style: GoogleFonts.inter(
                                                          color: theme.darkTheme
                                                              ? whiteColor
                                                              : blackColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    spacer10Height,
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color:
                                                                      greenColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                        spacer5Width,
                                                        Text(
                                                          blockProvider
                                                              .sourceCity,
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: theme
                                                                    .darkTheme
                                                                ? whiteColor
                                                                : blackColor,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                        spacer5Width,
                                                        Text(
                                                          "(${Utils.convertTo12HourFormat(blockProvider.pickupTime)})",
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: theme
                                                                    .darkTheme
                                                                ? whiteColor
                                                                : blackColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 9.sp,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Destination",
                                                      style: GoogleFonts.inter(
                                                          color: theme.darkTheme
                                                              ? whiteColor
                                                              : blackColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    spacer10Height,
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color:
                                                                      redColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                        spacer5Width,
                                                        Text(
                                                          blockProvider
                                                              .destinationCity,
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: theme
                                                                    .darkTheme
                                                                ? whiteColor
                                                                : blackColor,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                        spacer5Width,
                                                        Text(
                                                          "(${Utils.convertTo12HourFormat(blockProvider.dropTime)})",
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: theme
                                                                    .darkTheme
                                                                ? whiteColor
                                                                : blackColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 9.sp,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14, bottom: 5),
                                    child: Text(
                                      'User Details',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  blockProvider.inventoryItems is List
                                      ? Column(
                                          children: blockProvider.inventoryItems
                                              .map<Widget>((item) {
                                            userSeat
                                                .add(item.seatName.toString());
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      item.passenger.name,
                                                    ),
                                                    subtitle: Column(
                                                      children: [
                                                        spacer10Height,
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "Age: ${item.passenger.age}"),
                                                            spacer20Width,
                                                            Text(
                                                                "Gender: ${item.passenger.gender}"),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    trailing: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: appColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                    vertical:
                                                                        4),
                                                            child: Text(
                                                              "₹ ${item.fare}",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      color:
                                                                          whiteColor,
                                                                      fontSize:
                                                                          13),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                            "Seat No. ${item.seatName}"),
                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0),
                                                    child: Divider(),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 5),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(3),
                                            tileColor: redColor,
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(blockProvider
                                                  .inventoryItems
                                                  .passenger
                                                  .name),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                children: [
                                                  spacer10Height,
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "Age: ${blockProvider.inventoryItems.passenger.age}"),
                                                      spacer20Width,
                                                      Text(
                                                          "Gender: ${blockProvider.inventoryItems.passenger.gender}"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            trailing: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: appColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 4),
                                                      child: Text(
                                                        "₹ ${blockProvider.inventoryItems.fare}",
                                                        style:
                                                            GoogleFonts.inter(
                                                                color:
                                                                    whiteColor,
                                                                fontSize: 13),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                      "Seat No. ${blockProvider.inventoryItems.seatName}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              spacer40Height,
                            ],
                          ),
                        ),
                        Positioned(
                            top: -57,
                            child: Container(
                              child: Lottie.asset(
                                  "assets/lottie/paySuccesful.json"),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              width: 30.w,
                              height: 15.h,
                            ))
                      ]),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                              // topLeft: Radius.circular(8),
                              // topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            spacer10Height,
                            Row(
                              children: [
                                spacer5Width,
                                Checkbox(
                                  checkColor: whiteColor,
                                  fillColor: MaterialStateProperty.all<Color>(
                                      appColor),
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = !_isChecked;
                                    });
                                  },
                                ),
                                const Text(
                                    "Please verify before cancelling your seat")
                              ],
                            ),
                            spacer10Height,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: CustomBottomButton(
                                color: whiteColor,
                                loader: busProvider.loading,
                                title: "Cancel Booking",
                                onTap: () {
                                  print("User$userSeat");
                                  _isChecked
                                      ? busProvider.seatCancelTicket(
                                          blockProvider.tin.toString(),
                                          userSeat,
                                          context)
                                      : Utils.toastMessage(
                                          "Please select the checkBox");
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5.0),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const MainScreen()));
                                },
                                child: Container(
                                  height: 7.3.h,
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.all(fixPadding * 1.2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: app6Color,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text("Home",
                                      style: GoogleFonts.inter(
                                        color: whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        //: 'NunitoSans',
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.only(top: 16),
                  //           height: 12,
                  //           width: 12,
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               border: Border.all(
                  //                   width: 1.5, color: Colors.greenAccent)),
                  //         ),
                  //         spacer10Width,
                  //         Text(
                  //           blockProvider.sourceCity,
                  //           style: GoogleFonts.inter(
                  //             color: blackColor,
                  //             fontSize: 14,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //     Dash(
                  //         direction: Axis.vertical,
                  //         length: 10.h,
                  //         dashLength: 10,
                  //         dashColor: greyColor),
                  //     Row(
                  //       children: [
                  //         Container(
                  //           height: 12,
                  //           width: 12,
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.rectangle,
                  //               border: Border.all(width: 2, color: redColor)),
                  //           child: Container(
                  //             height: 20,
                  //           ),
                  //         ),
                  //         spacer10Width,
                  //         Text(
                  //           blockProvider.sourceCity,
                  //           style: GoogleFonts.inter(
                  //             color: blackColor,
                  //             fontSize: 14,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  spacer30Height
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomNameTile extends StatelessWidget {
//   String title, subtitle;
//   CustomNameTile({Key key, this.title, this.subtitle}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 3, bottom: 2),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Text(
//               title,
//               style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w600, fontSize: 10.sp),
//             ),
//           ),
//           // spacer20Width,
//           Expanded(
//             flex: 3,
//             child: Text(
//               subtitle,
//               style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w500, fontSize: 10.sp),
//               maxLines: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
