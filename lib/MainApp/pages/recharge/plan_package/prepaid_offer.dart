import 'package:Accsys_Pay/MainApp/provider/recharge_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../utils/main_app_utils.dart';
import '../../../utils/shimmer_List.dart';
import '../amountpaid.dart';

class PrepaidPlanOffer extends StatefulWidget {
  const PrepaidPlanOffer({Key key}) : super(key: key);
  @override
  State<PrepaidPlanOffer> createState() => _PrepaidPlanOfferState();
}

class _PrepaidPlanOfferState extends State<PrepaidPlanOffer> {
  @override
  Widget build(BuildContext context) {
    var offerProvider = Provider.of<RechargeProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: offerProvider.loading
                ? ShimmerListComponent()
                : ListView.builder(
                    itemCount: offerProvider.prepaidOffer.length,
                    itemBuilder: (BuildContext context, int index) {
                      var jsondata =
                          offerProvider.prepaidOffer[index].details[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RechargePaymentPage(
                                      amount: jsondata.rs)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: ExpansionTile(
                            iconColor: PrimaryColor,
                            textColor: PrimaryColor,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Package",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      jsondata.rs,
                                      style: GoogleFonts.inter(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description",
                                      style: GoogleFonts.inter(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    spacer10Height,
                                    Text(
                                      jsondata.desc,
                                      style: GoogleFonts.inter(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
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
