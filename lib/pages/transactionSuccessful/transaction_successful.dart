import 'package:Accsys_Pay/pages/screens.dart';

class TransactionSuccessful extends StatelessWidget {
  const TransactionSuccessful({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          transactionDetail(),
          doneButton(context),
        ],
      ),
    );
  }

  transactionDetail() {
    return Column(
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: greenColor,
          size: 100,
        ),
        Text(
          'Transaction Successful',
          style: black22BoldTextStyle,
        ),
        Text(
          'Jun 15,2020',
          style: grey18SemiBoldTextStyle,
        ),
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
                'Transaction ID',
                style: grey16RegularTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'D12365478901478',
                    style: black18SemiBoldTextStyle,
                  ),
                  Text(
                    'Copy',
                    style: PrimaryColor16ExtraBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile Recharged',
                style: grey16RegularTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '992578936',
                        style: black12SemiBoldTextStyle,
                      ),
                      Text(
                        'Jio / Uttar Pradesh East',
                        style: black18SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    '\$35.00',
                    style: black18SemiBoldTextStyle,
                  ),
                ],
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
              Text(
                'Debited from',
                style: grey16RegularTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'xxxxxxxx1710',
                        style: black12SemiBoldTextStyle,
                      ),
                      Text(
                        'Bank of Baroda',
                        style: black18SemiBoldTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    '\$35.00',
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

  doneButton(context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      onTap: () {
        currentIndex = 0;
        Navigator.push(
          context,
          PageTransition(
            child: const BottomBar(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
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
          'Done',
          style: white22BoldTextStyle,
        ),
      ),
    );
  }
}
