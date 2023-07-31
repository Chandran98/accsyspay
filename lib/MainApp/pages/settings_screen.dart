import 'package:Accsys_Pay/MainApp/component/setting_widget.dart';
import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/setting_screen/contact_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/splash_screen.dart';
import 'package:Accsys_Pay/MainApp/pages/service_history/service_history_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/charts/Transaction_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Theme/colors/colors.dart';
import '../provider/bus_provider.dart';
import '../provider/service_history_provider.dart';
import '../provider/themeprovider.dart';
import '../provider/wallet_provider.dart';
import '../utils/Internet connectivity/Network_status.dart';
import '../utils/main_app_utils.dart';
import 'auth_screen/login.dart';
import 'bus_booking/bus_screen/9_bus_history_screen.dart';
import 'edit_profile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void onBack() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var serviceProvider =
        Provider.of<ServiceHistoryProvider>(context, listen: false);
    var theme = Provider.of<ThemeProvider>(context);
    var profileInfo = Provider.of<AuthProvider>(context);
    // print("Name details${profileInfo.profileData.name}");
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: NetworkSensitive(
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: PrimaryColor,
                title: const Text("Profile"),
                actions: [
                  Image.asset(
                    "assets/images/logo/vl.png",
                    scale: 6,
                  )
                ],
                leading: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const MainScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: white,
                  ),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(15, 20, 20, 50),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // profileInfo.profileData==null
                  //     ? CircularProgressIndicator()
                  //     : Column(
                  //         children: [
                  //           Text('Name ${profileInfo.profileData.name}'),
                  //           Text('Name ${profileInfo.profileData.email}'),
                  //         ],
                  //       ),
                  const UserProfile(),
                  const Text(
                    "General Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  spacer20Height,
                  ListTile(
                      title: const Text('Dark mode'),
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(CupertinoIcons.moon_stars,
                            size: 20, color: Colors.white),
                      ),
                      trailing: Switch(
                          activeColor: PrimaryColor,
                          value: Provider.of<ThemeProvider>(context).darkTheme,
                          onChanged: (active) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                          })),
                  const Divider(
                    height: 3,
                  ),
                  ListTile(
                    title: const Text('get notifications'),
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.notifications_active,
                          size: 22, color: Colors.white),
                    ),
                    trailing: Switch(
                        value: false,
                        activeColor: PrimaryColor,
                        // value: context.watch<Notifierprovider>().subscribe,
                        onChanged: (bool) {
                          // context.read<Notifierprovider>().fcmSubscribe(bool);
                        }),
                  ),
                  ListTileWidget(
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ContactPage()));
                    },
                    icon: FeatherIcons.headphones,
                    title: 'Contact us',
                  ),
                  ListTileWidget(
                    color: Colors.blueAccent,
                    onTap: () {
                      // serviceProvider.serviceHistory(context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ServiceHistoryScreen()));
                    },
                    icon: FeatherIcons.barChart2,
                    title: 'History',
                  ),
                  ListTileWidget(
                    color: Colors.orangeAccent,
                    onTap: () {
                      // launch(
                      //     "https://play.google.com/store/apps/details?id=com.vairaapay.vpe");
                    },
                    icon: FeatherIcons.star,
                    title: 'Rate this app',
                  ),
                  ListTileWidget(
                    color: Colors.redAccent,
                    onTap: () {
                      launch("https://accsyspay.com/privacy-policy.html");
                    },
                    icon: FeatherIcons.lock,
                    title: 'Privacy policy',
                  ),
                  ListTileWidget(
                    color: Colors.blueGrey,
                    onTap: () {
                      launch("https://accsyspay.com/refund-policy.html");
                    },
                    icon: FeatherIcons.refreshCcw,
                    title: 'Refund policy',
                  ),
                  ListTileWidget(
                    color: Colors.greenAccent,
                    onTap: () {
                      launch("https://accsyspay.com");
                    },
                    icon: FeatherIcons.info,
                    title: 'About us',
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // @override
  // void initState() {
  //   // TODO: implement initState

  //   Provider.of<WalletProvider>(context, listen: false).walletBalance();

  //   Provider.of<AuthProvider>(context, listen: false).getProfileInfo();
  //   Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
  //   super.initState();
  // }

  bool balance = false;
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    var profileInfo = Provider.of<AuthProvider>(context);
    var balanceProvider = Provider.of<WalletProvider>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
                child: Text(
                  profileInfo.profileData == null
                      ? ""
                      : profileInfo.profileData.name[0].toUpperCase(),
                  style: GoogleFonts.inter(
                      color: white, fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              spacer20Height,
              Text(
                // ignore: unnecessary_null_comparison
                profileInfo.profileData == null
                    ? ""
                    : profileInfo.profileData.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              spacer10Height,
              Text(
                profileInfo.profileData == null
                    ? ""
                    : profileInfo.profileData.email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              // spacer20Height,
              // Text(
              //   profileInfo.profileData == null
              //       ? ""
              //       : profileInfo.profileData.mobile,
              //   // authprovider.name.toString(),
              //   // name== null?  authprovider.name.toString():"Name",
              //   style:
              //       const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              // ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: theme.darkTheme ? Colors.black : Colors.white,
              //         borderRadius: BorderRadius.circular(8)),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 4.0, vertical: 14),
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 18.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Total Balance",
              //                       style: GoogleFonts.inter(
              //                           // color: Colors.grey,
              //                           fontSize: 12.sp,
              //                           fontWeight: FontWeight.w600),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(right: 18.0),
              //                       child: Container(
              //                         decoration: BoxDecoration(
              //                             color: PrimaryColor,
              //                             borderRadius:
              //                                 BorderRadius.circular(8)),
              //                         child: Padding(
              //                           padding: EdgeInsets.all(6.0),
              //                           child: Text(
              //                             " Dashboard ",
              //                             style: GoogleFonts.inter(
              //                                 color: Colors.white,
              //                                 fontSize: 11.sp,
              //                                 fontWeight: FontWeight.w500),
              //                           ),
              //                         ),
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //                 Row(
              //                   children: [
              //                     Text(
              //                       // balance == "null"
              //                       //     ? "-----"
              //                       //     :
              //                       balance
              //                           ? "₹ ${balanceProvider.balance.toString() == "null" ? "0" : balanceProvider.balance.toString()}"
              //                           : "₹ *****",
              //                       style: GoogleFonts.inter(
              //                           // color: Colors.black,
              //                           fontSize: 14.sp,
              //                           fontWeight: FontWeight.w700),
              //                     ),
              //                     IconButton(
              //                       onPressed: () {
              //                         setState(() {
              //                           balance = !balance;
              //                         });
              //                       },
              //                       icon: balance
              //                           ? const Icon(
              //                               FeatherIcons.eye,
              //                               size: 20,
              //                             )
              //                           : const Icon(
              //                               FeatherIcons.eyeOff,
              //                               size: 20,
              //                             ),
              //                     )
              //                   ],
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Expanded(
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           spacer10Height,
              //                           Text(
              //                             "Income",
              //                             style: GoogleFonts.inter(
              //                                 // color: Colors.grey,
              //                                 fontSize: 10.sp,
              //                                 fontWeight: FontWeight.w600),
              //                           ),
              //                           spacer10Height,
              //                           Row(
              //                             children: [
              //                               Container(
              //                                 height: 2.1.h,
              //                                 width: 4.2.w,
              //                                 decoration: BoxDecoration(
              //                                     color: Color(0xFF074aa1),
              //                                     borderRadius:
              //                                         BorderRadius.circular(2)),
              //                                 child: Center(
              //                                   child: Icon(
              //                                     CupertinoIcons
              //                                         .arrow_down_left,
              //                                     color: white,
              //                                     size: 2.h,
              //                                   ),
              //                                 ),
              //                               ),
              //                               spacer5Width,
              //                               Text(
              //                                 // balance == "null"
              //                                 //     ? "-----"
              //                                 //     :
              //                                 balance
              //                                     ? "₹ ${balanceProvider.totalInflowAmount.toString() == "null" ? "0" : balanceProvider.totalInflowAmount}"
              //                                     : "₹ *****",
              //                                 style: GoogleFonts.inter(
              //                                     // color: Colors.black,
              //                                     fontSize: 10.sp,
              //                                     fontWeight: FontWeight.w600),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           spacer10Height,
              //                           Text(
              //                             "Expenses",
              //                             style: GoogleFonts.inter(
              //                                 // color: Colors.grey,
              //                                 fontSize: 10.sp,
              //                                 fontWeight: FontWeight.w600),
              //                           ),
              //                           spacer10Height,
              //                           Row(
              //                             children: [
              //                               Container(
              //                                 height: 2.1.h,
              //                                 width: 4.2.w,
              //                                 decoration: BoxDecoration(
              //                                     color: appColor,
              //                                     borderRadius:
              //                                         BorderRadius.circular(2)),
              //                                 child: Center(
              //                                   child: Icon(
              //                                     CupertinoIcons.arrow_up_right,
              //                                     color: white,
              //                                     size: 2.h,
              //                                   ),
              //                                 ),
              //                               ),
              //                               spacer5Width,
              //                               Text(
              //                                 balance
              //                                     ? "₹ ${balanceProvider.totalOutflowAmount.toString() == "null" ? "0" : balanceProvider.totalOutflowAmount}"
              //                                     : "₹ *****",
              //                                 style: GoogleFonts.inter(
              //                                     // color: Colors.black,
              //                                     fontSize: 10.sp,
              //                                     fontWeight: FontWeight.w600),
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     TransactionChart()
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
      
      
            ],
          ),
        ),
        ListTileWidget(
            title: "Edit profile",
            color: Colors.blueAccent,
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                          name: profileInfo.profileData == null
                              ? ""
                              : profileInfo.profileData.name,
                          mobile: profileInfo.profileData == null
                              ? ""
                              : profileInfo.profileData.mobile)));
            },
            icon: FeatherIcons.edit3),
        ListTileWidget(
            title: "Log out",
            color: Colors.redAccent,
            onTap: () {
              logout(context);
            },
            icon: FeatherIcons.logOut),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  void logout(context) {
    showDialog(
        context: (context),
        builder: (_) {
          return AlertDialog(
            title: const Text(
              "Do you want to Exit",
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              InkWell(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.clear();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                    // });
                  },
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: white),
                      ),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.of(_).pop();
                  },
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: white),
                      ),
                    ),
                  )),
            ],
          );
        });
  }
}
