import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../pages/screens.dart';
import '../../../constant/colors/colors.dart';
import '../../../constant/data_constant.dart';
import '../../../provider/bus_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/main_app_utils.dart';
import '../../../utils/shimmer_List.dart';

class BusHistoryScreen extends StatefulWidget {
  const BusHistoryScreen({Key key}) : super(key: key);

  @override
  State<BusHistoryScreen> createState() => _BusHistoryScreenState();
}

class _BusHistoryScreenState extends State<BusHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BusBookingProvider>(context, listen: false)
        .busProviderHistory();
  }

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<BusBookingProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: appColor,
              iconTheme: IconThemeData(color: white),
              title: Text(
                "Booking History",
                style: GoogleFonts.inter(
                    color: theme.darkTheme ? Colors.black : Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: busProvider.busticketHistory.length,
                      itemBuilder: (context, index) {
                        final data = busProvider.busticketHistory[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: InkWell(
                              onTap: () {
                                busProvider.seatPrintTicket(
                                    data.details[index].payId, context);
                              },
                              child: Card(
                                child: Container(
                                  decoration: boxDecoration(
                                      // bgColor: Colors.white,
                                      showShadow: true,
                                      radius: spacing_standard),
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(
                                      bottom: spacing_standard),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      widthSpace,
                                      widthSpace,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              data.details[index].status == 0
                                                  ? 'assets/icons/debit.png'
                                                  : 'assets/icons/credit.png',
                                              height: 5.h,
                                              width: 15.w,
                                            ),
                                          ),
                                          spacer10Width,
                                          Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Order Id: ${data.details[index].orderNo}",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: appColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                        data.details[index]
                                                            .payId,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 10.sp,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      spacer10Height,
                                      spacer5Height,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              "        ${data.details[index].createdAt}",
                                              style: GoogleFonts.inter(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey.shade500),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: Text(
                                                  "₹ ${data.details[index].amount.toStringAsFixed(2)}",
                                                  style: GoogleFonts.inter(
                                                    color: Colors.green,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
