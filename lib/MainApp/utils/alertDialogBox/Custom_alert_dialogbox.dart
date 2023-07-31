// ignore_for_file: must_be_immutable


import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../main_app_utils.dart';

class CustomAlertBox extends StatelessWidget {
  String title, network, operator, circle, mobileNo;
  Function onTap;
  CustomAlertBox(
      {Key key,
      this.circle,
      this.network,
      this.mobileNo,
      this.onTap,
      this.operator,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(
          //   // color: Colors.grey.shade100,
          //    width: 3),
          borderRadius: BorderRadius.circular(5),
        ),
        height: 25.h,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacer10Height,
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1,
                      child:  Text(
                        "Network",
                        style: GoogleFonts.inter(
                             fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(flex: 2,child: Text(operator,maxLines: 1,textAlign: TextAlign.right,)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mobile",
                      style: TextStyle(
                           fontWeight: FontWeight.w700),
                    ),
                    Text(mobileNo),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(flex: 1,
                      child: Text(
                        "Circle",
                        style: TextStyle(
                             fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(flex: 2,child: Text(circle,textAlign: TextAlign.right,)),
                  ],
                ),
              ),
              spacer20Height,
              InkWell(
                borderRadius: BorderRadius.circular(5.0),
                onTap: onTap,
                //  () {
                //   // prepaidMobileOffer(
                //   //     mobile, data.operatorId, context);
                //   // prepaidMobilePlan(mobile, data.operatorId,
                //   //     data.circleId, context);
                //   // Navigator.push(
                //   //   context,
                //   //   PageTransition(
                //   //     child: RechargePageScreen(),
                //   //     type: PageTransitionType.rightToLeft,
                //   //   ),
                //   // );
                // },
                child: Container(
                  width: 250,
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
                    'Select Plan',
                    style: white22BoldTextStyle,
                  ),
                ),
              ),
              spacer10Height
            ],
          ),
        ),
      ),
    );
  }
}
