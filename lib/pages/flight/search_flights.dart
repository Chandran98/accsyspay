import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class SearchFlights extends StatelessWidget {
  final String fromCity;
  final String toCity;
  SearchFlights({Key key, this.fromCity, this.toCity}) : super(key: key);

  final flightsList = [
    {
      'airlinesName': 'SpiceJet SG - 9587',
      'amount': '\$250',
      'leftSeat': '2',
      'totalTime': '2h 5m',
      'fromTime': '18:05',
      'toTime': '20:10',
      'logo': 'assets/airlines_logo/spiceJet.png',
    },
    {
      'airlinesName': 'GoAir G8 - 396',
      'amount': '\$380',
      'leftSeat': '3',
      'totalTime': '2h 15m',
      'fromTime': '18:25',
      'toTime': '20:50',
      'logo': 'assets/airlines_logo/goAir.png',
    },
    {
      'airlinesName': 'IndiGo 6E - 185',
      'amount': '\$190',
      'leftSeat': '1',
      'totalTime': '2h 10m',
      'fromTime': '17:20',
      'toTime': '19:00',
      'logo': 'assets/airlines_logo/indiGo.png',
    },
    {
      'airlinesName': 'AirIndia AI - 677',
      'amount': '\$140',
      'leftSeat': '5',
      'totalTime': '2h 5m',
      'fromTime': '18:20',
      'toTime': '20:00',
      'logo': 'assets/airlines_logo/airIndia.png',
    },
    {
      'airlinesName': 'Vistara UK - 950',
      'amount': '\$255',
      'leftSeat': '2',
      'totalTime': '2h 15m',
      'fromTime': '18:25',
      'toTime': '20:50',
      'logo': 'assets/airlines_logo/vistara.png',
    },
    {
      'airlinesName': 'AirIndia AI - 007',
      'amount': '\$320',
      'leftSeat': '4',
      'totalTime': '2h 5m',
      'fromTime': '18:20',
      'toTime': '20:00',
      'logo': 'assets/airlines_logo/airIndia.png',
    },
    {
      'airlinesName': 'Vistara UK - 982',
      'amount': '\$258',
      'leftSeat': '2',
      'totalTime': '2h 15m',
      'fromTime': '18:25',
      'toTime': '20:50',
      'logo': 'assets/airlines_logo/vistara.png',
    },
    {
      'airlinesName': 'SpiceJet SG - 9587',
      'amount': '\$250',
      'leftSeat': '2',
      'totalTime': '2h 5m',
      'fromTime': '18:05',
      'toTime': '20:10',
      'logo': 'assets/airlines_logo/spiceJet.png',
    },
    {
      'airlinesName': 'GoAir G8 - 396',
      'amount': '\$380',
      'leftSeat': '3',
      'totalTime': '2h 15m',
      'fromTime': '18:25',
      'toTime': '20:50',
      'logo': 'assets/airlines_logo/goAir.png',
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
          '$fromCity to $toCity',
          style: black20BoldTextStyle,
        ),
      ),
      body: flights(),
    );
  }

  flights() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: flightsList.length,
      itemBuilder: (context, index) {
        final item = flightsList[index];
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
                child: FlightTicketBookingDetail(
                    airlinesName: item['airlinesName']),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['airlinesName'],
                        style: black18SemiBoldTextStyle,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item['amount'],
                            style: black18BoldTextStyle,
                          ),
                          Text(
                            '${item['leftSeat']} Seat left',
                            style: red14SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightSpace,
                  Row(
                    children: [
                      Image.asset(
                        item['logo'],
                        width: 25,
                        height: 22,
                      ),
                      widthSpace,
                      widthSpace,
                      Column(
                        children: [
                          Text(
                            item['fromTime'],
                            style: black16SemiBoldTextStyle,
                          ),
                          Text(
                            'BOM',
                            style: grey14RegularTextStyle,
                          ),
                        ],
                      ),
                      widthSpace,
                      widthSpace,
                      Row(
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            padding: const EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: orangeColor,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: orangeColor.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                item['totalTime'],
                                style: grey14RegularTextStyle,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: fixPadding * 1.9),
                                color: orangeColor,
                                height: 3.5,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ],
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            padding: const EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: orangeColor,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: orangeColor.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      widthSpace,
                      widthSpace,
                      Column(
                        children: [
                          Text(
                            item['toTime'],
                            style: black16SemiBoldTextStyle,
                          ),
                          Text(
                            'DEL',
                            style: grey14RegularTextStyle,
                          ),
                        ],
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
