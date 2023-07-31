// ignore_for_file: must_be_immutable

import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';

import '../../../pages/screens.dart';

class CustomAlertDialog extends StatelessWidget {
  String message;
  Function onTap;
  Widget lottie;
  CustomAlertDialog({Key key, this.message, this.lottie, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150, child: lottie),
              spacer20Height,
              Text(
                message,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              spacer40Height,
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 48,
                  width: 150,
                  decoration: BoxDecoration(
                      color: appColor, borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                    child: Text(
                      "Okay",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: whiteColor),
                    ),
                  ),
                ),
              )
              // SizedBox(
              //   width: 320.0,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Save",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     // color: const Color(0xFF1BC0C5),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
