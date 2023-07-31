import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/recharge_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../provider/auth_provider.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/hover_message.dart';

// ignore: must_be_immutable
class DthRechargeScreen extends StatefulWidget {
  DthRechargeScreen({Key key, this.amount, this.title, this.txId})
      : super(key: key);
  String amount, title, txId;

  @override
  State<DthRechargeScreen> createState() => _DthRechargeScreenState();
}

class _DthRechargeScreenState extends State<DthRechargeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<WalletProvider>(context, listen: false).walletBalance();
  }

  @override
  void dispose() {
    // TODO: implement dispose

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
    var wallet = Provider.of<WalletProvider>(context);

    var verfiy = Provider.of<AuthProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    var dthRecharge = Provider.of<DthProvider>(context);
    var fastagProvider = Provider.of<UtilityProvider>(context);

    var rechargeAmount = widget.amount;
    var voucherAmount = wallet.voucherBalance;
    // var category = "";
    // var txId = "";

    var charges = wallet.handlingCharges;
    void onBack() {
      Navigator.of(context).pop();
    }

    print(charges);
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
          // backgroundColor: const Color(0xFFEFF3FD),
          appBar: AppBar(
            title: Text("Payments"),
            backgroundColor: PrimaryColor,
            iconTheme: IconThemeData(color: white),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  // height: 35,
                )),
            actions: [
              Row(
                children: [
                  const Icon(LineIcons.wallet),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(wallet.balance == null ? 0.toString() : wallet.balance,
                      style: const TextStyle(
                          // color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // spacer50Height,
                  // CustomAppBar(
                  //   title: "Payments",
                  // ),
                  spacer30Height,
                  Container(
                    decoration: BoxDecoration(
                        color: theme.darkTheme ? black : white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacer10Height,
                          spacer5Height,
                          Text(
                            "Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13.sp),
                          ),
                          spacer5Height,
                          Text(
                            "Pay your bills & Recharge safely with Accsys Pay",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 9.sp),
                          ),
                          spacer20Height,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: theme.darkTheme
                                              ? white
                                              : Colors.grey.shade600),
                                    ),
                                    spacer5Height,
                                    widget.title == "Fastag"
                                        ? Text(fastagProvider.params1value,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600))
                                        : Text(dthRecharge.dthAccount,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: PrimaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      " Recharge ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          spacer10Height,
                        ],
                      ),
                    ),
                  ),
                  spacer20Height,
                  Container(
                    decoration: BoxDecoration(
                        color: theme.darkTheme ? black : white,
                        borderRadius: BorderRadius.circular(12)),
                    // decoration: BoxDecoration(
                    //     color: theme.darkTheme ? black : white,
                    //     border: Border.all(color: Colors.grey.shade300)),
                    padding: const EdgeInsets.all(7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          spacer20Height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Recharge Amount",
                                style: TextStyle(
                                    fontSize: 11.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: theme.darkTheme
                                        ? white
                                        : Colors.grey.shade600),
                              ),
                              Text(rechargeAmount,
                                  style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "Handling charges",
                          //       style: TextStyle(
                          //           fontSize: 15,
                          //           fontWeight: FontWeight.w500,
                          //           color: theme.darkTheme
                          //               ? white
                          //               : Colors.grey.shade600),
                          //     ),
                          //     Text(charges,
                          //         style: const TextStyle(
                          //             fontSize: 18,
                          //             fontWeight: FontWeight.w600)),
                          //   ],
                          // ),
                          spacer20Height,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                                "Wallet to be deducted",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: theme.darkTheme
                                        ? white
                                        : Colors.grey.shade600),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                  getbalance(
                                      rechargeAmount,
                                      isChecked == false
                                          ? 0.toString()
                                          : wallet.voucherBalance.toString(),
                                      charges),
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 0)),
                              Text(TB.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // spacer10Height,
                  // spacer5Height,
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: theme.darkTheme ? black : white,
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             vertical: 20, horizontal: 10),
                  //         child: Row(
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                 setState(() {
                  //                   isChecked = !isChecked;
                  //                   voucherAmount = 0;
                  //                 });
                  //                 if (isChecked == false) {
                  //                   voucherCode.clear();
                  //                   pinCode.clear();
                  //                 }
                  //               },
                  //               child: Icon(
                  //                 isChecked
                  //                     ? Icons.check_box_rounded
                  //                     : Icons.check_box_outline_blank_rounded,
                  //                 size: 22,
                  //               ),
                  //             ),
                  //             widthSpace,
                  //             Text(
                  //               'Instant Payment From ',
                  //               style: TextStyle(
                  //                 color: theme.darkTheme
                  //                     ? white
                  //                     : Colors.grey.shade600,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //             Text(
                  //               'Digital Voucher ',
                  //               style: PrimaryColor16BoldTextStyle,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       isChecked
                  //           ? Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(horizontal: 8.0),
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                   color: theme.darkTheme
                  //                       ? Colors.black26
                  //                       : white,
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: black.withOpacity(0.1),
                  //                       spreadRadius: 1.2,
                  //                       blurRadius: 1.2,
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 child: Form(
                  //                   child: Column(
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.all(8.0),
                  //                         child: Container(
                  //                           height: 55,
                  //                           decoration: BoxDecoration(
                  //                               color: Colors.grey.shade100,
                  //                               borderRadius:
                  //                                   BorderRadius.circular(7)),
                  //                           child: TextFormField(
                  //                             cursorColor: PrimaryColor,
                  //                             controller: voucherCode,
                  //                             style: black18SemiBoldTextStyle,
                  //                             decoration: InputDecoration(
                  //                               contentPadding:
                  //                                   const EdgeInsets.only(
                  //                                       left: fixPadding * 2.0),
                  //                               hintStyle:
                  //                                   PrimaryColor12BoldTextStyle,
                  //                               labelStyle:
                  //                                   PrimaryColor12BoldTextStyle,
                  //                               label: const Text(
                  //                                   'Have Voucher code?'),
                  //                               // hintText: 'Have Voucher code?',
                  //                               border:
                  //                                   const UnderlineInputBorder(
                  //                                       borderSide:
                  //                                           BorderSide.none),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       const Divider(),
                  //                       spacer5Height,
                  //                       Row(
                  //                         children: [
                  //                           Container(
                  //                             width: 130,
                  //                             child: Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(8.0),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                     color:
                  //                                         Colors.grey.shade100,
                  //                                     borderRadius:
                  //                                         BorderRadius.circular(
                  //                                             7)),
                  //                                 child: TextFormField(
                  //                                   cursorColor: PrimaryColor,
                  //                                   style:
                  //                                       black18SemiBoldTextStyle,
                  //                                   controller: pinCode,
                  //                                   decoration: InputDecoration(
                  //                                     contentPadding:
                  //                                         const EdgeInsets.only(
                  //                                             left: fixPadding *
                  //                                                 2.0),
                  //                                     hintStyle:
                  //                                         PrimaryColor12BoldTextStyle,
                  //                                     labelStyle:
                  //                                         PrimaryColor12BoldTextStyle,
                  //                                     label: const Text('Pin'),
                  //                                     border:
                  //                                         const UnderlineInputBorder(
                  //                                             borderSide:
                  //                                                 BorderSide
                  //                                                     .none),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               InkWell(
                  //                                 onTap: () {
                  //                                   wallet.voucherCheck(
                  //                                       voucherCode.text,
                  //                                       pinCode.text);
                  //                                 },
                  //                                 child: Container(
                  //                                   width: 90,
                  //                                   height: 40,
                  //                                   color: PrimaryColor,
                  //                                   child: wallet.loading
                  //                                       ? const Center(
                  //                                           child:
                  //                                               CircularProgressIndicator(
                  //                                           strokeWidth: 3,
                  //                                           color: Colors.white,
                  //                                         ))
                  //                                       : const Center(
                  //                                           child: Text(
                  //                                           "Submit",
                  //                                           style: TextStyle(
                  //                                               color: white),
                  //                                         )),
                  //                                 ),
                  //                               ),
                  //                               const SizedBox(
                  //                                 width: 5,
                  //                               ),
                  //                               InkWell(
                  //                                 onTap: () {
                  //                                   wallet.cancelVocher();
                  //                                 },
                  //                                 child: Container(
                  //                                   width: 90,
                  //                                   height: 40,
                  //                                   color: PrimaryColor,
                  //                                   child: const Center(
                  //                                       child: Text(
                  //                                     "Cancel",
                  //                                     style: TextStyle(
                  //                                         color: white),
                  //                                   )),
                  //                                 ),
                  //                               )
                  //                             ],
                  //                           )
                  //                           // wallet.voucherBalance == ""
                  //                           //     ? InkWell(
                  //                           //         onTap: () {
                  //                           //           wallet.voucherCheck(
                  //                           //               voucherCode.text,
                  //                           //               pinCode.text);
                  //                           //         },
                  //                           //         child: Container(
                  //                           //           width: 100,
                  //                           //           height: 40,
                  //                           //           color: PrimaryColor,
                  //                           //           child: const Center(
                  //                           //               child: Text(
                  //                           //             "Submit",
                  //                           //             style:
                  //                           //                 TextStyle(color: white),
                  //                           //           )),
                  //                           //         ),
                  //                           //       )
                  //                           //     : InkWell(
                  //                           //         onTap: () {
                  //                           //           wallet.cancelVocher();
                  //                           //         },
                  //                           //         child: Container(
                  //                           //           width: 100,
                  //                           //           height: 40,
                  //                           //           color: PrimaryColor,
                  //                           //           child: const Center(
                  //                           //               child: Text(
                  //                           //             "Cancel",
                  //                           //             style:
                  //                           //                 TextStyle(color: white),
                  //                           //           )),
                  //                           //         ),
                  //                           //       )
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           : const SizedBox(),
                  //       // wallet.voucherStatus == "success"?
                  //       isChecked
                  //           ? Padding(
                  //               padding:
                  //                   const EdgeInsets.only(right: 20, top: 10),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   Text(
                  //                     wallet.voucherStatus == "success"
                  //                         ? "Applied"
                  //                         : "Invalid code",
                  //                     style: TextStyle(
                  //                         color:
                  //                             wallet.voucherStatus == "success"
                  //                                 ? Colors.green
                  //                                 : Colors.red),
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 50,
                  //                   ),
                  //                   Text(
                  //                       voucherAmount == null.toString()
                  //                           ? ""
                  //                           : voucherAmount,
                  //                       style: const TextStyle(
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.w600)),
                  //                 ],
                  //               ),
                  //             )
                  //           : const SizedBox(),
                  //     ],
                  //   ),
                  // ),
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
                                                      style: TextStyle(
                                                          color: white),
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
                          padding: const EdgeInsets.only(left: 20, top: 40),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5.0),
                            onTap: () {
                              widget.title == "Fastag"
                                  ? fastagProvider.payBills(
                                      rechargeAmount,
                                      TB.toString(),
                                      calculatedVocher.toString(),
                                      voucherCode.text,
                                      pinCode.text,
                                      widget.txId,
                                      context)
                                  : dthRecharge.payDthRecharge(
                                      rechargeAmount,
                                      TB.toString(),
                                      calculatedVocher.toString(),
                                      voucherCode.text.toString(),
                                      pinCode.text,
                                      // category,
                                      // txId,
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
                              child: widget.title == "Fastag"
                                  ? fastagProvider.loading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          color: Colors.white,
                                        ))
                                      : Text(
                                          'Proceed To Recharge',
                                          style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700,
                                            //: 'NunitoSans',
                                          ),
                                        )
                                  : dthRecharge.loading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          color: Colors.white,
                                        ))
                                      : Text(
                                          'Proceed To Recharge',
                                          style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            //: 'NunitoSans',
                                          ),
                                        ),
                            ),
                          ),
                        ),

                  const SizedBox(
                    height: 30,
                  ),
                  // text(recharge.rechargeMessage)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getbalance(rechargeAmount, voucherAmount, charges) {
    double availableAmount = double.parse(rechargeAmount);
    // double chargesAmount = double.parse(charges);
    double voucher = double.tryParse(voucherAmount ?? '') ?? 0;
    // double totalBalance = availableAmount - voucher + chargesAmount;
    double totalBalance = availableAmount - voucher;

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
