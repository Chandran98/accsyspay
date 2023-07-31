import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/pages/screens.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Image.asset(
              "assets/images/logo/vl.png",
              scale: 6,
            )
          ],
          backgroundColor: PrimaryColor,
          iconTheme: IconThemeData(color: white),
          title: const Text(
            "Notification",
            // style: TextStyle(color: black),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
