// ignore_for_file: prefer_const_constructors

import 'package:Accsys_Pay/MainApp/pages/notification_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/razor_Pay_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/receive_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/dth_screens/dth_pans_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/service_history/service_history_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/setting_screen/faq_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/wallet_history/transaction_history_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/charts/Transaction_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../pages/screens.dart';
import '../Models/wallet_model.dart';
import '../component/banner_widget.dart';
import '../component/home_screen_widgets.dart';
import '../component/services_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../provider/auth_provider.dart';
import '../provider/themeprovider.dart';
import '../utils/Internet connectivity/Network_status.dart';
import '../utils/dragable_switch.dart';
import '../utils/main_app_utils.dart';
import 'main_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../component/scanner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onBack() {
    AwesomeDialog(
      context: context,
      // dialogType: DialogType.error,
      borderSide: const BorderSide(color: white, width: 2),
      width: 350,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.LEFTSLIDE,
      title: 'Exit',
      desc: 'Are sure you want to exit...',

      showCloseIcon: true,
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const MainScreen()));
      },
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
    ).show();
  }

  String location;
  List<WAOperationsModel> operationsList = waOperationList();
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WalletProvider>(context, listen: false).walletBalance();

    Provider.of<AuthProvider>(context, listen: false).getProfileInfo();
    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
    super.initState();
  }

  // getTime() {
  //   var hour = DateTime.now().hour;
  //   if (hour >= 5 && hour < 12) {
  //     Text('Good Morning');
  //   } else if (hour >= 12 && hour < 17) {
  //     Text('Good Afternoon');
  //   } else {
  //     Text('Good Evening');
  //   }
  // }

  bool balance = false;
  @override
  Widget build(BuildContext context) {
    var balanceProvider = Provider.of<WalletProvider>(context, listen: false);

    // print("$getTime()");
    var theme = Provider.of<ThemeProvider>(context);
    var profileInfo = Provider.of<AuthProvider>(context);
    var dthPlan = Provider.of<DthProvider>(context, listen: false);
    return WillPopScope(
        onWillPop: () {
          onBack();
          return Future.value(false);
        },
        child: NetworkSensitive(
          child: RefreshIndicator(
            displacement: 50,
            backgroundColor: Colors.white,
            color: appColor,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {},
            child: SafeArea(
              child: Scaffold(
                backgroundColor: theme.darkTheme
                    ? appColor.withOpacity(0.1)
                    : Colors.grey.shade100,
                // : Color(0xFF8ea4d2).withOpacity(0.2),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spacer20Height,
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        theme.darkTheme
                                            ? "assets/images/logo/accsys_black.png"
                                            : "assets/images/logo/accsys_black.png",
                                        width: 13.h,
                                      ),
                                      Row(
                                        children: [
                                          // Container(
                                          //   decoration:  const BoxDecoration(
                                          //       color: Colors.white,
                                          //       shape: BoxShape.circle),
                                          //   width: 50.0,
                                          //   child: IconButton(
                                          //       onPressed: () {
                                          //         theme.toggleTheme();
                                          //       },
                                          //       icon: theme.darkTheme
                                          //           ? const Icon(
                                          //               CupertinoIcons.moon_stars,
                                          //               color: PrimaryColor,
                                          //               size: 32,
                                          //             )
                                          //           : const Icon(
                                          //               CupertinoIcons.sun_min,
                                          //               color: PrimaryColor,
                                          //               size: 32,
                                          //             )),

                                          //   // child: IconButton(
                                          //   //   padding: EdgeInsets.zero,
                                          //   //   onPressed: () {},
                                          //   //   icon: Image.asset(
                                          //   //     'assets/icons/scan.png',
                                          //   //     height: 40.0,
                                          //   //     width: 40.0,
                                          //   //   ),
                                          //   // ),
                                          // ),
                                          spacer10Width,
                                          // Container(
                                          //   decoration: const BoxDecoration(
                                          //       color: Colors.white,
                                          //       shape: BoxShape.circle),
                                          //   width: 50.0,
                                          //   child: IconButton(
                                          //     padding: EdgeInsets.zero,
                                          //     onPressed: () {
                                          //       Navigator.push(
                                          //           context,
                                          //           MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   QrImageScan()));
                                          //     },
                                          //     icon: Image.asset(
                                          //       'assets/icons/scan.png',
                                          //       height: 40.0,
                                          //       width: 40.0,
                                          //     ),
                                          //   ),
                                          // ),

                                          spacer10Width,
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            width: 50.0,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                // balanceProvider.getKaitPrice();
                                                // dthPlan.dthFetchPlan("36");
                                                Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    child:
                                                        const NotificationScreen(),
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                  ),
                                                );
                                              },
                                              icon: Lottie.asset(
                                                'assets/lottie/notification.json',
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                spacer20Height,
                                // Text("$getTime() Chandran")
                                // Padding(
                                //   padding: const EdgeInsets.only(left:16.0),
                                //   child: RichText(
                                //   text: TextSpan(
                                //     text: 'Pay Safetly, Securely with\n ',
                                //     style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 18,color: black),
                                //     children:  <TextSpan>[

                                //       TextSpan(text: 'Vairaa', style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: appColor)),
                                //       TextSpan(text: ' Pay!'),
                                //     ],
                                //   ),
                                // ),
                                // )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: theme.darkTheme
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 14),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Balance",
                                                  style: GoogleFonts.inter(
                                                      // color: Colors.grey,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 18.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: PrimaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      child: Text(
                                                        " Dashboard ",
                                                        style:
                                                            GoogleFonts.inter(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  // balance == "null"
                                                  //     ? "-----"
                                                  //     :
                                                  balance
                                                      ? "₹ ${balanceProvider.balance.toString() == "null" ? "0" : balanceProvider.balance.toString()}"
                                                      : "₹ *****",
                                                  style: GoogleFonts.inter(
                                                      // color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      balance = !balance;
                                                    });
                                                  },
                                                  icon: balance
                                                      ? const Icon(
                                                          FeatherIcons.eye,
                                                          size: 20,
                                                        )
                                                      : const Icon(
                                                          FeatherIcons.eyeOff,
                                                          size: 20,
                                                        ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      spacer10Height,
                                                      Text(
                                                        "Income",
                                                        style:
                                                            GoogleFonts.inter(
                                                                // color: Colors.grey,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      spacer10Height,
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 2.1.h,
                                                            width: 4.2.w,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF074aa1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                            child: Center(
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .arrow_down_left,
                                                                color: white,
                                                                size: 2.h,
                                                              ),
                                                            ),
                                                          ),
                                                          spacer5Width,
                                                          Text(
                                                            // balance == "null"
                                                            //     ? "-----"
                                                            //     :
                                                            balance
                                                                ? "₹ ${balanceProvider.totalInflowAmount.toString() == "null" ? "0" : balanceProvider.totalInflowAmount}"
                                                                : "₹ *****",
                                                            style: GoogleFonts
                                                                .inter(
                                                                    // color: Colors.black,
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      spacer10Height,
                                                      Text(
                                                        "Expenses",
                                                        style:
                                                            GoogleFonts.inter(
                                                                // color: Colors.grey,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      spacer10Height,
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 2.1.h,
                                                            width: 4.2.w,
                                                            decoration: BoxDecoration(
                                                                color: appColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                            child: Center(
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .arrow_up_right,
                                                                color: white,
                                                                size: 2.h,
                                                              ),
                                                            ),
                                                          ),
                                                          spacer5Width,
                                                          Text(
                                                            balance
                                                                ? "₹ ${balanceProvider.totalOutflowAmount.toString() == "null" ? "0" : balanceProvider.totalOutflowAmount}"
                                                                : "₹ *****",
                                                            style: GoogleFonts
                                                                .inter(
                                                                    // color: Colors.black,
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TransactionChart()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        theme.darkTheme ? Colors.black : white,
                                    borderRadius: BorderRadius.circular(8)),
                                // color: white,
                                // height: 145,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recommended",
                                        style: GoogleFonts.inter(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      spacer10Height,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AddMoneyWidget(
                                            image:
                                                'assets/icons/iconwallet.png',
                                            title: "Add Money",
                                            page: const AddMoneyScreen2(),
                                          ),
                                          AddMoneyWidget(
                                            image: 'assets/icons/mt.png',
                                            title: "Send",
                                            // page: QrImageScan(),

                                            page: const AddMoneyScreen2(),
                                          ),
                                          AddMoneyWidget(
                                            image: 'assets/icons/rupee1.png',
                                            title: "Voucher",
                                            page: ReceiverScreen(),
                                          ),
                                          AddMoneyWidget(
                                            image: 'assets/icons/history1.png',
                                            title: "History",
                                            page:
                                                const TransactionHistoryScreen(),
                                          ),
                                        ],
                                      ),
                                      spacer10Height,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //       decoration: BoxDecoration(
                            //           color: theme.darkTheme ? Colors.black : white,
                            //           borderRadius: BorderRadius.circular(8)),child: BannerComponent()),
                            // ),
                            BannerComponent(),
                            spacer20Height,
                            SendReceiveSwitch(),
                            spacer20Height,
                            const ServiceWidget(),

                            // Service2Widget(title:"DTH" ,image: "assets/icons/dth.png",id: "4",),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
