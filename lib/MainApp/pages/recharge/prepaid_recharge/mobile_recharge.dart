import 'dart:math';
import 'package:Accsys_Pay/MainApp/provider/recharge_provider.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../provider/themeprovider.dart';
import '../../../utils/Internet connectivity/Network_status.dart';
import '../../../utils/main_app_utils.dart';
import '../../main_screen.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({Key key}) : super(key: key);

  @override
  _MobileRechargeScreenState createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  String isSelected = 'prepaid';
  bool isChecked = false;
  String operator = 'Jio';
  String prePaidoperatorId = '1';
  String postPaidOperatorId = '1';
  String circleId = "1";
  String circle = 'TamilNadu';

  List<ImageModel> planList = [
    ImageModel(image: 'assets/mobile_card/aritel.png', code: '1'),
    ImageModel(image: 'assets/mobile_card/vi.png', code: '2'),
    ImageModel(image: 'assets/mobile_card/jio.png', code: '4'),
    ImageModel(image: 'assets/mobile_card/bsnl.png', code: '8'),
  ];

  final mobileController = TextEditingController();
  final postpaidMobileController = TextEditingController();

  void initState() {
    super.initState();
    Provider.of<RechargeProvider>(context, listen: false)
        .getAllMobileOperators();
    Provider.of<RechargeProvider>(context, listen: false).getCircle();
    Provider.of<RechargeProvider>(context, listen: false).utilityOperator();
  }

  final _prePaidformKey = GlobalKey<FormState>();
  final _postPaidformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onBack() {
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    }

    final rechargeProvider = Provider.of<RechargeProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: NetworkSensitive(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              // titleSpacing: 0,
              leading: IconButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MainScreen())),
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                Image.asset(
                  "assets/images/logo/vl.png",
                  scale: 6,
                )
              ],
              backgroundColor: PrimaryColor,
              iconTheme: const IconThemeData(color: whiteColor),
              title: const Text(
                'Mobile Recharge',
                // style: black20BoldTextStyle,
              ),
            ),
            body:
                Consumer<RechargeProvider>(builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    radioButton(),
                    isSelected == "prepaid"
                        ?

                        // prePaid tab
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(fixPadding * 2.0),
                                child: Column(
                                  children: [
                                    Form(
                                      key: _prePaidformKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Mobile Number',
                                                // style: grey16SemiBoldTextStyle,
                                              ),
                                              spacer10Height,
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: blackColor
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1.2,
                                                        blurRadius: 1.2,
                                                      ),
                                                    ],
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.phone,

                                                    cursorColor: PrimaryColor,
                                                    // ignore: missing_return
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty ||
                                                          value.length != 10) {
                                                        return 'Please enter valid mobile';
                                                      }
                                                    },
                                                    controller:
                                                        mobileController,
                                                    style:
                                                        black18SemiBoldTextStyle,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.phone_android,
                                                        color: PrimaryColor,
                                                        size: 20,
                                                      ),
                                                      border:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    // provider.fetchoperator == null
                                    //     ? const SizedBox()
                                    //     : Container(
                                    //         decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           border: Border.all(
                                    //               color: Colors.grey.shade100,
                                    //               width: 3),
                                    //           borderRadius:
                                    //               BorderRadius.circular(5),
                                    //         ),
                                    //         width: 300,
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.all(8.0),
                                    //           child: Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(5.0),
                                    //                 child: Row(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment
                                    //                           .spaceBetween,
                                    //                   children: [
                                    //                     const Text(
                                    //                       "Network",
                                    //                       style: TextStyle(
                                    //                           color: blackColor,
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w700),
                                    //                     ),
                                    //                     Text(provider
                                    //                                 .fetchoperator ==
                                    //                             null
                                    //                         ? "data"
                                    //                         : provider
                                    //                             .fetchoperator
                                    //                             .operatorOperator),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //               Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(5.0),
                                    //                 child: Row(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment
                                    //                           .spaceBetween,
                                    //                   children: [
                                    //                     const Text(
                                    //                       "Mobile",
                                    //                       style: TextStyle(
                                    //                           color: blackColor,
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w700),
                                    //                     ),
                                    //                     Text(
                                    //                         provider.fetchoperator ==
                                    //                                 null
                                    //                             ? "data"
                                    //                             : provider
                                    //                                 .fetchoperator
                                    //                                 .mobile),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //               Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(5.0),
                                    //                 child: Row(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment
                                    //                           .spaceBetween,
                                    //                   children: [
                                    //                     const Text(
                                    //                       "Circle",
                                    //                       style: TextStyle(
                                    //                           color: blackColor,
                                    //                           fontWeight:
                                    //                               FontWeight
                                    //                                   .w700),
                                    //                     ),
                                    //                     Text(
                                    //                         provider.fetchoperator ==
                                    //                                 null
                                    //                             ? "data"
                                    //                             : provider
                                    //                                 .fetchoperator
                                    //                                 .circle),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),

                                    InkWell(
                                      borderRadius: BorderRadius.circular(5.0),
                                      onTap: () {
                                        if (_prePaidformKey.currentState
                                            .validate()) {
                                          provider.fetchOperator(
                                              mobileController.text, context);
                                          provider.getCharges();
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(
                                            fixPadding * 1.2),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: PrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: PrimaryColor
                                          //         .withOpacity(0.4),
                                          //     spreadRadius: 2,
                                          //     blurRadius: 2,
                                          //   ),
                                          // ],
                                        ),
                                        child: provider.loading
                                            ? const CircularProgressIndicator(
                                                color: whiteColor,
                                              )
                                            : Text(
                                                'Select Plan',
                                                style: white22BoldTextStyle,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        :
                        // postpaid tab

                        Padding(
                            padding: const EdgeInsets.all(fixPadding * 2.0),
                            child: Column(
                              children: [
                                Form(
                                  key: _postPaidformKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mobile Number',
                                            // style: grey16SemiBoldGoogleFonts.inter,
                                            style: GoogleFonts.inter(
                                                // color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          heightSpace,
                                          Container(
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: blackColor
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1.2,
                                                  blurRadius: 1.2,
                                                ),
                                              ],
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.phone,

                                              cursorColor: PrimaryColor,
                                              // ignore: missing_return
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty ||
                                                    value.length != 10) {
                                                  return 'Please enter valid mobile';
                                                }
                                              },
                                              controller:
                                                  postpaidMobileController,
                                              style: black18SemiBoldTextStyle,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.phone_android,
                                                  color: PrimaryColor,
                                                  size: 20,
                                                ),
                                                border: UnderlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Select Operator',
                                            style: TextStyle(
                                                // color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          heightSpace,
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: theme.darkTheme
                                                  ? Colors.black
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey.shade100,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 280,
                                            child: ListView.builder(
                                              itemCount: rechargeProvider
                                                  .postpaidOperators.length,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var jsonData = rechargeProvider
                                                    .postpaidOperators[index]
                                                    .details[index];
                                                return InkWell(
                                                    onTap: () {
                                                      postPaidOperatorId =
                                                          jsonData.operatorId
                                                              .toString();
                                                      print(postPaidOperatorId);
                                                      if (_postPaidformKey
                                                          .currentState
                                                          .validate()) {
                                                        print(
                                                          postpaidMobileController
                                                              .text,
                                                        );
                                                        print(postPaidOperatorId
                                                            .toString());
                                                        Provider.of<RechargeProvider>(
                                                                context,
                                                                listen: false)
                                                            .postpaidMobileOffer(
                                                                postpaidMobileController
                                                                    .text,
                                                                postPaidOperatorId,
                                                                context);
                                                        provider.getCharges();
                                                      }
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8.0,
                                                        ),
                                                        child: Container(
                                                          color: postPaidOperatorId ==
                                                                  rechargeProvider
                                                                      .postpaidOperators[
                                                                          index]
                                                                      .details[
                                                                          index]
                                                                      .operatorId
                                                              ? PrimaryColor
                                                                  .withOpacity(
                                                                      0.2)
                                                              : theme.darkTheme
                                                                  ? Colors.grey
                                                                      .shade800
                                                                  : Colors.grey
                                                                      .shade100,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(
                                                            8.0,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(
                                                            8.0,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  flex: 1,
                                                                  child: SizedBox(
                                                                      height:
                                                                          35,
                                                                      child: jsonData.logo !=
                                                                              "https://res.cloudinary.com/villagehosting-top-ssd-web-hosting-provider/image/upload/c_scale,w_32/v1610428469/Vi-logo_edrxf3.svg"
                                                                          ? Image.network(jsonData
                                                                              .logo)
                                                                          : SvgPicture.network(
                                                                              jsonData.logo))),
                                                              Expanded(
                                                                  flex: 3,
                                                                  child: Text(
                                                                      jsonData
                                                                          .operatorName)),
                                                            ],
                                                          ),
                                                        )));
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5.0),
                                      onTap: () {
                                        if (_postPaidformKey.currentState
                                            .validate()) {
                                          print(
                                            postpaidMobileController.text,
                                          );
                                          print(postPaidOperatorId.toString());
                                          Provider.of<RechargeProvider>(context,
                                                  listen: false)
                                              .postpaidMobileOffer(
                                                  postpaidMobileController.text,
                                                  postPaidOperatorId,
                                                  context);
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        padding: const EdgeInsets.all(
                                            fixPadding * 1.2),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: PrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color:
                                          //         PrimaryColor.withOpacity(0.4),
                                          //     spreadRadius: 2,
                                          //     blurRadius: 2,
                                          //   ),
                                          // ],
                                        ),
                                        child: rechargeProvider.loading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                color: Colors.white,
                                              ))
                                            : Text(
                                                'Fetch Bill',
                                                style: white20BoldTextStyle,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  radioButton() {
    var theme = Provider.of<ThemeProvider>(context);
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
                      ? GoogleFonts.inter(
                          color: theme.darkTheme ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          // fontFamily: 'NunitoSans',
                        )
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
                      ? GoogleFonts.inter(
                          color: theme.darkTheme ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          // fontFamily: 'NunitoSans',
                        )
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mobile Number',
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
          child: TextFormField(
            keyboardType: TextInputType.phone,

            cursorColor: PrimaryColor,
            // ignore: missing_return
            validator: (value) {
              if (value == null || value.isEmpty || value.length != 10) {
                return 'Please enter valid mobile';
              }
            },
            controller: mobileController,
            style: black18SemiBoldTextStyle,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android,
                color: PrimaryColor,
                size: 20,
              ),
              // suffixIcon: Image.asset(
              //   'assets/icons/contact_number.png',
              //   color: PrimaryColor,
              //   height: 15,
              //   width: 15,
              // ),
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageModel {
  String image, code;

  ImageModel({this.image, this.code});
}
