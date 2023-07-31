import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class BillDetail extends StatelessWidget {
  final String logo;
  const BillDetail({Key key, this.logo}) : super(key: key);

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
          'Electricity Bill Payment',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          details(),
        ],
      ),
      bottomNavigationBar: payButton(context),
    );
  }

  details() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding,
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
            children: [
              Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 60,
                      maxHeight: 60,
                    ),
                    child: Image.asset(logo),
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consumer ID',
                        style: grey14RegularTextStyle,
                      ),
                      Text(
                        '123-45678-89',
                        style: black16BoldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              divider(),
              heightSpace,
              detailRow(title: 'Consumer Name', detail: 'Samantha John'),
              detailRow(title: 'Bill Number', detail: '000159874'),
              detailRow(title: 'Bill Date', detail: 'Jun 15, 2020'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$1,598',
                style: black18SemiBoldTextStyle,
              ),
              heightSpace,
              Text(
                'Please verify your details before proceeding to payment No interest will be paid for advance payments',
                style: grey14RegularTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  detailRow({String title, String detail}) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: grey14RegularTextStyle,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            detail,
            style: black16BoldTextStyle,
          ),
        ),
      ],
    );
  }

  payButton(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                'Pay Bill',
                style: white22BoldTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      color: greyColor.withOpacity(0.4),
      height: 2,
      width: double.infinity,
    );
  }
}
