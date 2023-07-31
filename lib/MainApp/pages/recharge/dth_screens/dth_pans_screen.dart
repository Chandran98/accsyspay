import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../utils/shimmer_List.dart';
import '4_dth_recharge_screen.dart';

class DthPlanDetails extends StatefulWidget {
  const DthPlanDetails({Key key}) : super(key: key);

  @override
  State<DthPlanDetails> createState() => _DthPlanDetailsState();
}

class _DthPlanDetailsState extends State<DthPlanDetails> {
  @override
  Widget build(BuildContext context) {
    var offerProvider = Provider.of<DthProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: offerProvider.loading
                ? const ShimmerListComponent()
                : ListView.builder(
                    itemCount: offerProvider.dthPlan.length,
                    itemBuilder: (BuildContext context, int index) {
                      var jsondata =
                          offerProvider.dthPlan[index].details[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DthRechargeScreen()));
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
                                    const Text(
                                      "Package",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      jsondata.amount,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "validity",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      jsondata.validity,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Description",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      jsondata.description,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
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
