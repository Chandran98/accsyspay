// ignore_for_file: void_checks, avoid_print

import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/MainApp/utils/shimmer_List.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provider/themeprovider.dart';
import '../../utils/Internet connectivity/Network_status.dart';
import '../../utils/card/custom_transcation_card.dart';
import '../main_screen.dart';

import 'package:Accsys_Pay/MainApp/Theme/colors/colors.dart';

class WalletHistoryScreen extends StatefulWidget {
  const WalletHistoryScreen({Key key}) : super(key: key);

  @override
  State<WalletHistoryScreen> createState() => _WalletHistoryScreenState();
}

class _WalletHistoryScreenState extends State<WalletHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
  }

  @override
  Widget build(BuildContext context) {
    var walletProvider = Provider.of<WalletProvider>(context);
    void onBack() {
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    }

    var theme = Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: NetworkSensitive(
        child: SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              spacer20Height,
              Expanded(
                child: Container(
                  child: walletProvider.loading
                      ? const TransactionShimmerList()
                      : ListView.builder(
                          itemCount: walletProvider.walletHistoryList.length,
                          itemBuilder: (context, index) {
                            final data =
                                walletProvider.walletHistoryList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  detailsSheet(data);
                                },
                                child: CustomTransactionCard(data: data),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          )
              //   }
              // },
              ),
        ),
      ),
    );
  }

  void detailsSheet(data) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 8),
                child: Divider(
                  // color: Colors.grey,
                  thickness: 3,
                ),
              ),
              spacer30Height,
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order Id",
                          style: GoogleFonts.inter(
                              // color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/success.png",
                                    scale: 2.4.h,
                                  ),
                                  spacer5Width,
                                  Text(
                                    "success",
                                    style: GoogleFonts.inter(
                                        fontSize: 11.sp, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // SizedBox(height: 5.9.h),
                    spacer10Height,
                    Text(
                      data.description,
                      style: GoogleFonts.inter(
                          color: Colors.grey, fontSize: 10.sp),
                    ),
                    // SizedBox(height: 2.h),
                    spacer20Height,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                    spacer20Height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.timelapse_outlined,
                                    color: PrimaryColor,
                                  ),
                                  spacer10Width,
                                  Text("Created at")
                                ],
                              ),
                              Text(data.createdAt,
                                  style: GoogleFonts.inter(
                                      // color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          spacer20Height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    LineIcons.wallet,
                                    color: PrimaryColor,
                                  ),
                                  spacer10Width,
                                  Text("Amount"),
                                ],
                              ),
                              Text(
                                "₹ ${data.amount.toString()}",
                                style: data.mode == 0
                                    ? GoogleFonts.inter(
                                        color: redColor,
                                        fontSize: 15.6.sp,
                                        fontWeight: FontWeight.w700)
                                    : GoogleFonts.inter(
                                        color: greenColor,
                                        fontSize: 15.6.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(),
                    ),
                    spacer20Height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Open Balance",
                              style: GoogleFonts.inter(
                                  // color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            spacer5Height,
                            Text(data.openBal.toString(),
                                style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Close Balance",
                              style: GoogleFonts.inter(
                                  // color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            spacer5Height,
                            Text(data.closeBal.toString(),
                                style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ))
                      ],
                    ),
                    spacer20Height,
                    const Divider(),
                    spacer10Height,
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Text(
                              "If you need any support, please Contact support team",
                              style: GoogleFonts.inter(
                                  color: Colors.grey.shade700, fontSize: 9.sp),
                            )),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              launch("tel: 8069050505");
                            },
                            child: Container(
                              height: 6.h,
                              width: 8.w,
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: PrimaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
