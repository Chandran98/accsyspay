import 'package:Accsys_Pay/MainApp/provider/service_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/constant.dart';
import '../constant/data_constant.dart';
import '../utils/main_app_utils.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    var serviceProvider =
        Provider.of<ServiceHistoryProvider>(context, listen: false);
    return ListView.builder(
      itemCount: serviceProvider.transactionHistory.length,
      itemBuilder: (context, index) {
        final datas = serviceProvider.transactionHistory[index].details[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Card(
            child: Container(
              decoration: boxDecoration(
                  bgColor: Colors.white,
                  showShadow: true,
                  radius: spacing_standard),
              padding: const EdgeInsets.all(spacing_standard),
              margin: const EdgeInsets.only(bottom: spacing_standard),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widthSpace,
                  widthSpace,
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            datas.status == 0
                                ? 'assets/icons/debit.png'
                                : 'assets/icons/credit.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                        spacer10Width,
                        Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${datas.payId}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              spacer20Height,
                              Text(
                                datas.createdAt,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade500),
                              ),
                              // Column(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         const Text(
                              //           "Amount",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.center,
                              //           children: [
                              //             Image.asset(
                              //               datas.mode == 0
                              //                   ? 'assets/inr.png'
                              //                   : 'assets/inr.png',
                              //               height: 15,
                              //               width: 15,
                              //               color: datas.mode == 0
                              //                   ? redColor
                              //                   : greenColor,
                              //             ),
                              //             const SizedBox(
                              //               width: 10,
                              //             ),
                              //             Text(
                              //               datas.amount.toString(),
                              //               style: datas.mode == 0
                              //                   ? red18BoldTextStyle
                              //                   : green18BoldTextStyle,
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         const Text(
                              //           "Created",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         Text(
                              //           datas.createdAt,
                              //           style: black18BoldTextStyle,
                              //         ),
                              //       ],
                              //     ),
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         const Text(
                              //           "Open Balance",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         Text(
                              //           datas.openBal.toString(),
                              //           style: black18BoldTextStyle,
                              //         ),
                              //       ],
                              //     ),
                              //     Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         const Text(
                              //           "Close Balance",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         Text(
                              //           datas.closeBal.toString(),
                              //           style: black18BoldTextStyle,
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),

                              // Text(
                              //   '${item['date']} ${item['time']}',
                              //   style: grey14RegularTextStyle,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 12),
                        child: Text("₹ ${datas.amount.toString()}",
                            style: datas.status == 0
                                ? TextStyle(
                                    color: redColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  )
                                : TextStyle(
                                    color: greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  )),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
