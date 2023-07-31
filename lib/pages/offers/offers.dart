import 'package:Accsys_Pay/pages/screens.dart';

class Offers extends StatelessWidget {
  Offers({Key key}) : super(key: key);

  final offerList = [
    {
      'image': 'assets/offers/d2h.png',
      'title': 'D2H',
      'offer': 'Get up to \$10 Cashback On First D2H  Recharge',
      'claimed': '1.4m',
      'totalDays': '4',
    },
    {
      'image': 'assets/offers/dream11.png',
      'title': 'Dream 11',
      'offer': 'Get up to \$19 Cashback On First 1 Transaction',
      'instruction': ' (mvin transaction amount: Rs.15)',
      'claimed': '1.4m',
      'totalDays': '2',
    },
    {
      'image': 'assets/offers/flipkart.png',
      'title': 'Flipkart',
      'offer': 'Get up to 10% Cashback On Payments Via Digital Payment',
      'claimed': '1.2m',
      'totalDays': '2',
    },
    {
      'image': 'assets/offers/zomato.png',
      'title': 'Zomato',
      'offer': 'Flat 50% Off On Your First Order On Zomato',
      'claimed': '1.2m',
      'totalDays': '2',
    },
    {
      'image': 'assets/mobile_card/jio.png',
      'title': 'Jio',
      'offer': 'Get up to \$10 Cashback On Jio Prepaid Recharge',
      'instruction': ' (Min recharge amount Rs.300)',
      'claimed': '1.2m',
      'totalDays': '2',
    },
    {
      'image': 'assets/offers/d2h.png',
      'title': 'D2H',
      'offer': 'Get up to \$10 Cashback On First D2H  Recharge',
      'claimed': '1.4m',
      'totalDays': '4',
    },
    {
      'image': 'assets/offers/dream11.png',
      'title': 'Dream 11',
      'offer': 'Get up to \$19 Cashback On First 1 Transaction',
      'instruction': ' (mvin transaction amount: Rs.15)',
      'claimed': '1.4m',
      'totalDays': '2',
    },
    {
      'image': 'assets/offers/flipkart.png',
      'title': 'Flipkart',
      'offer': 'Get up to 10% Cashback On Payments Via Digital Payment',
      'claimed': '1.2m',
      'totalDays': '2',
    },
    {
      'image': 'assets/offers/zomato.png',
      'title': 'Zomato',
      'offer': 'Flat 50% Off On Your First Order On Zomato',
      'claimed': '1.2m',
      'totalDays': '2',
    },
    {
      'image': 'assets/mobile_card/jio.png',
      'title': 'Jio',
      'offer': 'Get up to \$10 Cashback On Jio Prepaid Recharge',
      'instruction': ' (Min recharge amount Rs.300)',
      'claimed': '1.2m',
      'totalDays': '2',
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
          'Offers',
          style: black20BoldTextStyle,
        ),
      ),
      body: offers(),
    );
  }

  offers() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: offerList.length,
      itemBuilder: (context, index) {
        final item = offerList[index];
        return Container(
          margin: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 2.0 : 0,
            fixPadding * 2.0,
            fixPadding,
          ),
          padding: const EdgeInsets.fromLTRB(
            fixPadding,
            fixPadding / 2,
            fixPadding / 2,
            fixPadding / 2,
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
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: grey14SemiBoldTextStyle,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: item['offer'],
                            style: black16SemiBoldTextStyle,
                          ),
                          item['instruction'] != null
                              ? TextSpan(
                                  text: item['instruction'],
                                  style: grey12RegularTextStyle,
                                )
                              : const TextSpan(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/profile.png',
                          color: greyColor,
                          height: 12,
                          width: 12,
                        ),
                        widthSpace,
                        Text(
                          '${item['claimed']} claimed • Ends in ${item['totalDays']} days',
                          style: grey14RegularTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
