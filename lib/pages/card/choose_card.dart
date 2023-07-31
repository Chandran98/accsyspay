import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class ChooseCard extends StatefulWidget {
  const ChooseCard({Key key}) : super(key: key);

  @override
  _ChooseCardState createState() => _ChooseCardState();
}

class _ChooseCardState extends State<ChooseCard> {
  double height, width;
  String isSelected = 'Samantha John';
  Color color = orangeColor;

  final cardList = [
    {
      'name': 'Samantha John',
      'number': 'XXXX XXXX XXXX 1489',
      'color': orangeColor,
    },
    {
      'name': 'Isha John',
      'number': 'XXXX XXXX XXXX 1489',
      'color': PrimaryColor,
    },
    {
      'name': 'Arvind John',
      'number': 'XXXX XXXX XXXX 1489',
      'color': const Color(0xff949494),
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Choose Card',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          selectCard(),
          Padding(
            padding: const EdgeInsets.only(
              top: fixPadding * 4.0,
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
            ),
            child: Row(
              children: [
                addButton(),
                widthSpace,
                widthSpace,
                widthSpace,
                widthSpace,
                payButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectCard() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: height * 0.226,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * 0.18,
                    width: width - 100,
                    padding: const EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      color: color == const Color(0xff949494)
                          ? orangeColor
                          : const Color(0xff949494),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/card-chip.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                            widthSpace,
                            widthSpace,
                            Text(
                              'CREDIT CARD',
                              style: white20BoldTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '1234     4569     7892     1589',
                          style: white18BoldTextStyle,
                        ),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        Text(
                          '08/24',
                          style: white14BoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isSelected,
                              style: white14SemiBoldTextStyle,
                            ),
                            Image.asset(
                              'assets/card_logo.png',
                              height: 20,
                              width: 32,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 35,
              left: 35,
              child: Container(
                height: height * 0.18,
                width: width - 70,
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: color == PrimaryColor ? orangeColor : PrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/card-chip.png',
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'CREDIT CARD',
                          style: white20BoldTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '1234     4569     7892     1589',
                      style: white18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      '08/24',
                      style: white14BoldTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isSelected,
                          style: white14SemiBoldTextStyle,
                        ),
                        Image.asset(
                          'assets/card_logo.png',
                          height: 20,
                          width: 32,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 33,
              right: 20,
              left: 20,
              child: Container(
                height: height * 0.18,
                width: width - 40,
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/card-chip.png',
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'CREDIT CARD',
                          style: white20BoldTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '1234     4569     7892     1589',
                      style: white18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      '08/24',
                      style: white14BoldTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isSelected,
                          style: white14SemiBoldTextStyle,
                        ),
                        Image.asset(
                          'assets/card_logo.png',
                          height: 20,
                          width: 32,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ColumnBuilder(
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              final item = cardList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  index == 0 ? fixPadding * 2.0 : fixPadding,
                  fixPadding * 2.0,
                  0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = item['name'];
                      color = item['color'];
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      color:
                          isSelected == item['name'] ? orangeColor : whiteColor,
                      border: Border.all(
                          color: isSelected == item['name']
                              ? orangeColor
                              : greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: isSelected == item['name']
                                ? whiteColor
                                : greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['number'],
                              style: isSelected == item['name']
                                  ? white18BoldTextStyle
                                  : grey18BoldTextStyle,
                            ),
                            Text(
                              item['name'],
                              style: isSelected == item['name']
                                  ? white16SemiBoldTextStyle
                                  : grey16SemiBoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  addButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: const AddNewCard(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
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
          child: Text(
            'Add New',
            style: PrimaryColor22BoldTextStyle,
          ),
        ),
      ),
    );
  }

  payButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: const TransactionSuccessful(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
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
            'Pay Now',
            style: white22BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
