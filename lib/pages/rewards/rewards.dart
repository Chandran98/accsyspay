import 'package:Accsys_Pay/pages/screens.dart';

// ignore: must_be_immutable
class Rewards extends StatelessWidget {
  Rewards({Key key}) : super(key: key);
  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Rewards',
          style: black20BoldTextStyle,
        ),
      ),
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          reward1('Available on\n16 October at 10:00'),
          reward2(
            image: 'assets/rewards/ajio.png',
            off: '\$5 off on\nAJIO',
            code: 'GP1-5GHA-55',
          ),
          reward2(
            image: 'assets/rewards/coolwinks.png',
            off: 'Rs.450 off on \nCooolwinks',
            code: 'DUGTY65894',
          ),
          reward3('You’ve won\n\$2'),
          reward3('Cashback\n\$10'),
          reward1('Unlock by making your\n1st DTH payment\nbefore October 16'),
          reward2(
            image: 'assets/rewards/flipkart.png',
            off: '10% off on\nFlipkart',
            code: 'DUGTY65894',
          ),
          reward3('Cashback\n\$10'),
          reward3('Cashback\n\$5'),
          reward1('Unlock by making your\n1st DTH payment\nbefore October 16'),
        ],
      ),
    );
  }

  reward1(String text) {
    return Container(
      height: width / 2 - 30,
      width: width / 2 - 30,
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            spreadRadius: 1.2,
            blurRadius: 1.2,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/rewards/card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: fixPadding * 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(fixPadding / 3),
              color: whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: black14SemiBoldTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  reward2({String image, String code, String off}) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 90,
            height: 35,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            off,
            textAlign: TextAlign.center,
            style: black14SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Center(
              child: Text(
                code,
                style: black14SemiBoldLetterSpacingTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  reward3(String text) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/rewards/gift.png',
            width: 145,
            height: 100,
            fit: BoxFit.cover,
          ),
          heightSpace,
          Text(
            text,
            textAlign: TextAlign.center,
            style: black14SemiBoldTextStyle,
          ),
        ],
      ),
    );
  }
}
