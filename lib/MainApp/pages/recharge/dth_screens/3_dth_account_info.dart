// ignore_for_file: missing_return

import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/amountpaid.dart';
import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../pages/screens.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/data_constant.dart';
import '../../../provider/recharge_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/Card.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/main_app_utils.dart';
import '4_dth_recharge_screen.dart';
import '5_dth_pin_screen.dart';

class DthAccountInfoPage extends StatefulWidget {
  const DthAccountInfoPage({Key key}) : super(key: key);

  @override
  State<DthAccountInfoPage> createState() => _DthAccountInfoPageState();
}

class _DthAccountInfoPageState extends State<DthAccountInfoPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RechargeProvider>(context, listen: false);
  }

  final _amountController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DthProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    var dthProvider = provider.dthAccountDetails;
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
          backgroundColor: theme.darkTheme
              ? appColor.withOpacity(0.1)
              : const Color(0xFFEFF3FD),
          // appBar: AppBar(),

          body: provider.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: appColor,
                ))
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
                              tileColor: theme.darkTheme ? black : white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              subtitle: Text(
                                provider.dthAccount,
                                style: const TextStyle(
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
                                  dthProvider.details.customerName[0],
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              title: Text(
                                dthProvider.details.customerName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacer10Height,
                        Container(
                          decoration: BoxDecoration(
                              color: theme.darkTheme ? black : white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 6),
                                  child: Text(
                                    "Bill Details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                spacer20Height,
                                // TabCard(
                                //   titletext: "Bill Amount",
                                //   text: dthProvider.details.amount,
                                // ),
                                TabCard(
                                  titletext: "Balance",
                                  text: dthProvider.details.balance.toString(),
                                ),
                                TabCard(
                                  titletext: "MonthlyRecharge",
                                  text: dthProvider.details.monthlyRecharge
                                      .toString(),
                                ),
                                TabCard(
                                  titletext: "Due Date",
                                  text: dthProvider.details.nextRechargeOn,
                                ),
                                TabCard(
                                  titletext: "Account status",
                                  text: dthProvider.details.accountStatus,
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
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: theme.darkTheme
                                                      ? appColor
                                                          .withOpacity(0.1)
                                                      : const Color(0xFFEFF3FD),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              height: 8.5.h,
                                              width: 38.w,
                                              child: Center(
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  controller: _amountController,
                                                  validator: (value) {
                                                    if (value.isEmpty ||
                                                        value == null) {
                                                      Utils.toastMessage(
                                                          "Please enter the amount");
                                                      return "Please enter the amount";
                                                    }
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  // dthProvider.details.monthlyRecharge.floor().toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ],
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
                        CustomBottomButton(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              if (_amountController.text == null ||
                                  _amountController.text.isEmpty) {
                                Utils.toastMessage("Please enter the amount");
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FastagDthAuthenticateScreen(
                                              title: "Dth",
                                              amount: _amountController.text,
                                            )));
                              }
                            }
                          },
                          title: "Proceed",
                          color: white,
                          loader: provider.loading,
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
