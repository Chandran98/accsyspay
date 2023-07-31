import 'package:Accsys_Pay/pages/screens.dart';

class MyQRCode extends StatelessWidget {
  const MyQRCode({Key key}) : super(key: key);

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
          'My Qr Code',
          style: black20BoldTextStyle,
        ),
      ),
      body: Column(
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          code(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          downloadButton(context),
        ],
      ),
    );
  }

  code() {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/qr_code.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 58,
              left: 58,
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: whiteColor, width: 3.5),
                  image: const DecorationImage(
                    image: AssetImage('assets/users/user1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'BOCC - 1710',
          style: black18SemiBoldTextStyle,
        ),
      ],
    );
  }

  downloadButton(context) {
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
              'Download',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
