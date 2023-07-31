import 'package:Accsys_Pay/MainApp/provider/service_history_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../pages/screens.dart';
import '../pages/notification_screen.dart';
import '../utils/main_app_utils.dart';

class AddMoneyWidget extends StatelessWidget {
  String image, title;
  Widget page;
  AddMoneyWidget({Key key, this.image, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    var serviceProvider =
        Provider.of<ServiceHistoryProvider>(context, listen: false);
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: page,
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor.withOpacity(0.4),
              ),
              // width: 8.w,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 6.h,
                    width: 7.w,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            spacer5Height,
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, color: whiteColor),
            ),
            // spacer10Height
          ],
        ),
      ),
    );
  }
}


// // class TransferMoneyWidget extends StatelessWidget {
//   String image, title;
//   Widget page;
//   TransferMoneyWidget({Key key, this.image, this.title, this.page});

//   @override
//   Widget build(BuildContext context) {
//     var serviceProvider =
//         Provider.of<ServiceHistoryProvider>(context, listen: false);
//     return Column(
//       children: [
//         Container(
//           decoration:
//               const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//           width: 50.0,
//           child: IconButton(
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               serviceProvider.serviceHistory(context);
//               Navigator.push(
//                 context,
//                 PageTransition(
//                   child: page,
//                   type: PageTransitionType.rightToLeft,
//                 ),
//               );
//             },
//             icon: Image.asset(
//               image,
//               height: 30.0,
//               width: 30.0,
//             ),
//           ),
//         ),
//         spacer10Height,
//         Text(
//           title,
//           style: GoogleFonts.inter(fontWeight: FontWeight.w600),
//         )
//       ],
//     );
//   }
// }