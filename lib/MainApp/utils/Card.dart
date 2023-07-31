import 'package:sizer/sizer.dart';

import '../../pages/screens.dart';

class TabCard extends StatelessWidget {
  TabCard({
    Key key,
    this.text,
    this.titletext,
  }) : super(key: key);

  String text;
  String titletext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titletext,
                style: TextStyle(
                    fontSize: 11.3.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(text,
                  style: TextStyle(
                      fontSize: 11.3.sp, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
