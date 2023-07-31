import 'package:Accsys_Pay/pages/screens.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          userProfile(context),
          divider(),
          heightSpace,
          heightSpace,
          profileDetail(context),
        ],
      ),
    );
  }

  userProfile(context) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Hero(
                tag: 'profilePic',
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/users/user1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              Column(
                children: [
                  Text(
                    'Samantha John ',
                    style: black18SemiBoldTextStyle,
                  ),
                  Text(
                    '+91 1236547890',
                    style: grey16RegularTextStyle,
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: EditProfile(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            child: Image.asset(
              'assets/icons/edit.png',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }

  profileDetail(context) {
    return Column(
      children: [
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: const MyQRCode(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'My QR Code',
          image: 'assets/icons/scan.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: const Favorites(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'Favorite',
          image: 'assets/icons/heart.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: const Wallet(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'Wallet',
          image: 'assets/icons/wallet.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: const Notifications(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'Notifications',
          image: 'assets/icons/notification.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: Help(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'Help',
          image: 'assets/icons/help_line.png',
        ),
        detail(
          ontap: () => Navigator.push(
            context,
            PageTransition(
              child: const TermsAndCondition(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          color: blackColor,
          title: 'Terms and Conditions',
          image: 'assets/icons/list.png',
        ),
        detail(
          ontap: () => logoutDialog(context),
          color: orangeColor,
          title: 'Logout',
          image: 'assets/icons/logout.png',
        ),
      ],
    );
  }

  detail({String title, String image, Function ontap, Color color}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding,
          horizontal: fixPadding * 2.0,
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              color: color,
              height: 22,
              width: 22,
              fit: BoxFit.cover,
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: color,
            )
          ],
        ),
      ),
    );
  }

  logoutDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Text(
                      'Sure you want to logout?',
                      style: black18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () => Navigator.pop(context),
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
                                'Cancel',
                                style: PrimaryColor22BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const Login()),
                            // ),
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
                                'Logout',
                                style: white22BoldTextStyle,
                              ),
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
      },
    );
  }
}
