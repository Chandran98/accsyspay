import 'package:Accsys_Pay/pages/screens.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../MainApp/constant/constant.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          'Add New Card',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          creditCard(),
          cardForm(),
        ],
      ),
    );
  }

  creditCard() {
    return CreditCardWidget(
      cardBgColor: PrimaryColor,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      labelCardHolder: 'CARD HOLDER NAME',
      textStyle: white16SemiBoldTextStyle,
      height: MediaQuery.of(context).size.height * 0.20,
      cardType: CardType.mastercard,
    );
  }

  cardForm() {
    return Column(
      children: <Widget>[
        CreditCardForm(
          cursorColor: PrimaryColor,
          formKey: formKey,
          obscureCvv: true,
          obscureNumber: true,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          cardHolderName: cardHolderName,
          expiryDate: expiryDate,
          themeColor: Colors.blue,
          cardNumberDecoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: fixPadding),
            border: OutlineInputBorder(),
            hintText: 'XXXX XXXX XXXX XXXX',
            labelText: 'Enter card number',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'NunitoSans',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PrimaryColor),
            ),
          ),
          expiryDateDecoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: fixPadding),
            border: OutlineInputBorder(),
            hintText: 'XX/XX',
            labelText: 'Enter valid thru',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'NunitoSans',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PrimaryColor),
            ),
          ),
          cvvCodeDecoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: fixPadding),
            border: OutlineInputBorder(),
            hintText: 'XXX',
            labelText: 'Enter cvv',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'NunitoSans',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PrimaryColor),
            ),
          ),
          cardHolderDecoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: fixPadding),
            border: OutlineInputBorder(),
            labelText: 'Enter card holder name',
            labelStyle: TextStyle(
              color: greyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'NunitoSans',
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PrimaryColor),
            ),
          ),
          onCreditCardModelChange: onCreditCardModelChange,
        ),
        addButton(),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  addButton() {
    return Padding(
      padding: const EdgeInsets.only(top: fixPadding * 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          if (formKey.currentState.validate()) {
            // ignore: avoid_print
            print('valid!');
            Navigator.pop(context);
          } else {
            // ignore: avoid_print
            print('invalid!');
          }
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
            'Add',
            style: white22BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
