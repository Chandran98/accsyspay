import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/pages/screens.dart';

class BusTicketBookingDetail extends StatelessWidget {
  final String travels;
  const BusTicketBookingDetail({Key key, this.travels}) : super(key: key);

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
          details(),
          continueButton(context),
        ],
      ),
    );
  }

  details() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(fixPadding),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jaipur to Srinagar',
                  style: black18SemiBoldTextStyle,
                ),
                Text(
                  '15 May, 2020 | 12h 5min  ',
                  style: black16RegularTextStyle,
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: travels,
                  style: black18SemiBoldTextStyle,
                ),
                TextSpan(
                  text: ' (Ac sleeper 2 • 1 single axie)',
                  style: black16RegularTextStyle,
                ),
              ],
            ),
          ),
          Text(
            'Wed 15 May | Time: 8:30 pm',
            style: black14SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Center(
            child: Text(
              'Total Amount  \$110',
              style: black16BoldTextStyle,
            ),
          ),
          Center(
            child: Text(
              '(Total 3 Seats)',
              style: grey14RegularTextStyle,
            ),
          ),
        ],
      ),
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
              child: const BusTravellersDetails(),
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
