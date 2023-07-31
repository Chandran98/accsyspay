// ignore_for_file: must_be_immutable

import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:sizer/sizer.dart';
import '../../pages/screens.dart';
import '../Theme/text_style.dart';
import '../constant/colors/colors.dart';
import '../pages/bus_booking/bus_screen/1_search_cities.dart';
import '../pages/recharge/dth_screens/1_dth_billers.dart';
import '../pages/recharge/fastag_screens/1_biller_list.dart';
import '../pages/recharge/prepaid_recharge/mobile_recharge.dart';
import '../pages/recharge/dth_screens/4_dth_recharge_screen.dart';
import '../provider/bus_provider.dart';
import '../provider/themeprovider.dart';
import '../provider/utilty_provider.dart';

class SendReceiveSwitch extends StatelessWidget {
  const SendReceiveSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dthProvider = Provider.of<DthProvider>(context);
    var walletProvider = Provider.of<WalletProvider>(context);

    var provider = Provider.of<UtilityProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 18, right: 13),
            child: Text(
              'Pre-Paid Services',
              style: GoogleFonts.inter(
                color: theme.darkTheme ? Colors.white : black,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: theme.darkTheme ? Colors.black : white,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(21.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrePaidServiceWidget(
                      theme: theme,
                      title: "Mobile",
                      image: "assets/icons/mobile35.png",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MobileRechargeScreen()));
                      },
                    ),
                    PrePaidServiceWidget(
                      theme: theme,
                      title: "DTH",
                      image: "assets/icons/dth35.png",
                      onTap: () {
                        walletProvider.getCharges();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DthBillerScreen(
                                id: "4",
                                title: "DTH",
                              );
                            },
                          ),
                        );
                      },
                    ),
                    PrePaidServiceWidget(
                      theme: theme,
                      title: "Fastag",
                      image: "assets/icons/toll.png",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => (FastagBillerScreen(
                                      id: "12",
                                      title: "Fastag",
                                    ))));
                        provider.fetchBillers("12");

                        walletProvider.getCharges();
                      },
                    ),
                    PrePaidServiceWidget(
                      theme: theme,
                      title: "Bus",
                      image: "assets/icons/bus1.png",
                      onTap: () {
                        Utils.toastMessage("coming soon");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const SearchCities()));
                      },
                    ),
                  ],
                ),
              ],
            ),

            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     InkWell(
            //       onTap: (){
            //         dthProvider.getAllDTHOperators();

            //         walletProvider.getCharges();
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return  DthBillerScreen(id: "4",
            //                         title: "DTH",);
            //             },
            //           ),
            //         );
            //       },
            //       child:
            //     DragTarget(
            //       builder: (context, List<int> candidateData, rejectedData) {
            //         return Container(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Center(
            //                 child: Container(height: 40,width: 40,
            //                   child: Image.asset(
            //                     "assets/icons/dth35.png",
            //                     scale: 10,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 3,
            //               ),
            //               Container(
            //                 margin: const EdgeInsets.only(top: 8),
            //                 child: Text(
            //                   "DTH\nRecharge",
            //                    style: GoogleFonts.inter(
            //                   color: theme.darkTheme ? Colors.white : black,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 13,
            //                 ),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       },
            //       onWillAccept: (data) {
            //         return true;
            //       },
            //       onAccept: (data) {
            //         dthProvider.getAllDTHOperators();

            //         walletProvider.getCharges();

            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return DthBillerScreen(
            //                 title: "DTH",
            //                 id: "4",
            //               );
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //      ),
            //     Draggable(
            //       data: 5,
            //       child: Container(
            //         width: 51,
            //         height: 51,
            //         padding: const EdgeInsets.all(15.0),
            //         decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //               colors: [
            //                 appColor.withOpacity(0.6),
            //                 Theme.of(context).primaryColor
            //               ],
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               stops: [0.3, 1]),
            //           shape: BoxShape.circle,
            //         ),
            //         child: const Icon(
            //           Icons.attach_money,
            //           color: white,
            //         ),
            //       ),
            //       feedback: Container(
            //         width: 51,
            //         height: 51,
            //         padding: const EdgeInsets.all(8.0),
            //         decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //               colors: [app7Color, Theme.of(context).primaryColor],
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               stops: [0.3, 1]),
            //           shape: BoxShape.circle,
            //         ),
            //         child: const Icon(
            //           Icons.attach_money,
            //           color: white,
            //         ),
            //       ),
            //       axis: Axis.horizontal,
            //       childWhenDragging: Container(
            //         width: 51,
            //         height: 51,
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return const MobileRechargeScreen();
            //             },
            //           ),
            //         );
            //       },
            //       child:
            //     DragTarget(
            //       builder: (context, List<int> candidateData, rejectedData) {
            //         return Container(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Container(height: 40,width: 40,child: Image.asset("assets/icons/mobile35.png")),
            //               const SizedBox(
            //                 height: 3,
            //               ),
            //               Container(
            //                 margin: const EdgeInsets.only(top: 8),
            //                 child: Text(
            //                   "Mobile\nRecharge",
            //                    style: GoogleFonts.inter(
            //                   color: theme.darkTheme ? Colors.white : black,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 13,
            //                 ),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       },
            //       onWillAccept: (data) {
            //         return true;
            //       },
            //       onAccept: (data) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return const MobileRechargeScreen();
            //             },
            //           ),
            //         );
            //       },
            //     ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

class PrePaidServiceWidget extends StatelessWidget {
  String image, title;
  Function onTap;
  PrePaidServiceWidget(
      {Key key, this.theme, this.image, this.onTap, this.title})
      : super(key: key);

  final ThemeProvider theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Column(children: [
            Container(
                decoration: const BoxDecoration(
                    // color: Colors.grey.shade100,
                    shape: BoxShape.circle),
                width: 12.w,
                height: 8.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    // color: PrimaryColor,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: theme.darkTheme ? Colors.white : black,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ])),
    );
  }
}
