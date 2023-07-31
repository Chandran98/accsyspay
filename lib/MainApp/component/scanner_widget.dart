// ignore_for_file: must_be_immutable, missing_return

import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../pages/screens.dart';
import '../constant/colors/colors.dart';
import '../provider/themeprovider.dart';
import '../utils/app_bar.dart';
import '../utils/buttons/custom_button.dart';

class QrImageScan extends StatefulWidget {
  const QrImageScan({Key key}) : super(key: key);

  @override
  State<QrImageScan> createState() => _QrImageScanState();
}

class _QrImageScanState extends State<QrImageScan> {
  @override
  void initState() {
    scanBarcodeNormal();
    super.initState();
  }

  String _scanBarcode = "";

  Future scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _amountController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WalletProvider>(context);

    var theme = Provider.of<ThemeProvider>(context);
    Uri uri = Uri.parse(_scanBarcode);
    String pa = uri.queryParameters['pa'];
    String pn = uri.queryParameters['pn'];
    var upiId = pa == null ? "" : pa;
    var payeeName = pn == null ? "" : pn;
    print(pa);
    return Scaffold(
        backgroundColor: theme.darkTheme ? Colors.black : Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spacer30Height,
                  CustomAppBar(
                    title: "Qr Payment",
                  ),
                  // spacer30Height,
                  //  Padding(
                  //             padding: const EdgeInsets.only(left:16.0),
                  //             child: RichText(
                  //             text: TextSpan(
                  //               text: 'Pay Quickly, Safetly, Securely with\n ',
                  //               style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 18,color: black),
                  //               children:  <TextSpan>[
                  //                 //
                  //                 TextSpan(text: 'Vairaa', style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: appColor)),
                  //                 TextSpan(text: ' Pay!'),
                  //               ],
                  //             ),
                  //           ),
                  //           ),

                  // Image.asset(
                  //   "assets/images/scanNpay.png",
                  //   scale: 2,
                  // ),
                  spacer10Height,
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'Safely pay with ',
                  //     style: GoogleFonts.inter(
                  //         fontSize: 28,
                  //         wordSpacing: 2,
                  //         color: theme.darkTheme ? white : black,
                  //         fontWeight: FontWeight.w600),
                  //     children: <TextSpan>[
                  //       //
                  //       TextSpan(
                  //         text: 'Vairaa Pay',
                  //         style: GoogleFonts.inter(
                  //             fontSize: 28,
                  //             wordSpacing: 2,
                  //             fontWeight: FontWeight.w600,
                  //             color: appColor),
                  //       ),
                  //       TextSpan(
                  //         text: ' ',
                  //         style: GoogleFonts.inter(
                  //             fontSize: 28,
                  //             wordSpacing: 2,
                  //             color: theme.darkTheme ? white : black,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  pa == null
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                scanBarcodeNormal();
                              },
                              child: Image.asset(
                                "assets/images/scanNpay.png",
                                scale: 2,
                              ),
                            ),
                            spacer20Height,
                            Text(
                              "Please scan your Qr code to make payment",
                              style: GoogleFonts.inter(fontSize: 15),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            spacer10Height,
                            Text(
                              " Paying : $payeeName",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            spacer10Height,
                            Text(
                              " Upi Id : $upiId",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            spacer50Height,
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const Text("Enter your amount"),
                                    spacer10Height,
                                    Container(
                                      height: 80,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: theme.darkTheme
                                              ? Colors.grey.shade700
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
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
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: appColor,
                                          style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600),
                                          controller: _amountController,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),

                  spacer30Height,
                  spacer50Height,
                  spacer50Height,
                  // CustomSlidableButton(
                  //   onTap: () {
                  //     if (_formKey.currentState.validate()) {
                  //       provider.razorScanAndPay(pa, _amountController.text);
                  //     }
                  //   },
                  // )
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: pa == null
                          ? InkWell(
                              onTap: () {
                                scanBarcodeNormal();
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(7)),
                                child: const Center(
                                  child: Text(
                                    "Scan & Pay",
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: white,
                                      fillColor:
                                          MaterialStateProperty.all<Color>(
                                              appColor),
                                      value: _isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          _isChecked = !_isChecked;
                                        });
                                      },
                                    ),
                                    const Text(
                                        "Pay securely through Accsys Pay wallet")
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_isChecked == false) {
                                      Utils.toastMessage(
                                          "Please select the check Box");
                                    } else {
                                      if (upiId == "") {
                                        Utils.toastMessage(
                                            "Invalid Upi Id- Please check it Once again");
                                      } else {
                                        if (_amountController.text == "") {
                                          Utils.toastMessage(
                                              "Invalid Amount- Please check it Once again");
                                        } else {
                                          provider.razorScanAndPay(pa,
                                              _amountController.text, context);
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: appColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: provider.loading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: white,
                                            ),
                                          )
                                        : const Center(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )
                ],
              ),

              //  spacer50Height,spacer50Height,spacer50Height,spacer40Height,
              //  Padding(
              //           padding: const EdgeInsets.only(top:8.0),
              //           child: Image.asset("assets/images/logo/vpe_logo_.png",scale: 10,),
              // ),
            ],
          ),
        ));
  }
}
