import 'dart:convert';
import 'package:Accsys_Pay/MainApp/constant/app_url.dart';
import 'package:Accsys_Pay/MainApp/pages/wallet_history/transaction_history_screen.dart';
import 'package:Accsys_Pay/MainApp/utils/card/custom_transcation_card.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import '../provider/auth_provider.dart';
import '../provider/themeprovider.dart';
import '../provider/wallet_provider.dart';
import '../utils/app_bar.dart';
import '../utils/shimmer_List.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({Key key}) : super(key: key);

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController amountController = TextEditingController();

  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, postWalletHistory);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  int paid = 0;

  final PrefService prefService = PrefService();
  openCheckout(amount) async {
    var name = await prefService.getname("name");
    RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
    double money = double.parse(amount);
    double tMoney = money * 100;
    String stringMoney = tMoney.toString().replaceAll(regex, '');
    int totalMoney = int.parse(stringMoney);
    setState(() {
      paid = totalMoney;
    });
    var options = {
      'key': 'rzp_test_HjGAinZNMpVBaE',
      'amount': totalMoney,
      'name': name,
      'description': 'Payment',
      // 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    _razorpay.open(options);
  }

  postWalletHistory(PaymentSuccessResponse response) async {
    var userId = await prefService.getUserId("user_id");

    final url = AppURl.addWallet;
    final body = {
      "user_id": userId,
      "amount": (paid * 0.01).toString(),
      "description": "Razorpay-${response.paymentId}"
    };

    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        print(jsonData);
      } else {
        print('Failed to load wallet history');
      }
    } catch (e) {
      print('Failed to connect to server: $e');
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: " + response.walletName,
    );
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void onBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var walletProvider = Provider.of<WalletProvider>(context);
    // var razorpayProvider = Provider.of<RazorpayProvider>(context,listen: false);
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Image.asset(
                "assets/images/logo/vl.png",
                scale: 6,
              )
            ],
            backgroundColor: PrimaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            titleSpacing: 0,
            // leading: IconButton(
            //   onPressed: () => Navigator.pop(context),
            //   icon: const Icon(Icons.arrow_back_ios),
            // ),
            title: const Text(
              'Add Money',
              // style: black20BoldTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // spacer50Height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacer50Height,
                      const Text(
                        "Add money to your accsys pay wallet ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                      // Lottie.asset("assets/lottie/addmoney2.json", width: 250),
                      // spacer10Height,
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spacer20Height,
                            TextFormField(
                              controller: amountController,
                              // ignore: missing_return
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid amount';
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            spacer20Height,
                            InkWell(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    openCheckout(amountController.text);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  color: PrimaryColor,
                                  child: const Center(
                                      child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                )),
                            spacer50Height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Recent Transaction",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                TransactionHistoryScreen()));
                                  },
                                  child: Text(
                                    "see all",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: appColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            spacer30Height
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: walletProvider.loading
                        ? const TransactionShimmerList()
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: walletProvider
                                        .walletInflowHistoryList.length >=
                                    3
                                ? 3
                                : walletProvider.walletInflowHistoryList.length,
                            itemBuilder: (context, index) {
                              final data =
                                  walletProvider.walletInflowHistoryList[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(30),
                                            ),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 150.0,
                                                      vertical: 8),
                                                  child: Divider(
                                                    // color: Colors.grey,
                                                    thickness: 3,
                                                  ),
                                                ),
                                                spacer30Height,
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Order Id",
                                                            style: TextStyle(
                                                                // color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        15.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .green
                                                                      .shade200,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0,
                                                                    vertical:
                                                                        4),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/icons/success.png",
                                                                      scale: 20,
                                                                    ),
                                                                    spacer5Width,
                                                                    const Text(
                                                                      "success",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      spacer10Height,
                                                      Text(
                                                        data.description,
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16),
                                                      ),
                                                      spacer20Height,
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    18.0),
                                                        child: Divider(),
                                                      ),
                                                      spacer20Height,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    12.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: const [
                                                                    Icon(
                                                                      Icons
                                                                          .timelapse_outlined,
                                                                      color:
                                                                          PrimaryColor,
                                                                    ),
                                                                    spacer5Width,
                                                                    Text(
                                                                        "Created at")
                                                                  ],
                                                                ),
                                                                Text(
                                                                    data.createdAt,
                                                                    style: const TextStyle(
                                                                        // color: Colors.black,
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.w700)),
                                                              ],
                                                            ),
                                                            spacer20Height,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Text(
                                                                    "Amount"),
                                                                Text(
                                                                  "₹ ${data.amount.toString()}",
                                                                  style: data.mode ==
                                                                          0
                                                                      ? const TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w700)
                                                                      : const TextStyle(
                                                                          color:
                                                                              Colors.green,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    18.0),
                                                        child: Divider(),
                                                      ),
                                                      spacer20Height,
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                              child: Column(
                                                            children: [
                                                              const Text(
                                                                "Open Balance",
                                                                style: TextStyle(
                                                                    // color: Colors.black,
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w700),
                                                              ),
                                                              spacer5Height,
                                                              Text(
                                                                  data
                                                                      .openBal
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                            ],
                                                          )),
                                                          Expanded(
                                                              child: Column(
                                                            children: [
                                                              const Text(
                                                                "Close Balance",
                                                                style: TextStyle(
                                                                    // color: Colors.black,
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w700),
                                                              ),
                                                              spacer5Height,
                                                              Text(
                                                                  data.closeBal
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                            ],
                                                          ))
                                                        ],
                                                      ),
                                                      spacer20Height,
                                                      const Divider(),
                                                      spacer10Height,
                                                      Row(
                                                        children: [
                                                          const Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                "If you need any support, please Contact support team",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        12),
                                                              )),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              height: 50,
                                                              width: 50,
                                                              child: const Icon(
                                                                Icons.call,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    PrimaryColor,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: CustomTransactionCard(
                                      data: data,
                                    )),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddMoneyScreen2 extends StatelessWidget {
  const AddMoneyScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              title: "",
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset("assets/images/cs.png"),
            // RichText(
            //   text: TextSpan(
            //     text: "We're  ",
            //     style: GoogleFonts.inter(
            //         fontSize: 28,
            //         wordSpacing: 2,
            //         color: theme.darkTheme ? white : black,
            //         fontWeight: FontWeight.w600),
            //     children: <TextSpan>[
            //       //
            //       TextSpan(
            //         text: 'Coming soon',
            //         style: GoogleFonts.inter(
            //             fontSize: 28,
            //             wordSpacing: 2,
            //             fontWeight: FontWeight.w600,
            //             color: appColor),
            //       ),

            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
