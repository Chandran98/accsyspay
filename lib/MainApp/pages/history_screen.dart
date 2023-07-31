import 'package:Accsys_Pay/MainApp/Models/history_model.dart';
import 'package:flutter/material.dart';

import '../../MainApp/constant/constant.dart';
import '../../MainApp/constant/data_constant.dart';
import '../Theme/colors/colors.dart';
import '../constant/colors/colors.dart';
import 'main_screen.dart';

class T12TransactionList extends StatefulWidget {
  const T12TransactionList({Key key}) : super(key: key);

  @override
  T12TransactionListState createState() => T12TransactionListState();
}

class T12TransactionListState extends State<T12TransactionList> {
  var selectedTab = 0;
  List<T12Transactions> list = [];

  @override
  void initState() {
    super.initState();
    list.addAll(getAllTransactions() as Iterable<T12Transactions>);
  }

  @override
  Widget build(BuildContext context) {
    void onBack() {
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    }

    var width = MediaQuery.of(context).size.width;
    var categoryWidth = (width - 56) / 4;

    var allList = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      padding: const EdgeInsets.only(
          left: spacing_standard_new, right: spacing_standard_new),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(
              list[index].transactionDate,
              fontSize: textSizeMedium,
              textColor: Colors.black,
              fontFamily: fontMedium,
            ),
            transactionWidget(list[index], categoryWidth),
          ],
        );
      },
    );

    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_rounded),
            title: const Text(
              "Transactions",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      height: 45,
                      width: 120,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(spacing_standard),
                      decoration: boxDecoration(
                          showShadow: true,
                          bgColor: PrimaryColor,
                          radius: spacing_large),
                      child: text(
                        "All",
                        textColor: selectedTab == 0
                            ? Colors.white
                            : t12_text_secondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                      )),
                  Expanded(
                    child: Container(
                        height: 45,
                        width: 120,
                        margin: EdgeInsets.all(spacing_standard),
                        alignment: Alignment.center,
                        decoration: boxDecoration(
                            showShadow: true,
                            bgColor: PrimaryColor,
                            radius: spacing_large),
                        child: text(
                          "Received",
                          textColor:
                              selectedTab == 1 ? Colors.white : Colors.white,
                          fontFamily: fontMedium,
                          fontSize: textSizeMedium,
                        )),
                  ),
                  Expanded(
                    child: Container(
                        height: 45,
                        width: 120,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(spacing_standard),
                        decoration: boxDecoration(
                            showShadow: true,
                            bgColor: PrimaryColor,
                            radius: spacing_large),
                        child: text(
                          "Spend",
                          textColor:
                              selectedTab == 1 ? Colors.white : Colors.white,
                          fontFamily: fontMedium,
                          fontSize: textSizeMedium,
                        )),
                  )
                ],
              ),
              Expanded(child: allList)
            ],
          ),
        ),
      ),
    );
  }
}

class T12Transactions {
  var img;
  var type;
  var subType;
  var time;
  double amount;
  var transactionType;
  var transactionDate;

  T12Transactions(
      {this.img,
      this.type,
      this.subType,
      this.time,
      this.amount,
      this.transactionType,
      this.transactionDate});
}

class T12Service {
  var img;
  var serviceName;

  T12Service({this.img, this.serviceName});
}
