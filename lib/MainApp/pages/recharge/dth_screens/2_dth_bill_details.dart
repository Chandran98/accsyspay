// ignore_for_file: must_be_immutable

import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/wallet_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../pages/screens.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../setting_screen/faq_screen.dart';
import '3_dth_account_info.dart';

class DthBillDetailsScreen extends StatefulWidget {
  DthBillDetailsScreen({Key key, this.id, this.name}) : super(key: key);
  String id;
  String name;

  @override
  State<DthBillDetailsScreen> createState() => _DthBillDetailsScreenState();
}

class _DthBillDetailsScreenState extends State<DthBillDetailsScreen> {
  final _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DthProvider>(context);
    var walletprovider = Provider.of<WalletProvider>(context);
    print("mybill${walletprovider.handlingCharges}");

    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          iconTheme: const IconThemeData(color: white),
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 17),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FaqScreen()));
                },
                icon: const Icon(
                  Icons.info_outline,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomAppBar(
                //   title: widget.name,
                // ),
                spacer30Height,
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.darkTheme ? black : white,
                        border: Border.all(color: Colors.grey.shade300)),
                    // padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacer30Height,
                        Text(
                          "Biller Details",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        spacer20Height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "ID",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(widget.id,
                                style: TextStyle(
                                    fontSize: 11.5.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        spacer10Height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Provider",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(widget.name,
                                style: TextStyle(
                                    fontSize: 11.5.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        spacer10Height,
                        Divider(
                          color: Colors.grey.shade500,
                        ),
                        // TabCard(
                        //   titletext: "Biller ID",
                        //   text: widget.id,
                        // ),
                        spacer20Height,
                        Text(
                          "Account No.",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        spacer10Height,
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '********'),
                          controller: _accountController,
                        ),
                      ],
                    ),
                  ),
                ),
                spacer40Height,

                CustomBottomButton(
                  onTap: () {
                    provider.dthAccountInfo(
                        widget.id, _accountController.text, context);
                  },
                  title: "Proceed",
                  color: white,
                  loader: provider.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
