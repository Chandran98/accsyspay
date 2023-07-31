import 'package:Accsys_Pay/MainApp/pages/utiltiy/5_utility_payment_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../constant/data_constant.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/Card.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/hover_message.dart';
import '../amountpaid.dart';
import '../dth_screens/4_dth_recharge_screen.dart';
import '4_fastag_rechrge.dart';

class FastagAccInfoScreen extends StatefulWidget {
  const FastagAccInfoScreen({Key key}) : super(key: key);

  @override
  State<FastagAccInfoScreen> createState() => _FastagAccInfoScreenState();
}

class _FastagAccInfoScreenState extends State<FastagAccInfoScreen> {
  final _amountController = TextEditingController();
  void onBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var loader = Provider.of<UtilityProvider>(context);
    var provider =
        Provider.of<UtilityProvider>(context, listen: false).fetchbilldetails;
    var theme = Provider.of<ThemeProvider>(context);
    var billData = loader.fetchbilldetails.details;
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.darkTheme
              ? appColor.withOpacity(0.1)
              : const Color(0xFFEFF3FD),
          // appBar: AppBar(),

          body: provider.status == "error"
              ? const Center(
                  child: Text("Error"),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Account Info",
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
                                style: GoogleFonts.inter(
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
                                  style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              title: Text(
                                billData.customerName,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
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
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 6),
                                  child: Text(
                                    "Bill Details",
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                spacer20Height,
                                // TabCard(
                                //   titletext: "Bill Amount",
                                //   text: postPaid.details.amount,
                                // ),
                                TabCard(
                                  titletext: "Name",
                                  text: billData.customerName,
                                ),
                                // TabCard(
                                //   titletext: "Bill Date",
                                //   text: "${billData.transactionId.substring(0,20)}..." ,
                                // ),
                                // TabCard(
                                //   titletext: "Due Date",
                                //   text: billData.billDueDate,
                                // ),
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
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: theme.darkTheme
                                                ? const Color.fromARGB(
                                                    255, 190, 191, 192)
                                                : const Color(0xFFEFF3FD),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 70,
                                        width: 150,
                                        child: Center(
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            controller: _amountController,
                                            style: const TextStyle(
                                                fontSize: 26,
                                                color: black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          // child: Text(
                                          //   billData.billAmount,
                                          //   style: GoogleFonts.inter(
                                          //       fontSize: 18,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                        ),
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
                        // CustomBottomButton(
                        //   onTap: (){},
                        //   title: "Proceed",
                        //   loader: ,
                        // ),
                        InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          onTap: () {
                            if (_amountController.text == "") {
                              Utils.toastMessage(
                                  "Invalid Amount- Please check it Once again");
                            } else {
                              print(_amountController.text);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => FastagRechargeScreen(
                                          title: "Fastag",
                                          amount: _amountController.text,
                                          txId: billData.transactionId)));
                            }

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => RechargePaymentPage(
                            //             amount: _amountController.text)));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(fixPadding * 1.2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: PrimaryColor.withOpacity(0.4),
                              //     spreadRadius: 2,
                              //     blurRadius: 2,
                              //   ),
                              // ],
                            ),
                            child: Text(
                              'Proceed',
                              style: white22BoldTextStyle,
                            ),
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
