import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../pages/screens.dart';
import '../../../provider/bus_provider.dart';
import '../../../provider/wallet_provider.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/clipper/ticket_clipper.dart';
import '../../../utils/main_app_utils.dart';

class BlockTicketPage extends StatefulWidget {
  const BlockTicketPage({Key key}) : super(key: key);

  @override
  State<BlockTicketPage> createState() => _BlockTicketPageState();
}

class _BlockTicketPageState extends State<BlockTicketPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<WalletProvider>(context, listen: false).walletBalance();
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    final blockProvider = Provider.of<BusBookingProvider>(context);

    var theme = Provider.of<ThemeProvider>(context);
    var wallet = Provider.of<WalletProvider>(context);
    var walletAmount = wallet.balance == null ? 0.toString() : wallet.balance;

    var fareAmount = double.parse(blockProvider.totalFare);

    var wAmount = double.parse(walletAmount);
    var payAmount = wAmount - fareAmount;
    var balance = wAmount - payAmount;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: appColor,
        //   iconTheme: IconThemeData(color: white),
        //   title: Text(
        //     "Review Booking",
        //     style: GoogleFonts.inter(
        //         color: theme.darkTheme ? Colors.black : Colors.white),
        //   ),
        // ),
        body: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: "Review Booking",
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 8),
                      child: ClipPath(
                          clipper: TicketClipper(right: 50, holeRadius: 20),
                          child: Container(
                            height: 15.h,
                            color: appColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spacer5Height,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(blockProvider.travelsName,
                                            style: GoogleFonts.inter(
                                                color: white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                                blockProvider.journeyDate
                                                    .toString(),
                                                style: GoogleFonts.inter(
                                                    color: white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  spacer10Height,
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.sp/,
                                    children: [
                                      // Icon(
                                      //   CupertinoIcons.location_solid,
                                      //   color: white,
                                      // ),
                                      Text("${blockProvider.sourceCity} ---  ",
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                        blockProvider.destinationCity,
                                        style: TextStyle(color: white),
                                      ),
                                    ],
                                  ),
                                  // spacer10Height,

                                  spacer10Height,
                                  Row(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            LineIcons.wallet,
                                            color: white,
                                          ),
                                          spacer10Width,
                                          Text(
                                            "My wallet",
                                            style: TextStyle(color: white),
                                          )
                                        ],
                                      ),
                                      spacer10Width,
                                      Text(wallet.balance ?? 0.toString(),
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    // spacer20Height,
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    //   child: Container(
                    //       decoration: BoxDecoration(
                    //           color: white, borderRadius: BorderRadius.circular(14)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(15.0),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             // Text("Travels Details",
                    //             //     style: GoogleFonts.inter(
                    //             //         color: black,
                    //             //         fontSize: 17,
                    //             //         fontWeight: FontWeight.w600)),
                    //             spacer5Height,
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Expanded(
                    //                   flex: 2,
                    //                   child: Text(blockProvider.travelsName,
                    //                       style: GoogleFonts.inter(
                    //                           color: black,
                    //                           fontSize: 17,
                    //                           fontWeight: FontWeight.w600)),
                    //                 ),
                    //                 Expanded(
                    //                   flex: 1,
                    //                   child: Center(
                    //                     child: Container(
                    //                       decoration: BoxDecoration(
                    //                           color: appColor,
                    //                           borderRadius: BorderRadius.circular(8)),
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(5.0),
                    //                         child: Text(
                    //                             blockProvider.journeyDate.toString(),
                    //                             style: GoogleFonts.inter(
                    //                                 color: white,
                    //                                 fontSize: 14,
                    //                                 fontWeight: FontWeight.w600)),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             spacer10Height,
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Text(blockProvider.sourceCity,
                    //                     style: GoogleFonts.inter(
                    //                         color: black,
                    //                         fontSize: 13,
                    //                         fontWeight: FontWeight.w500)),
                    //                 const Text(" =====>"),
                    //                 Text(blockProvider.destinationCity),
                    //               ],
                    //             ),
                    //             // spacer10Height,

                    //             spacer30Height,
                    //             Row(
                    //               children: [
                    //                 Row(
                    //                   children: const [
                    //                     Icon(
                    //                       LineIcons.wallet,
                    //                       color: appColor,
                    //                     ),
                    //                     spacer10Width,
                    //                     Text("My wallet")
                    //                   ],
                    //                 ),
                    //                 spacer10Width,
                    //                 Text(
                    //                     wallet.balance == null
                    //                         ? 0.toString()
                    //                         : wallet.balance,
                    //                     style: GoogleFonts.inter(
                    //                         // color: black,
                    //                         fontSize: 17,
                    //                         fontWeight: FontWeight.w600)),
                    //                 const SizedBox(
                    //                   width: 20,
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       )),
                    // ),
                    spacer20Height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spacer10Height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Block Ticket Id"),
                                    Text(blockProvider.blockTicketKey),
                                  ],
                                ),
                                spacer20Height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Total Fare"),
                                    Text(fareAmount.toString(),
                                        style: GoogleFonts.inter(
                                            // color: black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                spacer10Height,
                                Divider(),
                                spacer20Height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Wallet Amount"),
                                    Text(balance.toStringAsFixed(3).toString(),
                                        style: GoogleFonts.inter(
                                            // color: black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                spacer10Height
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  color: white,
                  height: 17.h,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          spacer5Width,
                          Checkbox(
                            checkColor: white,
                            fillColor:
                                MaterialStateProperty.all<Color>(appColor),
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
                          ),
                          const Text("Pay securely through Accsys Pay wallet")
                        ],
                      ),
                      spacer10Height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: CustomBottomButton(
                          color: white,
                          loader: blockProvider.loading,
                          title: "Book Seat",
                          onTap: () {
                            _isChecked
                                ? blockProvider.seatBookTicket(
                                    fareAmount.toString(),
                                    balance.toStringAsFixed(3).toString(),
                                    context)
                                : Utils.toastMessage(
                                    "Please select the checkBox");
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
