/*fonts*/
import 'package:Accsys_Pay/MainApp/pages/history_screen.dart';
import 'package:flutter/material.dart';

import 'colors/colors.dart';

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 28.0;
const textSizeXXLarge = 30.0;
/* margin */

const spacing_control_half = 2.0;
const spacing_control = 4.0;
const spacing_standard = 8.0;
const spacing_middle = 10.0;
const spacing_standard_new = 16.0;
const spacing_large = 24.0;
const spacing_xlarge = 32.0;
const spacing_xxLarge = 40.0;

Widget text(
  String text, {
  var fontSize = textSizeLargeMedium,
  Color textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

List<BoxShadow> defaultBoxShadow({
  Color shadowColor,
  double blurRadius,
  double spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      offset: offset,
    )
  ];
}

Widget transactionWidget(T12Transactions transaction, var categoryWidth) {
  return Container(
    decoration: boxDecoration(
        bgColor: Colors.grey.shade50,
        showShadow: true,
        radius: spacing_standard),
    padding: EdgeInsets.all(spacing_standard),
    margin: EdgeInsets.only(bottom: spacing_standard),
    child: Row(
      children: <Widget>[
        Image.asset(
          "assets/electricity_company/company2.png",
          width: categoryWidth * 0.75,
          height: categoryWidth * 0.75,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text(transaction.type,
                  fontSize: textSizeMedium,
                  textColor: Colors.black,
                  fontFamily: fontMedium),
              text(transaction.subType,
                  fontSize: textSizeMedium, textColor: Colors.black)
            ],
          ),
        ),
        Column(
          children: <Widget>[
            text(
                transaction.transactionType == "credited"
                    ? "+ \$" + transaction.amount.toString()
                    : "- \$" + transaction.amount.toString(),
                fontSize: textSizeMedium,
                textColor: transaction.transactionType == "credited"
                    ? t12_success
                    : t12_error,
                fontFamily: fontBold),
            text(transaction.time,
                fontSize: textSizeMedium, textColor: Colors.black)
          ],
        )
      ],
    ),
  );
}
