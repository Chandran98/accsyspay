import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

// ignore: must_be_immutable
class InviteFriends extends StatelessWidget {
  InviteFriends({Key key}) : super(key: key);

  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: orangeColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: whiteColor,
        ),
        title: Text(
          'Invite Now',
          style: white20BoldTextStyle,
        ),
      ),
      body: Stack(
        children: [
          bgImage(),
          inviteText(context),
          invite(),
        ],
      ),
    );
  }

  bgImage() {
    return SizedBox(
      height: height,
      child: Column(
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
        ],
      ),
    );
  }

  inviteText(context) {
    return Positioned(
      top: 200,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width - 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/invite_friends.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Invite Your Friends and Earn\nBonus Amount in Wallet',
            textAlign: TextAlign.center,
            style: white18BoldTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: 2,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
              textAlign: TextAlign.center,
              style: white14RegularTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  invite() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.all(fixPadding),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Invite',
              style: black20BoldTextStyle,
            ),
            heightSpace,
            heightSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/insta.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Instagram',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/snap.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Snapchat',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/gmail.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Gmail',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/twitter.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Twitter',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/messages.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Messages',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/social_media/linkedin.png',
                          height: 35,
                          width: 35,
                        ),
                        heightSpace,
                        Text(
                          'Linkedin',
                          style: black12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
