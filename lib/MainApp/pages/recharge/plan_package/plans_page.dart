import 'package:Accsys_Pay/MainApp/pages/recharge/plan_package/prepaid_offer.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/plan_package/prepaidplan.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../provider/themeprovider.dart';

// ignore: must_be_immutable
class RechargePageScreen extends StatefulWidget {
  @override
  _RechargePageScreenState createState() => _RechargePageScreenState();
}

class _RechargePageScreenState extends State<RechargePageScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  void onBack() {
    // ignore: prefer_const_constructors
    Navigator.of(context).pop();
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
              elevation: 3,
              toolbarHeight: 60,
              centerTitle: true,
              title: Text(
                "Recharge",
                style: GoogleFonts.inter(
                    color: theme.darkTheme ? Colors.white : Colors.black),
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
                    text: "Prepaid-Plans",
                    icon: Icon(
                      CupertinoIcons.shield_lefthalf_fill,
                    ),
                  ),
                  Tab(
                    text: "Prepaid-Offer",
                    icon: Icon(
                      CupertinoIcons.list_bullet,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                children: const [
                  PrePaidPlanScreen(),
                  PrepaidPlanOffer(),
                ]),
          ),
        ),
      ),
    );
  }
}
