import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/amountpaid.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/plan_package/plans_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/data_constant.dart';
import '../../../provider/recharge_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/Card.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/main_app_utils.dart';
import '../mobile_pin_screen.dart';

class PostpaidPageScreen extends StatefulWidget {
  const PostpaidPageScreen({Key key}) : super(key: key);

  @override
  State<PostpaidPageScreen> createState() => _PostpaidPageScreenState();
}

class _PostpaidPageScreenState extends State<PostpaidPageScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RechargeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RechargeProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    var postPaid =
        Provider.of<RechargeProvider>(context, listen: false).postpaid;
    void onBack() {
      // ignore: prefer_const_constructors
      Navigator.of(context).pop();
    }

    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.darkTheme?appColor.withOpacity(0.1): const Color(0xFFEFF3FD),
          // appBar: AppBar(),

          body: provider.postpaidStatus == "error"
              ? const Center(
                  child: Text("Error"),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Account Info",
                        ),
                        Container(
                          decoration: boxDecoration(
                            radius: 10,
                            showShadow: true,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: ListTile(
                              tileColor: theme.darkTheme?black:white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              subtitle: Text(
                                provider.mobile,
                                style:  GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Sticky.getColorItem()),
                                child: Center(
                                    child: Text(
                                  postPaid.details.name[0],
                                  style:  GoogleFonts.inter(
                                      color: white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              title: Text(
                                postPaid.details.name,
                                style:  GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacer10Height,
                        Container(
                          decoration: BoxDecoration(
                              color: theme.darkTheme?black:white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 6),
                                  child: Text(
                                    "Bill Details",
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                spacer20Height,
                                // TabCard(
                                //   titletext: "Bill Amount",
                                //   text: postPaid.details.amount,
                                // ),
                                TabCard(
                                  titletext: "Name",
                                  text: postPaid.details.name,
                                ),
                                TabCard(
                                  titletext: "Bill Date",
                                  text: postPaid.details.billFetch.billDate,
                                ),
                                TabCard(
                                  titletext: "Due Date",
                                  text: postPaid.details.dueDate,
                                ),
                                spacer20Height,
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(
                                        "Amount",
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: theme.darkTheme?appColor.withOpacity(0.1):const Color(0xFFEFF3FD),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 70,
                                        width: 150,
                                        child: Center(
                                          child: Text(
                                            postPaid.details.amount,
                                            style:  GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(postPaid.details.billDate),
                              ],
                            ),
                          ),
                        ),
                        spacer50Height,
                        InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          onTap: () {
                            // showModalBottomSheet(
                            //     context: context,
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(25)),
                            //     builder: (builder) {
                            //       return RechargePaymentPage(
                            //         amount: postPaid.details.amount,
                            //       );
                            //     });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MobileAuthenticateScreen(
                                        amount: postPaid.details.amount)));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(fixPadding * 1.2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: PrimaryColor.withOpacity(0.4),
                              //     spreadRadius: 2,
                              //     blurRadius: 2,
                              //   ),
                              // ],
                            ),
                            child: Text(
                              'Proceed',
                              style: white22BoldTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
