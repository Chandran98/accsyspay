import 'package:carousel_slider/carousel_slider.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';
import 'package:intl/intl.dart';

class TicketsBooking extends StatefulWidget {
  final int currentValue;
  const TicketsBooking({Key key, this.currentValue = 0}) : super(key: key);

  @override
  _TicketsBookingState createState() => _TicketsBookingState();
}

class _TicketsBookingState extends State<TicketsBooking> {
  String fromCity = 'Mumbai';
  String toCity = 'Delhi';
  String sourceCity = 'Jaipur';
  String destinationCity = 'Srinagar';
  String ticketClass;
  String isSelected = 'oneway';
  String isTap = 'All';

  DateTime selectedDepartureDate = DateTime.now();
  DateTime selectedReturnDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 21, minute: 00);
  int adults = 1;
  int children = 0;
  int infants = 0;
  String noOfTravellers = '1 Adult';
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final bannerList = [
    {
      'image': 'assets/moive/shershaah.png',
      'moiveName': 'Shershaah',
      'cashBack': '50%',
    },
    {
      'image': 'assets/moive/bellbottom.png',
      'moiveName': 'Bellbottom',
      'cashBack': '40%',
    },
    {
      'image': 'assets/moive/chhichhore.png',
      'moiveName': 'Chhichhore',
      'cashBack': '30%',
    },
  ];

  final moiveLanguageList = [
    {'language': 'All'},
    {'language': 'Hindi'},
    {'language': 'English'},
    {'language': 'Marathi'},
    {'language': 'Tamil'},
    {'language': 'Panjabi'},
    {'language': 'Telugu'},
  ];

  final moiveList = [
    {
      'image': 'assets/moive/bellbottom.png',
      'name': 'Bell Bottom',
      'type': 'Hindi (U/A)',
    },
    {
      'image': 'assets/moive/chhichhore.png',
      'name': 'Chhichhore',
      'type': 'Hindi (U/A)',
    },
    {
      'image': 'assets/moive/dreamgirl.png',
      'name': 'Dream Girl',
      'type': 'Hindi (U/A)',
    },
    {
      'image': 'assets/moive/bellbottom.png',
      'name': 'Bell Bottom',
      'type': 'Hindi (U/A)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.currentValue,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Book a Tickets',
            style: black20BoldTextStyle,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
            indicatorColor: orangeColor,
            labelColor: orangeColor,
            unselectedLabelColor: greyColor,
            labelStyle: orange20SemiBoldTextStyle,
            unselectedLabelStyle: grey20SemiBoldTextStyle,
            tabs: const [
              Tab(text: 'Flight'),
              Tab(text: 'Bus'),
              Tab(text: 'Moive'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            flight(),
            bus(),
            moive(),
          ],
        ),
      ),
    );
  }

  flight() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          child: Row(
            children: [
              onewayButton(),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              roundtripButton(),
            ],
          ),
        ),
        selectFromCity(),
        selectToCity(),
        Row(
          children: [
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            departureDate(),
            isSelected == 'roundtrip'
                ? const SizedBox(width: 20)
                : const SizedBox(),
            isSelected == 'roundtrip' ? returnDate() : Container(),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 4.0,
          ),
          child: Row(
            children: [
              travellers(),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              flightClass(),
            ],
          ),
        ),
        searchFlightsButton(),
      ],
    );
  }

  roundtripButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          setState(() {
            isSelected = 'roundtrip';
          });
        },
        child: Container(
          padding: const EdgeInsets.all(fixPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == 'roundtrip' ? PrimaryColor : whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: isSelected == 'roundtrip'
                    ? PrimaryColor.withOpacity(0.4)
                    : blackColor.withOpacity(0.1),
                spreadRadius: 1.2,
                blurRadius: 1.2,
              ),
            ],
          ),
          child: Text(
            'Roundtrip',
            style: isSelected == 'roundtrip'
                ? white20BoldTextStyle
                : PrimaryColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }

  onewayButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          setState(() {
            isSelected = 'oneway';
          });
        },
        child: Container(
          padding: const EdgeInsets.all(fixPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == 'oneway' ? PrimaryColor : whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: isSelected == 'oneway'
                    ? PrimaryColor.withOpacity(0.4)
                    : blackColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Oneway',
            style: isSelected == 'oneway'
                ? white20BoldTextStyle
                : PrimaryColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }

  selectFromCity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(left: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                value: fromCity,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    fromCity = newValue;
                  });
                },
                items: <String>[
                  'Mumbai',
                  'Bangalore',
                  'Hyderabad',
                  'Jaipur',
                  'Bhopal',
                  'Patna',
                  'Ahmedabad',
                  'Chennai',
                  'Kolkata',
                  'Surat',
                  'Kanpur',
                  'Srinagar',
                  'Delhi',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectToCity() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(left: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                value: toCity,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    toCity = newValue;
                  });
                },
                items: <String>[
                  'Mumbai',
                  'Bangalore',
                  'Hyderabad',
                  'Jaipur',
                  'Bhopal',
                  'Patna',
                  'Ahmedabad',
                  'Chennai',
                  'Kolkata',
                  'Surat',
                  'Kanpur',
                  'Srinagar',
                  'Delhi',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  departureDate() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Departure Date',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.2),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: InkWell(
              onTap: () => departureDateDialog(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('d MMM y').format(selectedDepartureDate),
                    style: black18SemiBoldTextStyle,
                  ),
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: greyColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  departureDateDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDepartureDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDepartureDate) {
      setState(() {
        selectedDepartureDate = picked;
      });
    }
  }

  returnDate() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Return Date',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.2),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: InkWell(
              onTap: () => returnDateDialog(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('d MMM y').format(selectedReturnDate),
                    style: black18SemiBoldTextStyle,
                  ),
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: greyColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  returnDateDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedReturnDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedReturnDate) {
      setState(() {
        selectedReturnDate = picked;
      });
    }
  }

  travellers() {
    return StatefulBuilder(builder: (context, setState) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travellers',
              style: grey16SemiBoldTextStyle,
            ),
            heightSpace,
            Container(
              padding: const EdgeInsets.all(fixPadding * 1.2),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.1),
                    spreadRadius: 1.2,
                    blurRadius: 1.2,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => numberOfTravellers(),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        noOfTravellers,
                        overflow: TextOverflow.ellipsis,
                        style: black18SemiBoldTextStyle,
                      ),
                    ),
                    widthSpace,
                    const Icon(
                      Icons.add_circle,
                      color: greyColor,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  numberOfTravellers() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  fixPadding * 1.5,
                  fixPadding * 2.0,
                  fixPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No of Travellers',
                      style: black20BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adults',
                              style: black18SemiBoldTextStyle,
                            ),
                            Text(
                              '12+ years',
                              style: grey16RegularTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  adults++;
                                  noOfTravellers = '$adults Adult';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              adults.toString(),
                              style: black14ExtraBoldTextStyle,
                            ),
                            widthSpace,
                            widthSpace,
                            InkWell(
                              onTap: () {
                                setState(() {
                                  adults == 0 ? adults = 0 : adults--;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Children',
                              style: black18SemiBoldTextStyle,
                            ),
                            Text(
                              '2 - 12 years',
                              style: grey16RegularTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  children++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              children.toString(),
                              style: black14ExtraBoldTextStyle,
                            ),
                            widthSpace,
                            widthSpace,
                            InkWell(
                              onTap: () {
                                setState(() {
                                  children == 0 ? children = 0 : children--;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Infants',
                              style: black18SemiBoldTextStyle,
                            ),
                            Text(
                              '0 - 2 years',
                              style: grey16RegularTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  infants++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              infants.toString(),
                              style: black14ExtraBoldTextStyle,
                            ),
                            widthSpace,
                            widthSpace,
                            InkWell(
                              onTap: () {
                                setState(() {
                                  infants == 0 ? infants = 0 : infants--;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      },
    );
  }

  flightClass() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Class',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(left: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                value: ticketClass,
                style: black18SemiBoldTextStyle,
                hint: Text(
                  'Economy',
                  style: black18SemiBoldTextStyle,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    ticketClass = newValue;
                  });
                },
                items: <String>[
                  'Economy',
                  'Business',
                  'First Class',
                  'Premium Economy',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  searchFlightsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: SearchFlights(fromCity: fromCity, toCity: toCity),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 120,
            padding: const EdgeInsets.all(fixPadding * 1.2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: PrimaryColor.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Text(
              'Search Flights',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  bus() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        selectSourceCity(),
        selectdestinationCity(),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 4.0,
          ),
          child: Row(
            children: [
              busDepartureDate(),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              travelTime(),
            ],
          ),
        ),
        searchBusButton(),
      ],
    );
  }

  selectSourceCity() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Source City',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(left: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                value: sourceCity,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    sourceCity = newValue;
                  });
                },
                items: <String>[
                  'Mumbai',
                  'Bangalore',
                  'Hyderabad',
                  'Jaipur',
                  'Bhopal',
                  'Patna',
                  'Ahmedabad',
                  'Chennai',
                  'Kolkata',
                  'Surat',
                  'Kanpur',
                  'Srinagar',
                  'Delhi',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectdestinationCity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Destination City',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(left: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                value: destinationCity,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    destinationCity = newValue;
                  });
                },
                items: <String>[
                  'Mumbai',
                  'Bangalore',
                  'Hyderabad',
                  'Jaipur',
                  'Bhopal',
                  'Patna',
                  'Ahmedabad',
                  'Chennai',
                  'Kolkata',
                  'Surat',
                  'Kanpur',
                  'Srinagar',
                  'Delhi',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  busDepartureDate() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Departure Date',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.2),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: InkWell(
              onTap: () => dateDialog(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('d MMM y').format(selectedDate),
                    style: black18SemiBoldTextStyle,
                  ),
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: greyColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dateDialog() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  travelTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Travel Time',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.2),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.1),
                  spreadRadius: 1.2,
                  blurRadius: 1.2,
                ),
              ],
            ),
            child: InkWell(
              onTap: () => selectTime(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time.format(context),
                    style: black18SemiBoldTextStyle,
                  ),
                  const Icon(
                    Icons.access_time,
                    color: greyColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }
  }

  searchBusButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: SearchBus(
                sourceCity: sourceCity,
                destinationCity: destinationCity,
              ),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 120,
            padding: const EdgeInsets.all(fixPadding * 1.2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: PrimaryColor.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Text(
              'Search Buses',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  moive() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        banner(),
        moives(),
        heightSpace,
        heightSpace,
      ],
    );
  }

  banner() {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: 187,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: bannerList
              .map((item) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 1.5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        PageTransition(
                          child: CinemaSeatSelection(
                            image: item['image'],
                            moiveName: item['moiveName'],
                          ),
                          type: PageTransitionType.rightToLeft,
                        ),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                item['image'],
                                width: double.infinity,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(fixPadding),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'GET',
                                        style: black14SemiBoldTextStyle,
                                      ),
                                      TextSpan(
                                        text: ' ${item['cashBack']} ',
                                        style: red14ExtraBoldTextStyle,
                                      ),
                                      TextSpan(
                                        text: 'CASHBACK ON MOIVE TICKETS',
                                        style: black14SemiBoldTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? orangeColor
                      : greyColor.withOpacity(0.7),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  moives() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: fixPadding * 2.0,
            bottom: fixPadding * 1.5,
          ),
          height: 40,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: moiveLanguageList.length,
            itemBuilder: (context, index) {
              final item = moiveLanguageList[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: fixPadding,
                  left: index == 0 ? fixPadding * 2.0 : 0,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    setState(() {
                      isTap = item['language'];
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isTap == item['language'] ? orangeColor : whiteColor,
                      border: Border.all(color: orangeColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item['language'],
                      style: isTap == item['language']
                          ? white16ExtraBoldTextStyle
                          : orange16ExtraBoldTextStyle,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ColumnBuilder(
          itemCount: moiveList.length,
          itemBuilder: (context, index) {
            final item = moiveList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
                vertical: fixPadding / 2,
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: CinemaSeatSelection(
                      image: item['image'],
                      moiveName: item['name'],
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          item['image'],
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: black14SemiBoldTextStyle,
                                  ),
                                  Text(
                                    item['type'],
                                    style: grey12RegularTextStyle,
                                  ),
                                ],
                              ),
                              Text(
                                'Book Now',
                                style: PrimaryColor14ExtraBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
