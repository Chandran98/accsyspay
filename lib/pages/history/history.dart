import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class History extends StatelessWidget {
  History({Key key}) : super(key: key);

  final todaysHitoryList = [
    {
      'transaction': 'Send Money to Krishna Shah',
      'id': 'D12365478901234',
      'time': '10:55 am',
      'amount': '\$35',
    },
    {
      'transaction': 'Mobile Recharge',
      'id': 'D12365478901234',
      'time': '10:30 am',
      'amount': '\$35',
    },
    {
      'transaction': 'DGVCL Bill Paid',
      'id': 'D12365478901234',
      'time': '10:55 am',
      'amount': '\$599',
    },
  ];

  final yesterdaysHitoryList = [
    {
      'transaction': 'Flight Ticket Booking-Spicejet SG-9587',
      'id': 'D12365478901234',
      'time': '10:55 am',
      'amount': '\$100',
    },
    {
      'transaction': 'Bus Ticket Booking-PVS Travels',
      'id': 'D12365478901234',
      'time': '10:00 am',
      'amount': '\$110',
    },
    {
      'transaction': 'Moive Ticket Booking-Rajhans Cinemas',
      'id': 'D12365478901234',
      'time': '09:30 am',
      'amount': '\$150',
    },
    {
      'transaction': 'Paid to Nautica Online Shopping Hub',
      'id': 'D12365478901234',
      'time': '09:00 am',
      'amount': '\$200',
    },
  ];

  final oldHitoryList = [
    {
      'transaction': 'Flight Ticket Booking-Spicejet SG-9587',
      'id': 'D12365478901234',
      'time': '10:55 am',
      'amount': '\$150',
    },
    {
      'transaction': 'Bus Ticket Booking-PVS Travels',
      'id': 'D12365478901234',
      'time': '10:00 am',
      'amount': '\$599',
    },
    {
      'transaction': 'Moive Ticket Booking-Rajhans Cinemas',
      'id': 'D12365478901234',
      'time': '09:30 am',
      'amount': '\$200',
    },
    {
      'transaction': 'Paid to Nautica Online Shopping Hub',
      'id': 'D12365478901234',
      'time': '09:00 am',
      'amount': '\$150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Transaction History',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          todaysHistory(),
          yesterdaysHistory(),
          oldHistory(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  todaysHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding / 2,
          ),
          child: Text(
            'Today 24 November 2021',
            style: orange16SemiBoldTextStyle,
          ),
        ),
        ColumnBuilder(
          itemCount: todaysHitoryList.length,
          itemBuilder: (context, index) {
            final item = todaysHitoryList[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(
                fixPadding * 2.0,
                fixPadding,
                fixPadding * 2.0,
                0,
              ),
              padding: const EdgeInsets.all(fixPadding / 2),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['transaction'],
                        style: grey14RegularTextStyle,
                      ),
                      Text(
                        item['id'],
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        item['time'],
                        style: grey12SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => Navigator.push(
                          context,
                          PageTransition(
                            child: const TransactionSuccessful(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'View',
                                style: grey14SemiBoldTextStyle,
                              ),
                              Image.asset(
                                'assets/icons/view.png',
                                height: 18,
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        item['amount'],
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  yesterdaysHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding / 2,
          ),
          child: Text(
            'Yesterday 23 November 2021',
            style: orange16SemiBoldTextStyle,
          ),
        ),
        ColumnBuilder(
          itemCount: yesterdaysHitoryList.length,
          itemBuilder: (context, index) {
            final item = yesterdaysHitoryList[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(
                fixPadding * 2.0,
                fixPadding,
                fixPadding * 2.0,
                0,
              ),
              padding: const EdgeInsets.all(fixPadding / 2),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['transaction'],
                        style: grey14RegularTextStyle,
                      ),
                      Text(
                        item['id'],
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        item['time'],
                        style: grey12SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => Navigator.push(
                          context,
                          PageTransition(
                            child: const TransactionSuccessful(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'View',
                                style: grey14SemiBoldTextStyle,
                              ),
                              Image.asset(
                                'assets/icons/view.png',
                                height: 18,
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        item['amount'],
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  oldHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding * 2.0,
            fixPadding / 2,
          ),
          child: Text(
            '22 November 2021',
            style: orange16SemiBoldTextStyle,
          ),
        ),
        ColumnBuilder(
          itemCount: oldHitoryList.length,
          itemBuilder: (context, index) {
            final item = oldHitoryList[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(
                fixPadding * 2.0,
                fixPadding,
                fixPadding * 2.0,
                0,
              ),
              padding: const EdgeInsets.all(fixPadding / 2),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['transaction'],
                        style: grey14RegularTextStyle,
                      ),
                      Text(
                        item['id'],
                        style: black16BoldTextStyle,
                      ),
                      Text(
                        item['time'],
                        style: grey12SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => Navigator.push(
                          context,
                          PageTransition(
                            child: const TransactionSuccessful(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'View',
                                style: grey14SemiBoldTextStyle,
                              ),
                              Image.asset(
                                'assets/icons/view.png',
                                height: 18,
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        item['amount'],
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
