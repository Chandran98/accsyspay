// ignore_for_file: must_be_immutable

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../../constant/colors/colors.dart';

class CustomBottomButton extends StatelessWidget {
  Function onTap;
  String title;
  bool loader = false;
  Color color;
  CustomBottomButton({Key key, this.onTap, this.title, this.loader, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      onTap: onTap,
      child: Container(
        height: 7.3.h,
        width: double.infinity,
        padding: const EdgeInsets.all(fixPadding * 1.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: loader
            ? CircularProgressIndicator(
                color: color,
              )
            : Text(title,
                style: GoogleFonts.inter(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  //: 'NunitoSans',
                )),
      ),
    );
  }
}
