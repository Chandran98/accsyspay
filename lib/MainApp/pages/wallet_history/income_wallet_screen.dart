// ignore_for_file: void_checks, avoid_print

import 'package:Accsys_Pay/MainApp/constant/data_constant.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/MainApp/utils/shimmer_List.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/Internet connectivity/Network_status.dart';
import '../../utils/card/custom_transcation_card.dart';
import '../main_screen.dart';

import 'package:Accsys_Pay/MainApp/Theme/colors/colors.dart';

class InflowWalletHistoryScreen extends StatefulWidget {
  const InflowWalletHistoryScreen({Key key}) : super(key: key);

  @override
  State<InflowWalletHistoryScreen> createState() =>
      _InflowWalletHistoryScreenState();
}

class _InflowWalletHistoryScreenState extends State<InflowWalletHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
  }
  // Future<List<WalletHistoryModel>> postWalletHistory() async {
  //   final PrefService prefService = PrefService();
  //   var userId = await prefService.getUserId("userid");
  //   print(userId);
  //   final apiUrl = 'https://accsyspay.com/api/walletHistory';
  //   final body = {'user_id': userId};

  //   try {
  //     final response = await http.post(Uri.parse(apiUrl), body: body);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       final jsonData = jsonDecode(response.body) as List<dynamic>;
  //       print(jsonData);
  //       final walletHistoryList = jsonData
  //           .map((history) => WalletHistoryModel.fromJson(history))
  //           .toList();
  //           print("object");
  //       print(walletHistoryList.map((e) => e.amount).reduce((value, element) => element+value));
  //       print("objectsdsdd");
  //       return walletHistoryList;
  //     } else {
  //       Utils.toastMessage('Failed to load wallet history');
  //     }
  //   } catch (e) {
  //     // throw Exception('Failed to connect to server: $e');
  //     print('Failed to connect to server: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var walletProvider = Provider.of<WalletProvider>(context);
    void onBack() {
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    }

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
                          itemCount:
                              walletProvider.walletInflowHistoryList.length,
                          itemBuilder: (context, index) {
                            final data =
                                walletProvider.walletInflowHistoryList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30),
                                          ),
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 150.0,
                                                    vertical: 8),
                                                child: Divider(
                                                  // color: Colors.grey,
                                                  thickness: 3,
                                                ),
                                              ),
                                              spacer30Height,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 18.0),
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
                                                          "Order Id",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  // color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green
                                                                    .shade200,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                  vertical: 4),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/icons/success.png",
                                                                    scale: 20,
                                                                  ),
                                                                  spacer5Width,
                                                                  Text(
                                                                    "success",
                                                                    style: GoogleFonts.inter(
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    spacer10Height,
                                                    Text(
                                                      data.description,
                                                      style: GoogleFonts.inter(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    ),
                                                    spacer20Height,
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 18.0),
                                                      child: Divider(),
                                                    ),
                                                    spacer20Height,
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .timelapse_outlined,
                                                                    color:
                                                                        PrimaryColor,
                                                                  ),
                                                                  spacer5Width,
                                                                  Text(
                                                                      "Created at")
                                                                ],
                                                              ),
                                                              Text(
                                                                  data
                                                                      .createdAt,
                                                                  style: GoogleFonts
                                                                      .inter(
                                                                          // color: Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w700)),
                                                            ],
                                                          ),
                                                          spacer20Height,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    LineIcons
                                                                        .wallet,
                                                                    color:
                                                                        PrimaryColor,
                                                                  ),
                                                                  spacer5Width,
                                                                  Text(
                                                                      "Amount"),
                                                                ],
                                                              ),
                                                              Text(
                                                                "₹ ${data.amount.toString()}",
                                                                style: data.mode ==
                                                                        0
                                                                    ? GoogleFonts.inter(
                                                                        color:
                                                                            redColor,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700)
                                                                    : GoogleFonts
                                                                        .inter(
                                                                        color:
                                                                            greenColor,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 18.0),
                                                      child: Divider(),
                                                    ),
                                                    spacer20Height,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                            child: Column(
                                                          children: [
                                                            Text(
                                                              "Open Balance",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      // color: Colors.black,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                            ),
                                                            spacer5Height,
                                                            Text(
                                                                data.openBal
                                                                    .toString(),
                                                                style: GoogleFonts.inter(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ],
                                                        )),
                                                        Expanded(
                                                            child: Column(
                                                          children: [
                                                            Text(
                                                              "Close Balance",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      // color: Colors.black,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                            ),
                                                            spacer5Height,
                                                            Text(
                                                                data.closeBal
                                                                    .toString(),
                                                                style: GoogleFonts.inter(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
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
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12),
                                                            )),
                                                        Expanded(
                                                          flex: 1,
                                                          child: InkWell(
                                                            onTap: () {
                                                              launch(
                                                                  "tel: 8069050505");
                                                            },
                                                            child: Container(
                                                              height: 6.h,
                                                              width: 8.w,
                                                              child: const Icon(
                                                                Icons.call,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    PrimaryColor,
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
                                  },
                                  child: CustomTransactionCard(
                                    data: data,
                                  )),
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
}

class Customchip extends StatelessWidget {
  String title;
  Function onTap;
  Color color;
  Customchip({Key key, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: color),
          height: 50,
          width: 120,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
