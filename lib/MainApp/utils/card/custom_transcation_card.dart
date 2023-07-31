import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../pages/screens.dart';
import '../../Models/wallet_history_model.dart';
import '../../constant/data_constant.dart';
import '../main_app_utils.dart';

class CustomTransactionCard extends StatelessWidget {
  const CustomTransactionCard({
    Key key,
    @required this.data,
  }) : super(key: key);

  final WalletHistoryModel data;

  @override
  Widget build(BuildContext context) {
    return   Card(
      child: Container(
        decoration: boxDecoration(
            // bgColor: Colors.white,
            showShadow: true,
            radius: spacing_standard),
        padding: const EdgeInsets.all(spacing_standard),
        margin: const EdgeInsets.only(bottom: spacing_standard),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widthSpace,
            widthSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    data.mode == 0
                        ? 'assets/icons/debit.png'
                        : 'assets/icons/credit.png',
                    height: 6.h,
                    width: 18.w,
                  ),
                ),
                spacer10Width,
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      data.description,
                      style: GoogleFonts.inter(
                          fontSize: 10.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            spacer10Height,
            spacer5Height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "        ${data.createdAt}",
                    style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text("₹ ${data.amount.toStringAsFixed(2)}",
                        style: data.mode == 0
                            ? GoogleFonts.inter(
                                color: redColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              )
                            : GoogleFonts.inter(
                                color: greenColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              )),
                  ),
                ),
              ],
            ),
         ],
        ),
      ),
    );
  }
}
