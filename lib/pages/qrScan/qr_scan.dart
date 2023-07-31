import 'package:Accsys_Pay/pages/screens.dart';

class QRScan extends StatelessWidget {
  const QRScan({Key key}) : super(key: key);

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
          'QR Scan',
          style: black20BoldTextStyle,
        ),
      ),
      body: qrScan(),
    );
  }

  Stack qrScan() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/qr_scan.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scan Digital Payment QR or any QR',
                style: white16BoldTextStyle,
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 310,
          child: Column(
            children: [
              Image.asset(
                'assets/icons/flash.png',
                height: 22,
                width: 10,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Image.asset(
                'assets/icons/photo.png',
                height: 15,
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
