import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class MoiveTicketBookingDetail extends StatelessWidget {
  final String moiveName;
  final String cinemaName;
  final String date;
  final String time;
  final String seats;
  const MoiveTicketBookingDetail(
      {Key key,
      this.moiveName,
      this.cinemaName,
      this.date,
      this.time,
      this.seats})
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
          details(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          makePaymentButton(context),
        ],
      ),
    );
  }

  details() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.all(fixPadding),
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
            children: [
              detailRow(title: 'Cinema', detail: cinemaName),
              detailRow(title: 'Moive', detail: moiveName),
              detailRow(title: 'Date - Time', detail: '$date - $time'),
              detailRow(title: 'No of Seat', detail: seats),
            ],
          ),
        ),
        Text(
          'Total Amount \$199',
          style: black16BoldTextStyle,
        ),
        Text(
          '(Total 3 Seats)',
          style: grey14RegularTextStyle,
        ),
      ],
    );
  }

  detailRow({String title, String detail}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: grey14RegularTextStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            detail,
            style: black16BoldTextStyle,
          ),
        ),
      ],
    );
  }

  makePaymentButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: const PaymentMethod(),
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
              'Make Payment',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
