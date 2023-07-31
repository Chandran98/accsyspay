// ignore_for_file: must_be_immutable

import 'package:google_fonts/google_fonts.dart';

import '../../pages/screens.dart';
import '../pages/setting_screen/faq_screen.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: PrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FaqScreen()));
              },
              child: const Icon(
                Icons.info,
              ),
            )
          ],
        ),
      ),
    );
  }
}
