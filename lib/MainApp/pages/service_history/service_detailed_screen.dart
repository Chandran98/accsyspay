import 'package:Accsys_Pay/MainApp/pages/setting_screen/faq_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../pages/screens.dart';
import '../../Models/service_history_modal.dart';
import '../../provider/themeprovider.dart';
import '../../utils/hover_message.dart';
import '../../utils/main_app_utils.dart';

class TransactionDetailScreen extends StatefulWidget {
  Detail data;
  TransactionDetailScreen({Key key, this.data}) : super(key: key);

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const FaqScreen()));
                            },
                            child: const Icon(Icons.info))
                      ],
                    ),
                  ),
                ),
                Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 47.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.darkTheme ? black : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacer40Height,
                              spacer50Height,
                              DetailsTile(
                                  title: widget.data.category,
                                  amount: widget.data.amount.toString(),
                                  subtitle: widget.data.account,
                                  created: widget.data.createdAt),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        spacer10Height,
                                        Text(
                                          "Bill Details",
                                          style: GoogleFonts.inter(
                                              // color: Colors.black,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        spacer20Height,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Wallet Amount",
                                              style: GoogleFonts.inter(
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "₹ ${widget.data.walletAmount}",
                                              style: GoogleFonts.inter(
                                                  // color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        spacer10Height,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Voucher Amount",
                                              style: GoogleFonts.inter(
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "₹ ${widget.data.voucherAmount}",
                                              style: GoogleFonts.inter(
                                                  // color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        spacer10Height,
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(),
                                        ),
                                        // Row(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       "Handling Charges",
                                        //       style: GoogleFonts.inter(
                                        //           color: Colors.grey),
                                        //     ),
                                        //     Text(
                                        //       "₹ 2",
                                        //       style: GoogleFonts.inter(
                                        //           // color: Colors.black,
                                        //           fontWeight: FontWeight.w700),
                                        //     )
                                        //   ],
                                        // ),
                                        spacer20Height,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: GoogleFonts.inter(
                                                  // color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "₹ ${widget.data.amount}",
                                              style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  // color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  spacer10Height,
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: -57,
                          child: Container(
                            child:
                                Lottie.asset("assets/lottie/paySuccesful.json"),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PrimaryColor,
                            ),
                            width: 30.w,
                            height: 15.h,
                          ))
                    ]),
                spacer10Height,
                Container(
                    // height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.darkTheme ? black : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spacer20Height,
                            Text(
                              "Payment Details",
                              style: GoogleFonts.inter(
                                  // color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            spacer20Height,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Transaction ID",
                                          style: GoogleFonts.inter(
                                              // color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        spacer5Height,
                                        Text(
                                          widget.data.payId,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                              color: Colors.grey,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                              text: widget.data.payId));
                                          Utils.snackbar(
                                              'Transaction ID copied', context);
                                        },
                                        child: Icon(
                                          CupertinoIcons.doc_on_clipboard_fill,
                                          size: 2.4.h,
                                          color: appColor,
                                        ))
                                  ],
                                ),
                                spacer20Height,
                                // Expanded(flex: 1,child: Container(width: 1,color: white,height: 30,)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Reference ID",
                                      style: GoogleFonts.inter(
                                          // color: Colors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    spacer5Height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.data.orderNo,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            color: Colors.grey,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: widget.data.orderNo));
                                              Utils.snackbar(
                                                  'Reference ID copied',
                                                  context);
                                            },
                                            child: Icon(
                                              CupertinoIcons
                                                  .doc_on_clipboard_fill,
                                              size: 2.4.h,
                                              color: appColor,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            spacer20Height,
                            spacer10Height,
                            Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: Text(
                                      "If you need any support, please Contact support team",
                                      style: GoogleFonts.inter(
                                          color: Colors.grey.shade600,
                                          fontSize: 9.sp),
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
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsTile extends StatelessWidget {
  String title, subtitle, amount, created;
  DetailsTile({Key key, this.title, this.created, this.subtitle, this.amount});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                        // color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  spacer10Height,
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(color: Colors.grey.shade600),
                  ),
                  spacer10Height,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "₹ ${amount}",
                    style: GoogleFonts.inter(
                        // color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  spacer10Height,
                  Text(
                    created,
                    style: GoogleFonts.inter(color: Colors.grey.shade600),
                  )
                ],
              )
            ],
          ),
        ),
        spacer10Height,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        )
      ],
    );
  }
}
