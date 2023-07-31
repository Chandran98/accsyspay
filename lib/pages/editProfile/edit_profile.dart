import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key key}) : super(key: key);

  final nameController = TextEditingController(text: 'Samantha John');
  final emailController = TextEditingController(text: 'johnsamantha@gmail.com');
  final mobileNumberController = TextEditingController(text: '+91 1234567890');
  final passwordController = TextEditingController(text: 'Samantha');

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
          'Edit Profile',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          profileImage(context),
          nameTextField(),
          emailTextField(),
          mobileNumberTextField(),
          passwordTextField(),
          updateButton(context),
        ],
      ),
    );
  }

  profileImage(context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Hero(
              tag: 'profilePic',
              child: Container(
                height: 85,
                width: 85,
                margin: const EdgeInsets.only(bottom: fixPadding / 2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 206,
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: orangeColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: whiteColor,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfilePick(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Choose Option',
                    textAlign: TextAlign.center,
                    style: black20BoldTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.camera_alt_outlined,
                          color: blackColor,
                          size: 20.0,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Take a Picture',
                          style: black16SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.photo_library_outlined,
                          color: blackColor,
                          size: 20.0,
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Select from Gallery',
                          style: black16SemiBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Name',
            style: grey16SemiBoldTextStyle,
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
              keyboardType: TextInputType.name,
              controller: nameController,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding * 2.0),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: grey16SemiBoldTextStyle,
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
              controller: emailController,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding * 2.0),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mobileNumberTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile Number',
            style: grey16SemiBoldTextStyle,
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
              controller: mobileNumberController,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding * 2.0),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  passwordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: grey16SemiBoldTextStyle,
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
              obscureText: true,
              controller: passwordController,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: fixPadding * 2.0),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.pop(context),
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
              'Update Profile',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
