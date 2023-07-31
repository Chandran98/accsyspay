import 'dart:async';
import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Accsys_Pay/pages/screens.dart';

class Verification extends StatefulWidget {
  const Verification({Key key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  double height, width;

  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  TextEditingController controller4;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: orangeColor,
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            bgImage(),
            Positioned(
              left: 10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: whiteColor,
                ),
              ),
            ),
            Positioned(
              top: 40,
              bottom: 100,
              left: 20,
              right: 20,
              child: Container(
                margin: const EdgeInsets.only(top: fixPadding * 3.0),
                padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  fixPadding * 2.0,
                  fixPadding * 2.0,
                  fixPadding * 2.0,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: blackColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      'Verify your mobile number',
                      style: black20BoldTextStyle,
                    ),
                    Text(
                      'Please check your messages and enter the\nverification code we just sent you\n+91 1236547890',
                      textAlign: TextAlign.center,
                      style: grey16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      'Enter Code Here',
                      style: black20BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    codeTextField(),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      'Didn’t you receive any code?',
                      style: grey16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    Text(
                      'Resend',
                      style: PrimaryColor18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    continueButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bgImage() {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height * 0.42,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 180,
            width: width,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45), topLeft: Radius.circular(45)),
            ),
            child: Image.asset(
              'assets/logo1.png',
              height: 55,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }

  codeTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 38,
          width: 38,
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
          child: TextField(
            onChanged: (v) {
              String value = controller1.text ?? '';
              if (value.isEmpty) {
                return;
              }
              FocusScope.of(context).requestFocus(focusNode2);
            },
            focusNode: focusNode1,
            controller: controller1,
            keyboardType: TextInputType.number,
            cursorColor: PrimaryColor,
            style: black18SemiBoldTextStyle,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
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
          child: TextField(
            onChanged: (v) {
              String value = controller2.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode1);
                return;
              }
              FocusScope.of(context).requestFocus(focusNode3);
            },
            focusNode: focusNode2,
            controller: controller2,
            keyboardType: TextInputType.number,
            cursorColor: PrimaryColor,
            style: black18SemiBoldTextStyle,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
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
          child: TextField(
            onChanged: (v) {
              String value = controller3.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode2);
                return;
              }
              FocusScope.of(context).requestFocus(focusNode4);
            },
            focusNode: focusNode3,
            controller: controller3,
            keyboardType: TextInputType.number,
            cursorColor: PrimaryColor,
            style: black18SemiBoldTextStyle,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
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
          child: TextField(
            onChanged: (v) {
              String value = controller2.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode3);
                return;
              }
              waitDialog();
            },
            focusNode: focusNode4,
            controller: controller4,
            keyboardType: TextInputType.number,
            cursorColor: PrimaryColor,
            style: black18SemiBoldTextStyle,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  continueButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => waitDialog(),
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
      ],
    );
  }

  waitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contxet) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  const SpinKitRing(
                    color: PrimaryColor,
                    lineWidth: 2.0,
                    size: 50.0,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Please Wait...',
                    style: grey16SemiBoldTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                ],
              ),
            ],
          ),
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
    );
  }
}
