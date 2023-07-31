import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class SeatSelection extends StatefulWidget {
  final String travels;
  const SeatSelection({Key key, this.travels}) : super(key: key);

  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  final leftSeatsList = [
    {
      'row': '1',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '2',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '3',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '4',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '5',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '6',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '7',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '8',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '9',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '10',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '11',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '12',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
  ];

  final rightSeatsList = [
    {
      'row': '1',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '2',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '3',
      'seats': [
        {'status': 'available'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '4',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '5',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '6',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '7',
      'seats': [
        {'status': 'available'},
        {'status': 'booked'},
        {'status': 'available'},
      ],
    },
    {
      'row': '8',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '9',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '10',
      'seats': [
        {'status': 'yourSeat'},
        {'status': 'yourSeat'},
        {'status': 'yourSeat'},
      ],
    },
    {
      'row': '11',
      'seats': [
        {'status': 'booked'},
        {'status': 'booked'},
        {'status': 'booked'},
      ],
    },
    {
      'row': '12',
      'seats': [
        {'status': 'booked'},
        {'status': 'available'},
        {'status': 'available'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.travels,
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          busSeats(),
          proceedButton(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  busSeats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          child: Text(
            'Choose a Seats',
            style: black20BoldTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130,
                child: ColumnBuilder(
                  mainAxisSize: MainAxisSize.min,
                  itemCount: leftSeatsList.length,
                  itemBuilder: (context, index) {
                    final item = leftSeatsList[index];
                    return seats(item['seats']);
                  },
                ),
              ),
              SizedBox(
                width: 130,
                child: ColumnBuilder(
                  itemCount: rightSeatsList.length,
                  itemBuilder: (context, index) {
                    final item = rightSeatsList[index];
                    return seats(item['seats']);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 4.0,
          ),
          child: Row(
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
        ),
      ],
    );
  }

  seats(seat) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seat.length,
        itemBuilder: (context, index) {
          final items = seat[index];
          return Container(
            padding: const EdgeInsets.only(right: fixPadding * 1.8),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          items['status'] = items['status'] == 'available'
                              ? 'yourSeat'
                              : items['status'] == 'yourSeat'
                                  ? 'available'
                                  : 'booked';
                        });
                      },
                      child: Icon(
                        Icons.airline_seat_recline_normal,
                        color: items['status'] == 'booked'
                            ? greyColor.withOpacity(0.65)
                            : items['status'] == 'available'
                                ? greenColor
                                : orangeColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  proceedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: BusTicketBookingDetail(travels: widget.travels),
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
              'Proceed',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
