import 'package:Accsys_Pay/pages/screens.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Models/wallet_model.dart';
import '../Theme/colors/colors.dart';
import '../component/banner_widget.dart';
import '../component/home_screen_widgets.dart';
import '../component/services_widget.dart';
import '../pages/main_screen.dart';
import '../pages/notification_screen.dart';
import '../pages/razor_Pay_screen.dart';
import '../pages/receive_screen.dart';
import '../pages/wallet_history/transaction_history_screen.dart';
import '../provider/auth_provider.dart';
import '../provider/dth_provider.dart';
import '../provider/themeprovider.dart';
import '../provider/wallet_provider.dart';
import '../utils/Internet connectivity/Network_status.dart';
import '../utils/dragable_switch.dart';
import '../utils/main_app_utils.dart';

class HomeSide extends StatefulWidget {
  const HomeSide({Key key}) : super(key: key);
  @override
  State<HomeSide> createState() => _HomeSideState();
}

class _HomeSideState extends State<HomeSide> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WalletProvider>(context, listen: false).walletBalance();

    Provider.of<AuthProvider>(context, listen: false).getProfileInfo();
    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
    super.initState();
  }

  void onBack() {
    AwesomeDialog(
      context: context,
      // dialogType: DialogType.error,
      borderSide: BorderSide(color: whiteColor, width: 2),
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
  String _getGreetingMessage() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 19) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 35.h,
                      color: appColor,
                      child: Column(
                        children: [
                          spacer30Height,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: RichText(
                                      text: TextSpan(
                                          text: "${_getGreetingMessage()}\n",
                                          style: GoogleFonts.inter(
                                              fontSize: 21.sp,
                                              fontWeight: FontWeight.w500,
                                              color: whiteColor),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text: profileInfo.profileData == null
                                              ? ""
                                              : profileInfo.profileData.name,
                                          style: GoogleFonts.inter(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: whiteColor),
                                        )
                                      ])),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
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
                                            child: const NotificationScreen(),
                                            type:
                                                PageTransitionType.rightToLeft,
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
                                ),

                                // Row(
                                //   children: [
                                //     spacer10Width,
                                //    ],
                                // ),
                              ],
                            ),
                          ),
                          spacer40Height,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: theme.darkTheme
                                  //     ? Colors.black
                                  //     : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8)),
                              // color: white,
                              // height: 145,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   "Recommended",
                                    //   style: GoogleFonts.inter(
                                    //       fontSize: 13.sp,
                                    //       fontWeight: FontWeight.w600),
                                    // ),
                                    // spacer10Height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AddMoneyWidget(
                                          image: 'assets/icons/1.png',
                                          title: "Add Money",
                                          page: const AddMoneyScreen2(),
                                        ),
                                        AddMoneyWidget(
                                          image: 'assets/icons/2.png',
                                          title: "Send",
                                          // page: QrImageScan(),

                                          page: const AddMoneyScreen2(),
                                        ),
                                        AddMoneyWidget(
                                          image: 'assets/icons/3.png',
                                          title: "Voucher",
                                          page: ReceiverScreen(),
                                        ),
                                        AddMoneyWidget(
                                          image: 'assets/icons/4.png',
                                          title: "History",
                                          page:
                                              const TransactionHistoryScreen(),
                                        ),
                                      ],
                                    ),
                                    // spacer10Height,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacer20Height,
                    BannerComponent(),
                    spacer20Height,
                    SendReceiveSwitch(),
                    spacer20Height,
                    const ServiceWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
