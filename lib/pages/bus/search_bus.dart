import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class SearchBus extends StatelessWidget {
  final String sourceCity;
  final String destinationCity;
  SearchBus({Key key, this.sourceCity, this.destinationCity}) : super(key: key);

  final busList = [
    {
      'travelsName': 'PVS Travels',
      'type': 'Ac sleeper 2 • 1 single Axie',
      'amount': '\$110',
      'seats': '20',
      'totalTime': '12h 5m',
      'time': '8:00 pm',
      'rating': '5.0',
    },
    {
      'travelsName': 'Geeta Bus Travels',
      'type': 'Ac sleeper 2 • 1 single Axie',
      'amount': '\$105',
      'seats': '10',
      'totalTime': '15h 10m',
      'time': '8:30 pm',
      'rating': '4.5',
    },
    {
      'travelsName': 'Shiv Baba Travels',
      'type': 'Ac sleeper 2 • 1 single Axie',
      'amount': '\$120',
      'seats': '05',
      'totalTime': '14h 10m',
      'time': '9:00 pm',
      'rating': '4.5',
    },
    {
      'travelsName': 'VRL Travels',
      'type': 'Ac sleeper 2',
      'amount': '\$199',
      'seats': '20',
      'totalTime': '10h 10m',
      'time': '8:00 pm',
      'rating': '4.2',
    },
    {
      'travelsName': 'Niazi Express',
      'type': 'Ac sleeper 2',
      'amount': '\$90',
      'seats': '10',
      'totalTime': '11h 20m',
      'time': '8:30 pm',
      'rating': '4.0',
    },
    {
      'travelsName': 'Skyways',
      'type': 'Ac sleeper 2',
      'amount': '\$199',
      'seats': '10',
      'totalTime': '11h 20m',
      'time': '8:30 pm',
      'rating': '4.0',
    },
    {
      'travelsName': 'PVS Travels',
      'type': 'Ac sleeper 2 • 1 single Axie',
      'amount': '\$110',
      'seats': '20',
      'totalTime': '12h 5m',
      'time': '8:00 pm',
      'rating': '5.0',
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
          '$sourceCity to $destinationCity',
          style: black20BoldTextStyle,
        ),
      ),
      body: buses(),
    );
  }

  buses() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: busList.length,
      itemBuilder: (context, index) {
        final item = busList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 2.0 : 0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: SeatSelection(travels: item['travelsName']),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: fixPadding / 2,
                horizontal: fixPadding,
              ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['travelsName'],
                        style: black18SemiBoldTextStyle,
                      ),
                      Text(
                        item['amount'],
                        style: black18BoldTextStyle,
                      )
                    ],
                  ),
                  Text(
                    item['type'],
                    style: grey14RegularTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item['seats']} Seats',
                        style: black16SemiBoldTextStyle,
                      ),
                      Text(
                        item['totalTime'],
                        style: black16SemiBoldTextStyle,
                      ),
                      Text(
                        item['time'],
                        style: black16SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding / 3,
                          vertical: fixPadding / 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          item['rating'],
                          style: white12ExtraBoldTextStyle,
                        ),
                      ),
                      widthSpace,
                      Text(
                        '${item['rating']} Ratings • Boarding & Drop point',
                        style: orange14SemiBoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
