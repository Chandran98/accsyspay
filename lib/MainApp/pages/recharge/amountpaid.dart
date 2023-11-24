import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/recharge_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/buttons/custom_button.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/hover_message.dart';

// ignore: must_be_immutable
class RechargePaymentPage extends StatefulWidget {
  RechargePaymentPage({Key key, this.amount}) : super(key: key);
  String amount;

  @override
  State<RechargePaymentPage> createState() => _RechargePaymentPageState();
}

class _RechargePaymentPageState extends State<RechargePaymentPage> {
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
    var recharge = Provider.of<RechargeProvider>(context);
    var verify = Provider.of<AuthProvider>(context);
    var rechargeAmount = widget.amount;
    var voucherAmount = wallet.voucherBalance;
    // var category = "";
    // var txId = "";

    var charges = recharge.mobileCharges.charges.toString();
    void onBack() {
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
                    width: 10,
                  ),
                  Text(wallet.balance == null ? 0.toString() : wallet.balance,
                      style: GoogleFonts.inter(
                          // color: black,
                          fontSize: 17,
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
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          spacer5Height,
                          Text(
                            "Pay your bills & Recharge safely with Accsys Pay",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 12),
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
                                      "Mobile",
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: theme.darkTheme
                                              ? white
                                              : Colors.grey.shade600),
                                    ),
                                    spacer5Height,
                                    Text(recharge.mobile,
                                        style: GoogleFonts.inter(
                                            fontSize: 17,
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
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 15,
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
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: theme.darkTheme
                                        ? white
                                        : Colors.grey.shade600),
                              ),
                              Text(rechargeAmount,
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
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
                                style: GoogleFonts.inter(
                                    fontSize: 15,
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
                                  style: GoogleFonts.inter(
                                      color: Colors.red, fontSize: 0)),
                              Text(TB.toStringAsFixed(2),
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
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

                  spacer30Height,
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
                      : CustomBottomButton(
                          onTap: () {
                            recharge.payRecharge(
                                rechargeAmount,
                                TB.toString(),
                                calculatedVocher.toString(),
                                voucherCode.text.toString(),
                                pinCode.text,
                                // category,
                                // txId,
                                context);
                          },
                          title: "Proceed To Payment",
                          loader: recharge.loading,
                          color: white,
                        ),
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
