import 'dart:io';

import 'package:Accsys_Pay/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

int currentIndex = 0;

class _BottomBarState extends State<BottomBar> {
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? Mall()
                : (currentIndex == 2)
                    ? History()
                    : const Profile(),
      ),
      bottomNavigationBar: Container(
        height: 65.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getBottomBarItemTile(0, 'assets/icons/home.png', 'Home'),
              getBottomBarItemTile(1, 'assets/icons/shopping_bag.png', 'Mall'),
              getBottomBarItemTile(2, 'assets/icons/history.png', 'History'),
              getBottomBarItemTile(3, 'assets/icons/profile.png', 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  getBottomBarItemTile(int index, String icon, String title) {
    return InkWell(
      focusColor: PrimaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: (currentIndex == index)
                  ? PrimaryColor
                  : greyColor.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              height: 14,
              width: 14,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: TextStyle(
              color: (currentIndex == index)
                  ? PrimaryColor
                  : Colors.grey.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
