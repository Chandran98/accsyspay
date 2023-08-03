// import 'package:Vairaa_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_bar.dart';
import '../../utils/main_app_utils.dart';
import '/../../pages/screens.dart';

class UtilityAuthenticateScreen extends StatefulWidget {
  String amount, txId;
  UtilityAuthenticateScreen({Key key, this.amount, this.txId})
      : super(key: key);

  @override
  State<UtilityAuthenticateScreen> createState() =>
      _UtilityAuthenticateScreenState();
}

class _UtilityAuthenticateScreenState extends State<UtilityAuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
          body: Column(children: [
            CustomAppBar(
              title: "",
            ),
            spacer10Height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: RichText(
                text: TextSpan(
                  text: 'Please Enter your ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: blackColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Secert pin ',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.sp,
                            color: appColor)),
                    TextSpan(
                      text: 'to proceed..',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: blackColor),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
            //   child: Text(
            //     "Please Enter your Secert pin to proceed...",
            //     style: GoogleFonts.inter(
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),

            spacer30Height,
            PinCodeFields(
              length: 4,
              fieldBorderStyle: FieldBorderStyle.square,
              responsive: false,
              fieldHeight: 8.h,
              fieldWidth: 15.w, animation: Animations.fade,
              // borderWidth: 5.0,
              activeBorderColor: appColor,
              activeBackgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autoHideKeyboard: false,
              // fieldBackgroundColor: Colors.black12,
              borderColor: Colors.black12,
              textStyle: GoogleFonts.inter(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
              obscureText: true,
              onComplete: (val) {
                authProvider.verifyYourPinUtility(
                    widget.amount, widget.txId, val, context);
              },
            ),
            // spacer30Height,
            // CustomBottomButton(
            //   title: "Submit",
            //   onTap: () {
            //     if (_formKey.currentState.validate()) {
            //       wallet.convertVoucher(
            //           voucherCode.text, pinCode.text, amount.text, context);
            //     }
            //   },

            //   //   if (pinCode.text.isEmpty && voucherCode.text.isEmpty  ) {
            //   //     Utils.toastMessage("Please fill vaild fields");
            //   //   } amount.text.isEmpty?   Utils.toastMessage("Please fill amount"): print("object");
            //   // },
            //   loader: wallet.loading,
            //   color: white,
            // ),
          ])),
    );
  }
}
