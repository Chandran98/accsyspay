import 'package:Accsys_Pay/MainApp/pages/recharge/prepaid_recharge/mobile_recharge.dart';
import 'package:Accsys_Pay/MainApp/pages/service_history/service_history_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/settings_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/wallet_history/all_wallet_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';
import '../../pages/screens.dart';
import '../dummy/2_home.dart';
import '../dummy/3_chart.dart';
import '../provider/service_history_provider.dart';
import 'wallet_history/transaction_history_screen.dart';
import '../utils/Internet connectivity/Network_status.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // HomeScreen(),
    HomeSide(),
    MobileRechargeScreen(),
    // ServiceHistoryScreen(),
    ExpenseChartScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var serviceProvider =
        Provider.of<ServiceHistoryProvider>(context, listen: false);
    return UpgradeAlert(
      upgrader: Upgrader(
          showIgnore: false,
          showLater: false,
          cupertinoButtonTextStyle: GoogleFonts.inter(color: appColor)),
      child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAlias,
              child: BottomNavigationBar(
                  // backgroundColor: whiteColor,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: PrimaryColor,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/home2.png",
                          height: 3.5.h,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ui.png",
                          height: 3.5.h,
                        ),
                        label: 'Mobile'),
                    BottomNavigationBarItem(
                        // icon: Icon(Icons.message_outlined),
                        icon:
                            // InkWell(onTap: (){serviceProvider.serviceHistory(context);},
                            //   child:
                            Image.asset(
                          "assets/icons/transcation.png",
                          height: 3.5.h,
                        ),
                        // ),
                        label: 'History'),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/profileuser.png",
                          height: 3.5.h,
                        ),
                        label: 'Profile'),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }))),
    );
  }
}
