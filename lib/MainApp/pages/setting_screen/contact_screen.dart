// ignore_for_file: deprecated_member_use

import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Theme/colors/colors.dart';
import '../../utils/app_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  void onBack() {
    Navigator.of(context).pop();
  }

  var whatsapp = "+91 9884569700 ";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar(
                    title: "Contact Us",
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     IconButton(
                  //         iconSize: 30,
                  //         splashColor: Colors.green,

                  //         icon:const Icon(Icons.arrow_back),
                  //         onPressed: () {Navigator.of(context).pop();}),

                  //   ],
                  // ),
                  // 25.height,
                  // Text(
                  //   "Contact Us",
                  //   style: GoogleFonts.inter(
                  //       fontWeight: FontWeight.w600, fontSize: 15.sp),
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(height: 10),
                  Text(
                    "Need help with your service",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        // color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Get instant help from our customer support team.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        // color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Divider(
                      color: Color(0xffADADAD),
                    ),
                  ),
                  30.height,
                  Boxshape(
                    link: "https://wa.me/$whatsapp?text= Hi, I have a query",
                    text: "Whatsapp",
                    icon: const FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Boxshape(
                    link: "tel: +918069050505",
                    text: "Call us",
                    icon: const FaIcon(
                      FontAwesomeIcons.phone,
                      // color: appColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Boxshape(
                    link: "mailto: support@accsyspay.com",
                    text: "Mail us",
                    icon: const FaIcon(
                      FontAwesomeIcons.mailBulk,
                      color: Color.fromARGB(255, 175, 116, 76),
                    ),
                  ),
                  30.height,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: Color(0xffADADAD),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // FittedBox(
                  //   child: Text(
                  //     translate.exp,
                  //     style: GoogleFonts.inter(
                  //         fontSize: 17,
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please rate us on Play store",
                    style: GoogleFonts.inter(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () {
                      // launch(
                      // "https://play.google.com/store/apps/details?id=com.accsyspay.vpe");
                    },
                    child: Image.asset(
                      "assets/icons/star.png",
                      height: 6.h,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Socialmedia()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Boxshape extends StatelessWidget {
  String text, link;
  FaIcon icon;
  Boxshape({this.link, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context).darkTheme;
    return InkWell(
      // ignore: unnecessary_statements
      onTap: () async => await launch(link),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // color: white,
              border: Border.all(
                  color: theme ? Colors.white : const Color(0xff2748A0))),
          height: 8.h,
          width: 80.w,
          // padding: const EdgeInsets.symmetric(
          //   vertical: 15.0,
          //   horizontal: 15.0,
          // ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  text,
                  style: GoogleFonts.inter(
                      // fontWeight: FontWeight.bold,
                      // color: black,
                      fontSize: 11.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}

class Socialmedia extends StatelessWidget {
  const Socialmedia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Follow us on",
            style:
                GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // launch("https://www.linkedin.com/company/indo-law-associates");
                },
                child: Image.asset(
                  "assets/images/linkedin.png",
                  height: 4.h,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              InkWell(
                onTap: () {
                  // launch("https://www.facebook.com/Indo-Law-Associates-112576861204879/?ref=pages_you_manage");
                },
                child: Image.asset(
                  "assets/images/fb.png",
                  height: 36,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              InkWell(
                onTap: () {
                  // launch("https://www.instagram.com/indolaw_associates/");
                },
                child: Image.asset(
                  "assets/images/inst.png",
                  height: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw