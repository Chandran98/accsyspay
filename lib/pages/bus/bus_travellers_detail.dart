import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class BusTravellersDetails extends StatefulWidget {
  const BusTravellersDetails({Key key}) : super(key: key);

  @override
  _BusTravellersDetailsState createState() => _BusTravellersDetailsState();
}

class _BusTravellersDetailsState extends State<BusTravellersDetails> {
  String isSelected = 'Mr';
  bool isChecked = false;

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
          'Traveller Details',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          gender(),
          nameTextField(),
          contactDetail(),
          ticketDetail(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          makePaymentButton(),
        ],
      ),
    );
  }

  gender() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'Mr';
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
                      color: isSelected == 'Mr' ? PrimaryColor : greyColor,
                      width: 2,
                    ),
                  ),
                  child: isSelected == 'Mr'
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
                  'Mr',
                  style: isSelected == 'Mr'
                      ? PrimaryColor18SemiBoldTextStyle
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
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'Mrs';
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
                      color: isSelected == 'Mrs' ? PrimaryColor : greyColor,
                      width: 2,
                    ),
                  ),
                  child: isSelected == 'Mrs'
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
                  'Mrs',
                  style: isSelected == 'Mrs'
                      ? PrimaryColor18SemiBoldTextStyle
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
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'Ms';
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
                      color: isSelected == 'Ms' ? PrimaryColor : greyColor,
                      width: 2,
                    ),
                  ),
                  child: isSelected == 'Ms'
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
                  'Ms',
                  style: isSelected == 'Ms'
                      ? PrimaryColor18SemiBoldTextStyle
                      : grey18SemiBoldTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Full Name',
                  style: black18SemiBoldTextStyle,
                ),
                TextSpan(
                  text: ' (Name should be same as in goverment ID proof.)',
                  style: red12RegularTextStyle,
                ),
              ],
            ),
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
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'Enter Name',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  contactDetail() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Details',
            style: black18SemiBoldTextStyle,
          ),
          Text(
            ' (Your booking details will be sent to below contact details.)',
            style: red12RegularTextStyle,
          ),
          heightSpace,
          heightSpace,
          mobileNumberTextField(),
          heightSpace,
          heightSpace,
          emailTextField(),
        ],
      ),
    );
  }

  mobileNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile Number',
          style: black18SemiBoldTextStyle,
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
              contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
              hintStyle: grey16RegularTextStyle,
              hintText: 'Enter your mobile number',
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: black18SemiBoldTextStyle,
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
            keyboardType: TextInputType.emailAddress,
            cursorColor: PrimaryColor,
            style: black18SemiBoldTextStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
              hintStyle: grey16RegularTextStyle,
              hintText: 'Enter your mail address',
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  ticketDetail() {
    return Column(
      children: [
        Row(
          children: [
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
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
              'Agree to terms & conditions',
              style: black14RegularTextStyle,
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        Text(
          'Total Amount \$250',
          textAlign: TextAlign.center,
          style: black16BoldTextStyle,
        ),
        Text(
          '( Total 3 Seats )',
          textAlign: TextAlign.center,
          style: grey14RegularTextStyle,
        ),
      ],
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
              'Make Payment',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
