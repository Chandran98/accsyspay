import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../pages/screens.dart';
import '../constant/colors/colors.dart';
import '../provider/wallet_provider.dart';
import '../utils/app_bar.dart';
import '../utils/buttons/custom_button.dart';
import '../utils/hover_message.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({Key key}) : super(key: key);

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  final voucherCode = TextEditingController();
  final pinCode = TextEditingController();
  final amount = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var wallet = Provider.of<WalletProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: theme.darkTheme ? Color(0xff282633) : white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: "",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 18),
                  child: Column(
                    children: [
                      spacer10Height,
                      RichText(
                        text: TextSpan(
                          text: 'Convert your ',
                          style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              wordSpacing: 2,
                              color: theme.darkTheme ? white : black,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            //
                            TextSpan(
                              text: 'Voucher to Wallet',
                              style: GoogleFonts.inter(
                                  fontSize: 22.sp,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                  color: appColor),
                            ),
                            TextSpan(
                              text: ' Instantly',
                              style: GoogleFonts.inter(
                                  fontSize: 22.sp,
                                  wordSpacing: 2,
                                  color: theme.darkTheme ? white : black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      spacer20Height,
                      Text(
                        "Please provide us with valid voucher code to a hassle free transaction",
                        style: GoogleFonts.inter(
                            fontSize: 11.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      spacer50Height,
                      Container(
                        decoration: BoxDecoration(
                          color: theme.darkTheme ? black : white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: black.withOpacity(0.1),
                              spreadRadius: 1.2,
                              blurRadius: 1.2,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              spacer10Height,

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 8),
                                child: Container(
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                      color: theme.darkTheme
                                          ? Colors.grey
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextFormField(
                                      cursorColor: PrimaryColor,
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return "please fill Voucher code";
                                        }
                                        return null;
                                      },
                                      controller: voucherCode,
                                      style: black18SemiBoldTextStyle,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: fixPadding * 2.0),
                                        hintStyle: PrimaryColor12BoldTextStyle,
                                        labelStyle: PrimaryColor12BoldTextStyle,
                                        label: Text('Voucher code'),
                                        // hintText: 'Have Voucher code?',
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              spacer5Height,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 8),
                                child: Container(
                                  height: 8.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: theme.darkTheme
                                          ? Colors.grey
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextFormField(
                                      cursorColor: PrimaryColor,
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return "please fill pin";
                                        }
                                        return null;
                                      },
                                      style: black18SemiBoldTextStyle,
                                      keyboardType: TextInputType.number,
                                      controller: pinCode,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: fixPadding * 2.0),
                                        hintStyle: PrimaryColor12BoldTextStyle,
                                        labelStyle: PrimaryColor12BoldTextStyle,
                                        label: Text('Pin'),
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              spacer10Height,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 8),
                                child: Container(
                                  height: 8.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: theme.darkTheme
                                          ? Colors.grey
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty || value == null) {
                                          return "please fill amount";
                                        }
                                        return null;
                                      },
                                      cursorColor: PrimaryColor,
                                      style: black18SemiBoldTextStyle,
                                      keyboardType: TextInputType.number,
                                      controller: amount,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            left: fixPadding * 2.0),
                                        hintStyle: PrimaryColor12BoldTextStyle,
                                        labelStyle: PrimaryColor12BoldTextStyle,
                                        label: Text('Amount'),
                                        border: const UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              spacer10Height,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 8),
                                child: CustomBottomButton(
                                  title: "Submit",
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      wallet.convertVoucher(voucherCode.text,
                                          pinCode.text, amount.text, context);
                                    }
                                  },

                                  //   if (pinCode.text.isEmpty && voucherCode.text.isEmpty  ) {
                                  //     Utils.toastMessage("Please fill vaild fields");
                                  //   } amount.text.isEmpty?   Utils.toastMessage("Please fill amount"): print("object");
                                  // },
                                  loader: wallet.loading,
                                  color: white,
                                ),
                              ),
                              spacer10Height
                              // InkWell(
                              //     onTap: () {
                              //       // wallet.voucherCheck(
                              //       //     voucherCode.text,
                              //       //     pinCode.text);
                              //     },
                              //     child: Container(
                              //       // width: 90,
                              //       height: 40,
                              //       color: PrimaryColor,
                              //       child: wallet.loading
                              //           ? const Center(
                              //               child: CircularProgressIndicator(
                              //               strokeWidth: 3,
                              //               color: Colors.white,
                              //             ))
                              //           : const Center(
                              //               child: Text(
                              //               "Submit",
                              //               style: TextStyle(color: white),
                              //             )),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
