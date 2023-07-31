import 'package:Accsys_Pay/MainApp/utils/box_decoration.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';

import '../../pages/screens.dart';

// ignore: must_be_immutable
class CustomSettingTile extends StatelessWidget {
  String title;
  Widget onTap;
  Widget widget;
  CustomSettingTile({Key key, this.onTap, this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacer5Height,
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => onTap));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: boxDecorationDefault(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: widget,
                  )),
              // trailing: const Icon(
              //   Icons.arrow_forward_ios_outlined,
              //   color: blackColor,
              //   size: 20,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
