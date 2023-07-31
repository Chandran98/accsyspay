import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int isSelected = 0;

  final optionsList = [
    {
      'option': 'Free Standard delivery',
      'detail': 'Delivery on or before Monday, 24 Sep 2020',
    },
    {
      'option': 'Rs.50 Express delivery',
      'detail': 'Delivery on or before Fridat, 12 Sep 2020',
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
          'Checkout',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          address(),
          options(),
          payment(),
          price(),
          makePaymentButton(),
        ],
      ),
    );
  }

  address() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Address',
                style: black18BoldTextStyle,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const AddNewAddress(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Text(
                  'Change',
                  style: orange16BoldTextStyle,
                ),
              ),
            ],
          ),
          Text(
            'Samantha John',
            style: black16SemiBoldTextStyle,
          ),
          Text(
            '+1 923 456 7890',
            style: grey14RegularTextStyle,
          ),
          heightSpace,
          Text(
            '444, Grove Avenue, Golden Tower Near City Part, Washington  DC, United States Of America',
            style: grey14RegularTextStyle,
          ),
          divider(),
        ],
      ),
    );
  }

  options() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Options',
            style: black18BoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: optionsList.length,
            itemBuilder: (context, index) {
              final item = optionsList[index];
              return Padding(
                padding: const EdgeInsets.only(top: fixPadding / 2),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = index;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: isSelected == index
                              ? orangeColor
                              : greyColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      widthSpace,
                      widthSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['option'],
                            style: black16SemiBoldTextStyle,
                          ),
                          Text(
                            item['detail'],
                            style: grey14RegularTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          divider(),
        ],
      ),
    );
  }

  payment() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Method',
                style: black18BoldTextStyle,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const PaymentMethod(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Text(
                  'Change',
                  style: orange16BoldTextStyle,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/hdfc.png',
                height: 16,
                width: 20,
              ),
              widthSpace,
              widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank of Baroda Credit Card',
                    style: black16SemiBoldTextStyle,
                  ),
                  Text(
                    '48** **** **** 1710',
                    style: grey14RegularTextStyle,
                  ),
                ],
              ),
            ],
          ),
          divider(),
        ],
      ),
    );
  }

  price() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 3.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total(2 Items)',
                style: grey14RegularTextStyle,
              ),
              Text(
                '\$199',
                style: grey14RegularTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
                style: grey14RegularTextStyle,
              ),
              Text(
                'Free',
                style: grey14RegularTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount Payable',
                style: black16SemiBoldTextStyle,
              ),
              Text(
                '\$199',
                style: black16SemiBoldTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  makePaymentButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: const TransactionSuccessful(),
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

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
