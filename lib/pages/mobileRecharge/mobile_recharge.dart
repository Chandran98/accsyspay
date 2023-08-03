import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({Key key}) : super(key: key);

  @override
  _MobileRechargeState createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  String isSelected = 'prepaid';
  bool isChecked = false;
  String operator = 'Jio';
  String plan = '\$75';

  final planList = [
    {
      'plan': '\$75',
      'validity': '10 days',
      'data': '5 GB',
    },
    {
      'plan': '\$100',
      'validity': '18 days',
      'data': '20 GB',
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
          radioButton(),
          mobileNumberTextField(),
          selectOperator(),
          plans(),
          promocodeTextField(),
          instantPayment(),
          proceedButton(),
        ],
      ),
    );
  }

  radioButton() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'prepaid';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  padding: const EdgeInsets.all(3.8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected == 'prepaid' ? PrimaryColor : greyColor,
                      width: 2,
                    ),
                  ),
                  child: isSelected == 'prepaid'
                      ? Container(
                          decoration: const BoxDecoration(
                            color: PrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        )
                      : Container(),
                ),
                widthSpace,
                widthSpace,
                Text(
                  'Prepaid',
                  style: isSelected == 'prepaid'
                      ? black18SemiBoldTextStyle
                      : grey18SemiBoldTextStyle,
                ),
              ],
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'postpaid';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  padding: const EdgeInsets.all(3.8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected == 'postpaid' ? PrimaryColor : greyColor,
                      width: 2,
                    ),
                  ),
                  child: isSelected == 'postpaid'
                      ? Container(
                          decoration: const BoxDecoration(
                            color: PrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        )
                      : Container(),
                ),
                widthSpace,
                widthSpace,
                Text(
                  'Postpaid',
                  style: isSelected == 'postpaid'
                      ? black18SemiBoldTextStyle
                      : grey18SemiBoldTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  mobileNumberTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile Number',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
            child: TextField(
              keyboardType: TextInputType.phone,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: blackColor,
                  size: 20,
                ),
                suffixIcon: Image.asset(
                  'assets/icons/contact_number.png',
                  color: PrimaryColor,
                  height: 15,
                  width: 15,
                ),
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectOperator() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Operator',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(
              right: fixPadding,
              left: fixPadding * 2.0,
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isExpanded: true,
                iconEnabledColor: PrimaryColor,
                value: operator,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    operator = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Jio',
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mobile_card/jio.png',
                          height: 15,
                          width: 15,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Jio',
                          style: black18SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'aritel',
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mobile_card/aritel.png',
                          height: 15,
                          width: 15,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'aritel',
                          style: black18SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Vodafone',
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mobile_card/vodafone.png',
                          height: 15,
                          width: 15,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Vodafone',
                          style: black18SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Idea',
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mobile_card/idea.png',
                          height: 15,
                          width: 15,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Idea',
                          style: black18SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'vodafone idea',
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mobile_card/vodafone_idea.png',
                          height: 15,
                          width: 15,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'vodafone idea',
                          style: black18SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  plans() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount',
            style: grey16SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.only(
              right: fixPadding,
              left: fixPadding * 2.0,
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                elevation: 0,
                icon: Text(
                  'See Plans',
                  style: PrimaryColor12BoldTextStyle,
                ),
                value: plan,
                style: black18SemiBoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    plan = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: '\$345',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Plan',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '\$345',
                              style: red18BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Validity',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '90 days',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Data',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '75 GB',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '\$145',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Plan',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '\$145',
                              style: red18BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Validity',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '30 days',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Data',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '25 GB',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '\$100',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Plan',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '\$100',
                              style: red18BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Validity',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '18 days',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Data',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '20 GB',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '\$75',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Plan',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '\$75',
                              style: red18BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Validity',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '10 days',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Data',
                              style: grey16SemiBoldTextStyle,
                            ),
                            Text(
                              '5 GB',
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  promocodeTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
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
      child: TextField(
        cursorColor: PrimaryColor,
        style: black18SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
          hintStyle: orange12BoldTextStyle,
          hintText: 'Have Promocode?',
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  instantPayment() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 4.0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Icon(
              isChecked
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              size: 22,
              color: blackColor,
            ),
          ),
          widthSpace,
          Text(
            'Instant Payment From ',
            style: black14RegularTextStyle,
          ),
          Text(
            'Digital Payment Wallet',
            style: PrimaryColor16BoldTextStyle,
          ),
        ],
      ),
    );
  }

  proceedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: Promocode(
                mobile: operator,
                amount: plan,
              ),
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
              'Proceed To Payments',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
