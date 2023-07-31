import 'package:Accsys_Pay/MainApp/pages/recharge/plan_package/prepaid_offer.dart';
import 'package:Accsys_Pay/MainApp/pages/wallet_history/income_wallet_screen.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../main_screen.dart';
import 'all_wallet_screen.dart';
import 'expenses_wallet_screen.dart';
import '../../provider/themeprovider.dart';

// ignore: must_be_immutable
class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  void onBack() {
    // ignore: prefer_const_constructors
    // Navigator.of(context).pop();

    Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Image.asset(
                  "assets/images/logo/vl.png",
                  color: appColor,
                  scale: 6,
                )
              ],
              elevation: 3,
              toolbarHeight: 60,
              centerTitle: true,
              title: Text(
                "Transaction History",
                style: GoogleFonts.inter(
                    color: theme.darkTheme ? Colors.white : appColor,
                    fontWeight: FontWeight.w600),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    // height: 35,
                  )),
              bottom: TabBar(
                // labelColor: blackColor,
                controller: _controller,
                indicatorColor: PrimaryColor,
                indicatorWeight: 5,
                automaticIndicatorColorAdjustment: true,
                tabs: const [
                  Tab(
                    text: "All",
                    // icon: Icon(CupertinoIcons.shield_lefthalf_fill,
                    //     ),
                  ),
                  Tab(
                    text: "Income",
                    // icon: Icon(
                    //   CupertinoIcons.list_bullet,

                    // ),
                  ),
                  Tab(
                    text: "Expenses",
                    // icon: Icon(
                    //   CupertinoIcons.list_bullet,

                    // ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                children: const [
                  WalletHistoryScreen(),
                  InflowWalletHistoryScreen(),
                  OutflowWalletHistoryScreen(),
                ]),
          ),
        ),
      ),
    );
  }
}
