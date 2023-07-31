import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int isSelected = 0;
  final paymentMethodList = [
    {'method': 'Credit Card'},
    {'method': 'Debit Card'},
    {'method': 'Net Banking'},
    {'method': 'UPI (Google pay/Phone pay etc...)'},
    {'method': 'Digital Payment Wallet'},
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
          'Choose Paymeny Method',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          paymentMethod(),
          continueButton(),
        ],
      ),
    );
  }

  paymentMethod() {
    return ColumnBuilder(
      itemCount: paymentMethodList.length,
      itemBuilder: (context, index) {
        final item = paymentMethodList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 2.0 : fixPadding * 1.5,
            fixPadding * 2.0,
            0,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding * 1.2,
              ),
              decoration: BoxDecoration(
                color: isSelected == index ? orangeColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: isSelected == index ? orangeColor : greyColor),
                boxShadow: [
                  isSelected == index
                      ? BoxShadow(
                          color: orangeColor.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      : const BoxShadow(),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['method'],
                    style: isSelected == index
                        ? white18SemiBoldTextStyle
                        : grey18SemiBoldTextStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: isSelected == index ? whiteColor : greyColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  continueButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: fixPadding * 4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: const ChooseCard(),
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
        ),
      ],
    );
  }
}
