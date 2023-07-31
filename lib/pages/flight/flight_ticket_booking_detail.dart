import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class FlightTicketBookingDetail extends StatelessWidget {
  final String airlinesName;
  const FlightTicketBookingDetail({Key key, this.airlinesName})
      : super(key: key);

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
          'Booking Details',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          details(context),
          continueButton(context),
        ],
      ),
    );
  }

  details(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.all(fixPadding),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mumbai to Delhi',
                style: black18SemiBoldTextStyle,
              ),
              Text(
                '15 May, 2020 | Non Stop | 2h 5min  ',
                style: black16RegularTextStyle,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: airlinesName,
                      style: black18SemiBoldTextStyle,
                    ),
                    TextSpan(
                      text: ' (Economy)',
                      style: black16RegularTextStyle,
                    ),
                  ],
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wed 15 May',
                    style: black14SemiBoldTextStyle,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: orangeColor,
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.13,
                          ),
                          widthSpace,
                          Text(
                            '2h 5m',
                            style: black12RegularTextStyle,
                          ),
                          widthSpace,
                          Container(
                            color: orangeColor,
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.13,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/plane.png',
                        height: 22,
                        width: 22,
                      ),
                    ],
                  ),
                  Text(
                    'Mon 20 May',
                    style: black14SemiBoldTextStyle,
                  ),
                ],
              ),
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BOM',
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        '18:05',
                        style: black14SemiBoldTextStyle,
                      ),
                      Text(
                        'Mumbai\nChhatrapati Shivaji International\n(Terminal:1)',
                        style: grey12RegularTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DEL',
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        '20:00',
                        style: black14SemiBoldTextStyle,
                      ),
                      Text(
                        'Delhi\nIndira Gandhi International\nAirport',
                        style: grey12RegularTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              Center(
                child: Text(
                  'Total Amount  \$250',
                  style: black16BoldTextStyle,
                ),
              ),
              Center(
                child: Text(
                  '( Total fare for 1 Traveller )',
                  style: grey14RegularTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  continueButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: const FlightTravellersDetails(),
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
              'Continue',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
