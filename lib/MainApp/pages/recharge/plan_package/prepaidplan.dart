import 'package:Accsys_Pay/MainApp/provider/recharge_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../utils/shimmer_List.dart';
import '../amountpaid.dart';
import '../mobile_pin_screen.dart';

class PrePaidPlanScreen extends StatefulWidget {
  const PrePaidPlanScreen({Key key}) : super(key: key);

  @override
  State<PrePaidPlanScreen> createState() => _PrePaidPlanScreenState();
}

class _PrePaidPlanScreenState extends State<PrePaidPlanScreen> {
  @override
  Widget build(BuildContext context) {
    var offerProvider = Provider.of<RechargeProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: offerProvider.loading
                ? ShimmerListComponent()
                : ListView.builder(
                    itemCount: offerProvider.prepaidPlan.length,
                    itemBuilder: (BuildContext context, int index) {
                      var jsondata =
                          offerProvider.prepaidPlan[index].details[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MobileAuthenticateScreen(
                                      amount: jsondata.amount)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: ExpansionTile(iconColor: PrimaryColor,textColor:PrimaryColor ,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                     Text(
                                      "Package",
                                      style: GoogleFonts.inter(
                                          
                                    fontSize: 15.0, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      jsondata.amount,
                                      style:  GoogleFonts.inter(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                     Text(
                                      "validity",
                                      style: GoogleFonts.inter(
                                    fontSize: 15.0, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      jsondata.validity,
                                      style:  GoogleFonts.inter(
                                    fontSize: 15.0, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom:8.0),
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        "Description",
                                        style: GoogleFonts.inter(
                                      fontSize: 15.0, fontWeight: FontWeight.w600),
                                      ),spacer10Height,
                                      Text(
                                        jsondata.descr,
                                        style:  GoogleFonts.inter(
                                      fontSize: 13.0, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )));
  
  
  }
}
