import 'dart:async';
import 'dart:io';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../MainApp/constant/constant.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double height, width;
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 3) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageViewController,
                    onPageChanged: onChanged,
                    children: [
                      page1(),
                      page2(),
                      page3(),
                      page4(),
                    ],
                  ),
                ),
                pageIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  pageIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 4.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage != 3
              ? InkWell(
                  onTap: () {},
                  //  Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Login()),
                  // ),
                  child: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Skip',
                      style: grey16SemiBoldTextStyle,
                    ),
                  ),
                )
              : Container(width: 80),
          SmoothPageIndicator(
            controller: pageViewController,
            count: 4,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: greyColor.withOpacity(0.2),
              activeDotColor: PrimaryColor,
            ),
          ),
          currentPage != 3
              ? InkWell(
                  onTap: () {
                    setState(() {
                      currentPage++;
                    });
                    pageViewController.animateToPage(
                      currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Next',
                      style: white16BoldTextStyle,
                    ),
                  ),
                )
              : InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Login()),
                  // ),
                  child: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Login',
                      style: white16BoldTextStyle,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/manage.png',
          height: height * 0.45,
          width: width - 50,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Secure Your Money',
          style: black25BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text.',
            textAlign: TextAlign.center,
            style: black16RegularTextStyle,
          ),
        ),
      ],
    );
  }

  page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/manage.png',
          height: height * 0.45,
          width: width - 50,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Manage Everything',
          style: black25BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text.',
            textAlign: TextAlign.center,
            style: black16RegularTextStyle,
          ),
        ),
      ],
    );
  }

  page3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/transfer.png',
          height: height * 0.45,
          width: width - 50,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Quick Money Transfer',
          style: black25BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text.',
            textAlign: TextAlign.center,
            style: black16RegularTextStyle,
          ),
        ),
      ],
    );
  }

  page4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/services.png',
          height: height * 0.45,
          width: width - 50,
          fit: BoxFit.cover,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Various Services',
          style: black25BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text.',
            textAlign: TextAlign.center,
            style: black16RegularTextStyle,
          ),
        ),
      ],
    );
  }
}
