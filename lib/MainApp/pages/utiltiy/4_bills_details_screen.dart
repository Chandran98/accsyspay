import 'package:Accsys_Pay/MainApp/pages/utiltiy/5_utility_payment_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/utiltiy/utility_pin_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../pages/screens.dart';
import '../../constant/data_constant.dart';
import '../../provider/themeprovider.dart';
import '../../utils/Card.dart';
import '../../utils/app_bar.dart';
import '../../utils/buttons/custom_button.dart';
import '../recharge/plan_package/post_paid_screen.dart';

class BillerDetailsScreen extends StatefulWidget {
  const BillerDetailsScreen({Key key}) : super(key: key);

  @override
  State<BillerDetailsScreen> createState() => _BillerDetailsScreenState();
}

class _BillerDetailsScreenState extends State<BillerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var loader = Provider.of<UtilityProvider>(context);
    var provider =
        Provider.of<UtilityProvider>(context, listen: false).fetchbilldetails;
    var theme = Provider.of<ThemeProvider>(context);
    var billData = loader.fetchbilldetails.details;
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      // appBar: AppBar(
      //   title: const Text("Billing Details"),
      //   backgroundColor: PrimaryColor,
      //   iconTheme: const IconThemeData(color: white),
      // ),
      body: loader.loading
          ? const CircularProgressIndicator()
          : loader.fetchbilldetails.status == "error"
              ? Center(
                  child: Text(billData.responseMessage),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Billing Details",
                        ),
                        Container(
                          decoration: boxDecoration(
                            radius: 10,
                            showShadow: true,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: ListTile(
                              tileColor: theme.darkTheme ? black : white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              subtitle: Text(
                                loader.params1value,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Sticky.getColorItem()),
                                child: Center(
                                    child: Text(
                                  billData.customerName[0],
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              title: Text(
                                billData.customerName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacer10Height,
                        Container(
                          decoration: BoxDecoration(
                              color: theme.darkTheme ? black : white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 6),
                                  child: Text(
                                    "Bill Details",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                spacer20Height,
                                // TabCard(
                                //   titletext: "Bill Amount",
                                //   text: dthProvider.details.amount,
                                // ),
                                TabCard(
                                  titletext: "Balance",
                                  text: billData.billAmount
                                      .toInt()
                                      .floor()
                                      .toString(),
                                ),
                                // TabCard(
                                //   titletext: "MonthlyRecharge",
                                //   text: dthProvider.details.monthlyRecharge
                                //       .floor()
                                //       .toString(),
                                // ),

                                TabCard(
                                  titletext: "Txn Id",
                                  text: billData.transactionId.substring(0, 15),
                                ),
                                TabCard(
                                  titletext: "Bill Date",
                                  text: billData.billDate,
                                ),
                                TabCard(
                                  titletext: "Due Date",
                                  text: billData.billDueDate,
                                ),

                                spacer20Height,
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: theme.darkTheme
                                                    ? appColor.withOpacity(0.1)
                                                    : const Color(0xFFEFF3FD),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            height: 8.5.h,
                                            width: 38.w,
                                            child: Center(
                                                child: Text(
                                              billData.billAmount,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(postPaid.details.billDate),
                              ],
                            ),
                          ),
                        ),
                        spacer50Height,
                        CustomBottomButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UtilityAuthenticateScreen(
                                          amount: billData.billAmount,
                                          txId: billData.transactionId,
                                        )));
                          },
                          title: "Proceed",
                          color: white,
                          loader: loader.loading,
                        ),
                      ],
                    ),
                  ),
                ),

      //  loader.fetchbilldetails.status == "error"
      //     ? Center(
      //         child: Text(billData.responseMessage),
      //       )
      //     :  Padding(
      //         padding: const EdgeInsets.only(left: 20, right: 20),
      //         child: Column(
      //           children: [
      //             //  decoration: BoxDecoration(
      //             //   color: Colors.white,
      //             //   border:
      //             //       Border.all(color: Colors.grey.shade100, width: 3),
      //             //   borderRadius: BorderRadius.circular(5),
      //             // ),
      //            spacer50Height,
      //             Card(
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: theme.darkTheme?black: white,
      //                   border:
      //                       Border.all(color: Colors.grey.shade100, width: 3),
      //                   borderRadius: BorderRadius.circular(5),
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     spacer20Height,
      //                     TabCard(
      //                       titletext: "Bill Amount",
      //                       text: billData.billAmount,
      //                     ),
      //                   const  Padding(
      //                       padding:  EdgeInsets.all(8.0),
      //                       child: Divider(),
      //                     ),
      //                     TabCard(
      //                       titletext: "Name",
      //                       text: billData.customerName,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 8.0,top: 8),
      //                       child: Row(
      //                         mainAxisAlignment:
      //                             MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           const Expanded(
      //                             flex: 1,
      //                             child: Text(
      //                               "Txn Id",
      //                               style: TextStyle(
      //                                   fontSize: 17,
      //                                   fontWeight: FontWeight.w500),
      //                             ),
      //                           ),
      //                           Expanded(
      //                             flex: 2,
      //                             child: Text(
      //                                 billData.transactionId == null
      //                                     ? ""
      //                                     : billData.transactionId,
      //                                 style: const TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.w500)),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     spacer10Height,
      //                     const Padding(
      //                       padding: EdgeInsets.all(5.0),
      //                       child: Divider(),
      //                     ),
      //                     spacer10Height,
      //                     TabCard(
      //                       titletext: "Bill Date",
      //                       text: billData.billDate,
      //                     ),
      //                     TabCard(
      //                       titletext: "Due Date",
      //                       text: billData.billDueDate,
      //                     ),
      //               spacer20Height,
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             spacer40Height,

      //             // // Text(provider.billDate),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 InkWell(
      //                   borderRadius: BorderRadius.circular(5.0),
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (_) => UtilityPayment(
      //                                   amount: billData.billAmount,
      //                                   txnID: billData.transactionId,
      //                                 )));
      //                   },
      //                   child: Container(
      //                     width: MediaQuery.of(context).size.width - 120,
      //                     padding: const EdgeInsets.all(fixPadding * 1.2),
      //                     alignment: Alignment.center,
      //                     decoration: BoxDecoration(
      //                       color: PrimaryColor,
      //                       borderRadius: BorderRadius.circular(5),
      //                       // boxShadow: [
      //                       //   BoxShadow(
      //                       //     color: PrimaryColor.withOpacity(0.4),
      //                       //     spreadRadius: 2,
      //                       //     blurRadius: 2,
      //                       //   ),
      //                       // ],
      //                     ),
      //                     child: Text(
      //                       'Proceed',
      //                       style: white22BoldTextStyle,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
    )));
  }
}
