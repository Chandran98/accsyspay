import 'package:Accsys_Pay/MainApp/constant/data_constant.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors/colors.dart';
import '../pages/service_history/service_detailed_screen.dart';
import '../pages/service_history/service_history_screen.dart';
import '../provider/service_history_provider.dart';
import '../provider/wallet_provider.dart';
import '../utils/app_bar.dart';
import '../utils/charts/Transaction_chart.dart';
import '../utils/main_app_utils.dart';
import '../utils/shimmer_List.dart';

class ExpenseChartScreen extends StatefulWidget {
  const ExpenseChartScreen({Key key}) : super(key: key);

  @override
  State<ExpenseChartScreen> createState() => _ExpenseChartScreenState();
}

class _ExpenseChartScreenState extends State<ExpenseChartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ServiceHistoryProvider>(context, listen: false)
        .serviceHistory(context);

    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();

    Provider.of<WalletProvider>(context, listen: false).walletBalance();

    super.initState();
  }

  bool balance = false;
  @override
  Widget build(BuildContext context) {
    var balanceProvider = Provider.of<WalletProvider>(context, listen: false);
    var serviceProvider = Provider.of<ServiceHistoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: "Expense History",
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    TransactionChart(),
                    spacer10Height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 8.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),

                                  // gradient: LinearGradient(
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.bottomRight,
                                  //     colors: [
                                  //       appColor,
                                  //       appColor.withOpacity(0.4),
                                  //     ]),
                                  color: const Color(0xFF074aa1)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Income",
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    // spacer10Height,
                                    Expanded(
                                      child: Text(
                                        // balance == "null"
                                        //     ? "-----"
                                        //     :
                                        // balance
                                        // ?
                                        "₹ ${balanceProvider.totalInflowAmount.toString() == "null" ? "0" : balanceProvider.totalInflowAmount}"
                                        // : "₹ *****",
                                        ,
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          spacer10Width,
                          Expanded(
                            child: Container(
                              height: 8.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // gradient: LinearGradient(
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.bottomRight,
                                  //     colors: [
                                  //       appColor,
                                  //       appColor.withOpacity(0.4),
                                  //     ]),
                                  color: appColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Expense",
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    // spacer10Height,
                                    Expanded(
                                      child: Text(
                                        // balance == "null"
                                        //     ? "-----"
                                        //     :
                                        // balance
                                        //     ?
                                        "₹ ${balanceProvider.totalOutflowAmount.toString() == "null" ? "0" : balanceProvider.totalOutflowAmount}",
                                        // : "₹ *****",
                                        style: GoogleFonts.inter(
                                            color: white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            // spacer20Height,
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recent services",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        const ServiceHistoryScreen()));
                          },
                          child: const Text(
                            "see all",
                            style: TextStyle(
                                fontSize: 14,
                                color: appColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    spacer10Height,
                    // serviceProvider.loading
                    //     ? TransactionShimmerList()
                    //     :
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: serviceProvider.transactionHistory.length >= 2
                          ? 2
                          : serviceProvider.transactionHistory.length,
                      itemBuilder: (context, index) {
                        final data = serviceProvider
                            .transactionHistory[index].details[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => TransactionDetailScreen(
                                          data: data,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Card(
                              child: Container(
                                decoration: boxDecoration(
                                    // bgColor: Colors.white,
                                    showShadow: true,
                                    radius: spacing_standard),
                                padding: const EdgeInsets.all(spacing_standard),
                                margin: const EdgeInsets.only(
                                    bottom: spacing_standard),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            8)),
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
                    // spacer30Height,
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
