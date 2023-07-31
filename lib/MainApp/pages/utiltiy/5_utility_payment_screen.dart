import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../../provider/auth_provider.dart';
import '../../provider/themeprovider.dart';
import '../../provider/utilty_provider.dart';
import '../../provider/wallet_provider.dart';
import '../../utils/hover_message.dart';
import '../../utils/main_app_utils.dart';
import '../main_screen.dart';

// ignore: must_be_immutable
class UtilityPayment extends StatefulWidget {
  UtilityPayment({Key key, this.amount, this.txnID}) : super(key: key);
  String amount;
  String txnID;

  @override
  State<UtilityPayment> createState() => _UtilityPaymentState();
}

class _UtilityPaymentState extends State<UtilityPayment> {
  @override
  void initState() {
    super.initState();

    Provider.of<WalletProvider>(context, listen: false).walletBalance();
  }

  @override
  void dispose() {
    if (isChecked = false) {
      voucherCode.text;
      pinCode.text;
    }
    super.dispose();
  }

  var TB;
  var calculatedVocher;
  bool isChecked = false;
  bool _applyVoucher = false;
  final voucherCode = TextEditingController();
  final pinCode = TextEditingController();

  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var verfiy = Provider.of<AuthProvider>(context);
    var wallet = Provider.of<WalletProvider>(context);
    var utility = Provider.of<UtilityProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    var billableAmount = widget.amount;
    var voucherAmount = wallet.voucherBalance;
    var charges = utility.mobileCharges.charges.toString();
    var txId = widget.txnID;

    onBack() {
      AlertDialog(
        title: const Text("Are you sure ?"),
        content: const Text("Do you want to cancel this Payment?"),
        actions: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const MainScreen()));
                  },
                  child: Container(
                    child: const Text("Yes"),
                  )),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: const Text("cancel"),
                  )),
            ],
          )
        ],
      );
    }

    return
        // WillPopScope(
        //   onWillPop: () {
        //     onBack();
        //     return Future.value(false);
        //   },
        //   child:
        SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          iconTheme: const IconThemeData(color: white),
          title: const Text(
            "Payments",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                spacer50Height,

                Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      spacer40Height,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Tx ID",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                txId,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      spacer5Height,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Divider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      spacer20Height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Billable Amount",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            billableAmount,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Handling charges",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            charges,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      spacer10Height,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      spacer10Height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Wallet to be deducted",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                              getbalance(
                                  billableAmount,
                                  isChecked == false
                                      ? 0.toString()
                                      : wallet.voucherBalance.toString(),
                                  charges),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 0)),
                          Text(
                            TB.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),

                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 20),
                      //   child: Row(
                      //     children: [
                      //       InkWell(
                      //         onTap: () {
                      //           setState(() {
                      //             isChecked = !isChecked;
                      //             voucherAmount = 0;
                      //           });
                      //           if (isChecked == false) {
                      //             voucherCode.clear();
                      //             pinCode.clear();
                      //           }
                      //         },
                      //         child: Icon(
                      //           isChecked
                      //               ? Icons.check_box_rounded
                      //               : Icons.check_box_outline_blank_rounded,
                      //           size: 22,
                      //           // color: black,
                      //         ),
                      //       ),
                      //       widthSpace,
                      //       Text(
                      //         'Instant Payment From ',
                      //         style: TextStyle(
                      //           color: theme.darkTheme
                      //               ? white
                      //               : Colors.grey.shade600,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //       spacer5Width,
                      //       Text(
                      //         'Digital Voucher ',
                      //         style: PrimaryColor16BoldTextStyle,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // isChecked
                      //     ? Container(
                      //         decoration: BoxDecoration(
                      //           color: white,
                      //           borderRadius: BorderRadius.circular(5),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: black.withOpacity(0.1),
                      //               spreadRadius: 1.2,
                      //               blurRadius: 1.2,
                      //             ),
                      //           ],
                      //         ),
                      //         child: Form(
                      //           child: Column(
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: Container(
                      //                   height: 55,
                      //                   decoration: BoxDecoration(
                      //                       color: Colors.grey.shade100,
                      //                       borderRadius:
                      //                           BorderRadius.circular(7)),
                      //                   child: TextFormField(
                      //                     cursorColor: PrimaryColor,
                      //                     controller: voucherCode,
                      //                     style: black18SemiBoldTextStyle,
                      //                     decoration: InputDecoration(
                      //                       contentPadding:
                      //                           const EdgeInsets.only(
                      //                               left: fixPadding * 2.0),
                      //                       hintStyle:
                      //                           PrimaryColor12BoldTextStyle,
                      //                       labelStyle:
                      //                           PrimaryColor12BoldTextStyle,
                      //                       label: const Text(
                      //                           'Have Voucher code?'),
                      //                       // hintText: 'Have Voucher code?',
                      //                       border: const UnderlineInputBorder(
                      //                           borderSide: BorderSide.none),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               const Divider(),
                      //               spacer5Height,
                      //               Row(
                      //                 children: [
                      //                   Container(
                      //                     width: 130,
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: Container(
                      //                         decoration: BoxDecoration(
                      //                             color: Colors.grey.shade100,
                      //                             borderRadius:
                      //                                 BorderRadius.circular(7)),
                      //                         child: TextFormField(
                      //                           cursorColor: PrimaryColor,
                      //                           style: black18SemiBoldTextStyle,
                      //                           controller: pinCode,
                      //                           decoration: InputDecoration(
                      //                             contentPadding:
                      //                                 const EdgeInsets.only(
                      //                                     left:
                      //                                         fixPadding * 2.0),
                      //                             hintStyle:
                      //                                 PrimaryColor12BoldTextStyle,
                      //                             labelStyle:
                      //                                 PrimaryColor12BoldTextStyle,
                      //                             label: const Text('Pin'),
                      //                             border:
                      //                                 const UnderlineInputBorder(
                      //                                     borderSide:
                      //                                         BorderSide.none),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Row(
                      //                     children: [
                      //                       InkWell(
                      //                         onTap: () {
                      //                           wallet.voucherCheck(
                      //                               voucherCode.text,
                      //                               pinCode.text);
                      //                         },
                      //                         child: Container(
                      //                           width: 90,
                      //                           height: 40,
                      //                           color: PrimaryColor,
                      //                           child: wallet.loading
                      //                               ? const Center(
                      //                                   child:
                      //                                       CircularProgressIndicator(
                      //                                   strokeWidth: 3,
                      //                                   color: Colors.white,
                      //                                 ))
                      //                               : const Center(
                      //                                   child: Text(
                      //                                   "Submit",
                      //                                   style: TextStyle(
                      //                                       color: white),
                      //                                 )),
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         width: 5,
                      //                       ),
                      //                       InkWell(
                      //                         onTap: () {
                      //                           wallet.cancelVocher();
                      //                         },
                      //                         child: Container(
                      //                           width: 90,
                      //                           height: 40,
                      //                           color: PrimaryColor,
                      //                           child: const Center(
                      //                               child: Text(
                      //                             "Cancel",
                      //                             style:
                      //                                 TextStyle(color: white),
                      //                           )),
                      //                         ),
                      //                       )
                      //                     ],
                      //                   )
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     : const SizedBox(),
                      // // wallet.voucherStatus == "success"?
                      // isChecked
                      //     ? Padding(
                      //         padding:
                      //             const EdgeInsets.only(right: 20, top: 10),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Text(
                      //               wallet.voucherStatus == "success"
                      //                   ? "Applied"
                      //                   : "Invalid code",
                      //               style: TextStyle(
                      //                   color: wallet.voucherStatus == "success"
                      //                       ? Colors.green
                      //                       : Colors.red),
                      //             ),
                      //             const SizedBox(
                      //               width: 50,
                      //             ),
                      //             Text(
                      //                 voucherAmount == null.toString()
                      //                     ? ""
                      //                     : voucherAmount,
                      //                 style: const TextStyle(
                      //                     fontSize: 15,
                      //                     fontWeight: FontWeight.w600)),
                      //           ],
                      //         ),
                      //       )
                      //     : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                verfiy.pinData == null
                    ? InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Enter Your Pin "),
                                  content: Container(
                                    // color: white,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return Utils.toastMessage(
                                              "Please enter the amount");
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          // border: InputBorder.none,
                                          ),
                                      cursorColor: appColor,
                                      style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600),
                                      controller: _pinController,
                                      textAlign: TextAlign.center,
                                    ),
                                    height: 50,
                                    width: 200,
                                  ),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        verfiy.verifyYourPin(
                                            _pinController.text, context);
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: appColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: verfiy.loading
                                            ? const CircularProgressIndicator(
                                                color: white,
                                              )
                                            : const Center(
                                                child: Text(
                                                "submit",
                                                style: TextStyle(color: white),
                                              )),
                                        // color: appColor,
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          height: 7.3.h,
                          width: double.infinity,
                          padding: const EdgeInsets.all(fixPadding * 1.2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("Proceed",
                              style: GoogleFonts.inter(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                //: 'NunitoSans',
                              )),
                        ),
                      )
                    : verfiy.pinData.status == "success"
                        ? SizedBox()
                        : InkWell(
                            borderRadius: BorderRadius.circular(5.0),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Enter Your Pin "),
                                      content: Container(
                                        // color: white,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return Utils.toastMessage(
                                                  "Please enter the amount");
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                              // border: InputBorder.none,
                                              ),
                                          cursorColor: appColor,
                                          style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600),
                                          controller: _pinController,
                                          textAlign: TextAlign.center,
                                        ),
                                        height: 50,
                                        width: 200,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            verfiy.verifyYourPin(
                                                _pinController.text, context);
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: appColor,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: verfiy.loading
                                                ? const CircularProgressIndicator(
                                                    color: white,
                                                  )
                                                : const Center(
                                                    child: Text(
                                                    "submit",
                                                    style:
                                                        TextStyle(color: white),
                                                  )),
                                            // color: appColor,
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 7.3.h,
                              width: double.infinity,
                              padding: const EdgeInsets.all(fixPadding * 1.2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("Proceed",
                                  style: GoogleFonts.inter(
                                    color: white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    //: 'NunitoSans',
                                  )),
                            ),
                          ),
                // : SizedBox(),
                spacer20Height,
                (verfiy.pinData == null || verfiy.pinData.status == "error")
                    ? SizedBox()
                    : Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 40),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          onTap: () {
                            utility.payBills(
                                billableAmount,
                                TB.toString(),
                                calculatedVocher.toString(),
                                voucherCode.text,
                                pinCode.text,
                                txId,
                                context);
                          },
                          child: Container(
                            width: 80.w,
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
                            child: utility.loading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  ))
                                : Text(
                                    'Proceed To Recharge',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                // utility.loading ? SizedBox() : Text(utility.paymentMessage),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }

  getbalance(rechargeAmount, voucherAmount, charges) {
    double availableAmount = double.parse(rechargeAmount);
    double chargesAmount = double.parse(charges);
    double voucher = double.tryParse(voucherAmount ?? '') ?? 0;
    double totalBalance = availableAmount - voucher + chargesAmount;

    if (totalBalance > 0.0) {
      setState(() {
        TB = totalBalance;
        calculatedVocher = voucher;
      });
      return totalBalance.toStringAsFixed(2);
    } else {
      var v = totalBalance.toInt() + voucher.toInt();
      print(v);
      var b = v - voucher.toString().toInt();
      print(787678);
      print(b);
      setState(() {
        calculatedVocher = b;
        TB = 0;
      });
      return 0.toString();
    }
  }
}
