import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/MainApp/constant/data_constant.dart';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/service_history/service_detailed_screen.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/MainApp/utils/shimmer_List.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/colors/colors.dart';
import 'package:sizer/sizer.dart';
import '../../provider/service_history_provider.dart';

class ServiceHistoryScreen extends StatefulWidget {
  const ServiceHistoryScreen({Key key}) : super(key: key);

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  void onBack() {
    // ignore: prefer_const_constructors
    Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ServiceHistoryProvider>(context, listen: false)
        .serviceHistory(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var serviceProvider = Provider.of<ServiceHistoryProvider>(context);

    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            actions: [
              Image.asset(
                "assets/images/logo/vl.png",
                scale: 6,
              )
            ],
            iconTheme: const IconThemeData(color: white),
            title: const Text(
              'Service History',
              // style: TextStyle(color: Colors.black),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MainScreen()));
                },
                child: const Icon(Icons.arrow_back)),
          ),
          body: serviceProvider.loading
              ? TransactionShimmerList()
              : ListView.builder(
                  itemCount: serviceProvider.transactionHistory.length,
                  itemBuilder: (context, index) {
                    final data = serviceProvider
                        .transactionHistory[index].details[index];
                    return 
                    
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TransactionDetailScreen(
                                      data: data,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Card(
                          child: Container(
                            decoration: boxDecoration(
                                // bgColor: Colors.white,
                                showShadow: true,
                                radius: spacing_standard),
                            padding: const EdgeInsets.all(spacing_standard),
                            margin:
                                const EdgeInsets.only(bottom: spacing_standard),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          data.category,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: PrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Text(
                                                "  success  ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  spacer20Height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          data.createdAt,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                              "₹ ${data.amount.roundToDouble().toString()}",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class Hobile extends StatelessWidget {
  const Hobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServiceHistoryProvider>(context, listen: false);
    return Scaffold(
      body: InkWell(
        onTap: () {
          provider.serviceHistory(context);
        },
        child: Center(
          child: provider.loading
              ? const CircularProgressIndicator()
              : const Text("Inter"),
        ),
      ),
    );
  }
}
