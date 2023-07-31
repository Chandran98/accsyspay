import 'package:Accsys_Pay/MainApp/provider/bus_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/app_bar.dart';
import 'package:Accsys_Pay/MainApp/utils/buttons/custom_button.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../pages/screens.dart';
import '../../../Models/bus_modal/search_city_modal.dart';
import '../../../constant/data_constant.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/clipper/ticket_clipper.dart';
import '../../../utils/hover_message.dart';
import '../../../utils/shimmer_List.dart';
import '../../wallet_history/transaction_history_screen.dart';
import '9_bus_history_screen.dart';

class SearchCities extends StatefulWidget {
  const SearchCities({Key key}) : super(key: key);

  @override
  State<SearchCities> createState() => _SearchCitiesState();
}

class _SearchCitiesState extends State<SearchCities> {
  @override
  void initState() {
    Provider.of<BusBookingProvider>(context, listen: false).fetchCities();
    Provider.of<BusBookingProvider>(context, listen: false)
        .busProviderHistory();
    super.initState();

    setState(() {
      _dateController.text = DateFormat.yMMMd().format(DateTime.now());
      selectedDate = DateTime.now();
    });
  }

  String selectedOption;
  final _editController = TextEditingController();

  City from, to;
  DateTime selectedDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String _setDate;
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    final busProvider = Provider.of<BusBookingProvider>(context);
    final cityProvider = Provider.of<BusBookingProvider>(context);

    final GlobalKey<AutoCompleteTextFieldState<City>> _autoCompleteKey =
        GlobalKey();
    final GlobalKey<AutoCompleteTextFieldState<City>> _autoComplete2Key =
        GlobalKey();
    TextEditingController _textEditingController = TextEditingController();
    final TextEditingController _textEditing2Controller =
        TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "Bus Booking",
              ),
              spacer10Height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacer10Height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: theme.darkTheme ? black : white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Where would you like\n ',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: theme.darkTheme ? white : black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'to go',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      )),
                                  TextSpan(
                                      text: ' Today?',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          color: appColor,
                                          fontSize: 17.sp)),
                                ],
                              ),
                            ),
                            spacer20Height,
                            Container(
                              padding: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: theme.darkTheme ? black : white,
                              ),
                              child: Autocomplete<City>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<City>.empty();
                                  }
                                  return cityProvider.cities.where((city) {
                                    final cityName =
                                        city.cityName.toUpperCase();
                                    return cityName.contains(
                                        textEditingValue.text.toUpperCase());
                                  });
                                },
                                displayStringForOption: (City city) =>
                                    city.cityName,
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController controller,
                                    FocusNode focusNode,
                                    VoidCallback onFieldSubmitted) {
                                  _textEditingController = controller;
                                  return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        icon: Container(
                                          height: 3.2.h,
                                          width: 6.5.w,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(
                                              CupertinoIcons.location,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                        // labelStyle:
                                        //     TextStyle(color: appColor),
                                        hintText: 'From',
                                      )
                                      // label: Text("From")),
                                      );
                                },
                                onSelected: (City selection) {
                                  setState(() {
                                    from = selection;
                                  });
                                },
                              ),
                            ),
                            spacer20Height,
                            Container(
                              padding: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: theme.darkTheme ? black : white,
                              ),
                              child: Autocomplete<City>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<City>.empty();
                                  }
                                  return cityProvider.cities.where((city) {
                                    final cityName =
                                        city.cityName.toUpperCase();
                                    return cityName.contains(
                                        textEditingValue.text.toUpperCase());
                                  });
                                },
                                displayStringForOption: (City city) =>
                                    city.cityName,
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController controller,
                                    FocusNode focusNode,
                                    VoidCallback onFieldSubmitted) {
                                  _textEditingController = controller;
                                  return TextField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    decoration: InputDecoration(
                                      icon: Container(
                                        height: 3.2.h,
                                        width: 6.5.w,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            CupertinoIcons.location_solid,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      hintText: 'To',
                                    ),
                                  );
                                },
                                onSelected: (City selection) {
                                  setState(() {
                                    to = selection;
                                  });
                                },
                              ),
                            ),
                            spacer30Height,
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomNameIcon(
                                      name: 'Departure Date',
                                      icon: Icons.date_range,
                                      color: Colors.blue,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: theme.darkTheme
                                              ? Colors.grey
                                              : Colors.grey[100]),
                                      child: TextFormField(
                                        style: const TextStyle(fontSize: 15),
                                        textAlign: TextAlign.center,
                                        enabled: false,
                                        keyboardType: TextInputType.text,
                                        controller: _dateController,
                                        onSaved: (String val) {
                                          _setDate = val;
                                          print(val);
                                        },
                                        decoration: const InputDecoration(
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                            contentPadding:
                                                EdgeInsets.only(top: 0.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            spacer10Height,
                            from == "" || from == null && to == "" || to == null
                                ? SizedBox()
                                : Text(
                                    "* Trip starts from ${from.cityName} and moves towards ${to.cityName} on ${_dateController.text}",
                                    style: GoogleFonts.inter(
                                        color: theme.darkTheme ? white : black),
                                  ),
                            spacer30Height,
                            CustomBottomButton(
                              onTap: () {
                                from == "" ||
                                        from == null && to == "" ||
                                        to == null
                                    ? Utils.toastMessage(
                                        "Please select Source and Destination")
                                    : cityProvider.seatAvailableTrips(
                                        from,
                                        to,
                                        formatter.format(selectedDate),
                                        context);
                              },
                              title: "Search Buses",
                              color: Colors.white,
                              loader: cityProvider.loading,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              spacer40Height,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recent Trips",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        const BusHistoryScreen()));
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
                    spacer30Height,
                    // busProvider.loading
                    //     ? const TransactionShimmerList()
                    //     :
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: busProvider.busticketHistory.length >= 3
                          ? 3
                          : busProvider.busticketHistory.length,
                      itemBuilder: (context, index) {
                        final data = busProvider.busticketHistory[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: InkWell(
                              onTap: () {
                                busProvider.seatPrintTicket(
                                    data.details[index].payId, context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) =>
                                //             TicketDetailsScreen()));
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
                    spacer30Height,
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMMMd().format(selectedDate);
      });
    }
  }
}

class CustomNameIcon extends StatelessWidget {
  IconData icon;
  String name;
  Color color;
  CustomNameIcon({Key key, this.icon, this.name, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Container(
          height: 3.2.h,
          width: 6.5.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              icon,
              size: 11.sp,
              color: Colors.white,
            ),
          ),
        ),
        spacer20Width,
        Text(
          name,
          style: GoogleFonts.inter(
            color: theme.darkTheme ? white : black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
