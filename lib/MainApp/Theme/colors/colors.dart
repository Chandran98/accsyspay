import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../pages/screens.dart';

const appColor = Color(0xFFDE3163);
const app3Color = Color(0xFF074aa1);
const app2Color = Color(0xFF00aff0);
const app4Color = Color(0xFF26faaa);
const app5Color = Color(0xFF1baf77);
const app6Color = Color(0xFFfa2676);
const app7Color = Color(0xFF6f26fa);

const blackColor = Colors.black;
const whiteColor = Colors.white;
var greycolor = Colors.grey.shade400;

const PrimaryColor = appColor;
const WAAccentColor = Color(0xFF26C884);

class Sticky {
  static List color = [
    const Color(0xff3282B8),
    const Color(0xFF6C56F9),
    const Color(0xFF0000FF),
    const Color(0xFF8A2BE2),
    const Color(0xFF483D8B),
    const Color(0xFF2F4F4F),
    const Color(0xFF2F4F4F),
    const Color(0xFFA52A2A),
    const Color(0xFF5F9EA0),
    const Color(0xFFD2691E),
    const Color(0xFFFF7F50),
    const Color(0xFF6495ED),
    const Color(0xFFDC143C),
    const Color(0xFF00008B),
  ];

  static Color getColorItem() => (color.toList()..shuffle()).first;
}
