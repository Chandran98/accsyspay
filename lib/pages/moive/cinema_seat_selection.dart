import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';

import '../../MainApp/constant/constant.dart';

class CinemaSeatSelection extends StatefulWidget {
  final String image;
  final String moiveName;
  const CinemaSeatSelection({Key key, this.image, this.moiveName})
      : super(key: key);

  @override
  _CinemaSeatSelectionState createState() => _CinemaSeatSelectionState();
}

class _CinemaSeatSelectionState extends State<CinemaSeatSelection> {
  double height, width;
  String location = 'Surat';
  String cinema = 'Rajhans Cinemas';
  final CalendarWeekController _controller = CalendarWeekController();
  Color color = orangeColor;
  TextStyle style = white16BoldTextStyle;
  String selectedDate = DateFormat('d MMM').format(DateTime.now());
  String selectedTime = '05:10 pm';
  int selectedSeats = 3;

  final slotList = [
    {'time': '10:30 am'},
    {'time': '12:00 am'},
    {'time': '01:20 pm'},
    {'time': '02:45 pm'},
    {'time': '03:15 pm'},
    {'time': '05:10 pm'},
  ];

  final leftSeatsList = [
    {
      'row': 'A',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'B',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'C',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'D',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'E',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'F',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'G',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'H',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
  ];

  final centerSeatsList = [
    {
      'row': 'A',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'B',
      'seats': [
        {'status': 'yourSeat'},
        {'status': 'yourSeat'},
        {'status': 'yourSeat'},
      ],
    },
    {
      'row': 'C',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'D',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'E',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'F',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
  ];

  final rightSeatsList = [
    {
      'row': 'A',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'B',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'C',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'D',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'E',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'F',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': 'G',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
    {
      'row': 'H',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Moive Tickets',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          heightSpace,
          heightSpace,
          moiveDetail(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              0,
              fixPadding * 2.0,
              fixPadding * 1.5,
            ),
            child: Row(
              children: [
                selectLocation(),
                widthSpace,
                widthSpace,
                widthSpace,
                widthSpace,
                selectCinema(),
              ],
            ),
          ),
          date(),
          slots(),
          cinemaHallSeats(),
          bookSeatButton(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  cinemaHallSeats() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 118,
                child: ColumnBuilder(
                  mainAxisSize: MainAxisSize.min,
                  itemCount: leftSeatsList.length,
                  itemBuilder: (context, index) {
                    final item = leftSeatsList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == 3 ? fixPadding * 2.8 : fixPadding,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 16,
                            child: Text(
                              item['row'],
                              style: black16SemiBoldTextStyle,
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          Expanded(
                            child: seats(item['seats']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 70,
                child: ColumnBuilder(
                  mainAxisSize: MainAxisSize.min,
                  itemCount: centerSeatsList.length,
                  itemBuilder: (context, index) {
                    final item = centerSeatsList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == 1 ? fixPadding * 2.8 : fixPadding,
                      ),
                      child: seats(item['seats']),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 95,
                child: ColumnBuilder(
                  mainAxisSize: MainAxisSize.min,
                  itemCount: rightSeatsList.length,
                  itemBuilder: (context, index) {
                    final item = rightSeatsList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == 3 ? fixPadding * 2.8 : fixPadding,
                      ),
                      child: seats(item['seats']),
                    );
                  },
                ),
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    'Available',
                    style: black18SemiBoldTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    'Booked',
                    style: black18SemiBoldTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    'Your Seats',
                    style: black18SemiBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  seats(seat) {
    return SizedBox(
      height: 16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seat.length,
        itemBuilder: (context, index) {
          final items = seat[index];
          return Padding(
            padding: const EdgeInsets.only(right: fixPadding),
            child: InkWell(
              onTap: () {
                setState(() {
                  items['status'] = items['status'] == 'available'
                      ? 'yourSeat'
                      : items['status'] == 'yourSeat'
                          ? 'available'
                          : 'booked';
                  selectedSeats = items['status'] == 'yourSeat'
                      ? selectedSeats + 1
                      : items['status'] == 'available'
                          ? selectedSeats - 1
                          : selectedSeats;
                });
              },
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: items['status'] == 'booked'
                      ? greyColor.withOpacity(0.65)
                      : items['status'] == 'available'
                          ? greenColor
                          : orangeColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  moiveDetail() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding / 2,
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.125,
            width: width - 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.moiveName,
                style: black16BoldTextStyle,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star_rounded,
                    color: yellowColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: yellowColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: yellowColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: yellowColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: yellowColor,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/social_media/youtube.png',
                    height: 12.37,
                    width: 18,
                    fit: BoxFit.cover,
                  ),
                  widthSpace,
                  Text(
                    'Watch Trailer',
                    style: grey14SemiBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  selectLocation() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
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
                value: location,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    location = newValue;
                  });
                },
                items: <String>[
                  'Ahmedabad',
                  'Vadodara',
                  'Rajkot',
                  'Gandhinagar',
                  'Anand',
                  'Navsari',
                  'Surendranagar',
                  'Bharuch',
                  'Vapi',
                  'Surat',
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

  selectCinema() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cinema',
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
                value: cinema,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    cinema = newValue;
                  });
                },
                items: <String>[
                  'Rajhans Cinemas',
                  'PVR Surat',
                  'Cinepolis',
                  'Harmony Cinema',
                  'INOX Raj Imperial',
                  'Bollywood Metro',
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

  date() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0 - 10.0),
      child: CalendarWeek(
        controller: _controller,
        height: 110,
        showMonth: true,
        dateStyle: black16BoldTextStyle,
        weekendsStyle: black16BoldTextStyle,
        pressedDateStyle: white16BoldTextStyle,
        todayDateStyle: style,
        dayOfWeekStyle: grey18BoldTextStyle,
        pressedDateBackgroundColor: orangeColor,
        todayBackgroundColor: color,
        dateBackgroundColor: Colors.black12,
        minDate: DateTime.now(),
        maxDate: DateTime.now().add(const Duration(days: 365)),
        dayOfWeek: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        weekendsIndexes: const [],
        onDatePressed: (DateTime datetime) {
          setState(() {
            color = datetime.toString().substring(1, 10) ==
                    DateTime.now().toString().substring(1, 10)
                ? orangeColor
                : Colors.black12;
            style = datetime.toString().substring(1, 10) ==
                    DateTime.now().toString().substring(1, 10)
                ? white16BoldTextStyle
                : black16BoldTextStyle;
          });
          selectedDate = DateFormat('d MMM').format(datetime);
        },
      ),
    );
  }

  slots() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 1.3,
      ),
      child: Wrap(
        children: slotList
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
                  right: 7,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTime = e['time'];
                    });
                  },
                  child: Container(
                    width: 81,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: e['time'] == selectedTime
                          ? orangeColor
                          : Colors.black12,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(e['time'],
                        style: (e['time'] == selectedTime)
                            ? white14BoldTextStyle
                            : black14BoldTextStyle),
                  ),
                ),
              ),
            )
            .toList()
            .cast<Widget>(),
      ),
    );
  }

  bookSeatButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: MoiveTicketBookingDetail(
                moiveName: widget.moiveName,
                cinemaName: cinema,
                date: selectedDate,
                time: selectedTime,
                seats: selectedSeats.toString(),
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
              'Book Seat',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
