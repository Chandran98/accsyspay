import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class Promocode extends StatelessWidget {
  final String mobile;
  final String amount;
  Promocode({Key key, this.mobile, this.amount}) : super(key: key);

  final offerList = [
    {
      'code': 'HYTFR123',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply ',
    },
    {
      'code': 'TSRTY589',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply ',
    },
    {
      'code': 'OIYTR147',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply ',
    },
    {
      'code': 'GTSDR159',
      'detail':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply ',
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
          'Mobile Recharge',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          rechargeInfo(),
          promocodeTextField(),
          offers(),
          proceedButton(context),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  rechargeInfo() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recharge For $mobile Mobile',
                  overflow: TextOverflow.ellipsis,
                  style: grey18SemiBoldTextStyle,
                ),
                Text(
                  '992573698',
                  style: orange20BoldTextStyle,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount',
                style: grey18SemiBoldTextStyle,
              ),
              Text(
                amount,
                style: orange20BoldTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  promocodeTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: TextField(
        cursorColor: PrimaryColor,
        style: black14SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(top: fixPadding * 2.5),
          hintText: 'Enter Promocode',
          hintStyle: grey14SemiBoldTextStyle,
          suffixIcon: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: 7,
            ),
            margin: const EdgeInsets.only(bottom: fixPadding),
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
              'Apply',
              style: white20BoldTextStyle,
            ),
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor)),
        ),
      ),
    );
  }

  offers() {
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
          Text(
            'Offers',
            style: black18BoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: offerList.length,
            itemBuilder: (context, index) {
              final item = offerList[index];
              return Container(
                margin: EdgeInsets.only(
                    top: index == 0 ? fixPadding / 2 : fixPadding),
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
                      item['code'],
                      style: black18SemiBoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      item['detail'],
                      style: grey14RegularTextStyle,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  proceedButton(context) {
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
              'Proceed To Pay $amount',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
