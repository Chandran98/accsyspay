import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

class SelectContact extends StatelessWidget {
  SelectContact({Key key}) : super(key: key);

  final contactList = [
    {
      'name': 'Amisha Patel',
      'mobileNumber': '992578963',
      'color': const Color(0xffE57373),
      'logo': 'assets/logo2.png',
    },
    {
      'name': 'Aesha Gupta',
      'mobileNumber': '845698712',
      'color': const Color(0xffF06292),
      'logo': 'assets/logo2.png',
    },
    {
      'name': 'AKii Patel',
      'mobileNumber': '769845632',
      'color': const Color(0xffE57373),
    },
    {
      'name': 'Aelisha Mehta',
      'mobileNumber': '925896314',
      'color': const Color(0xffBA68C8),
      'logo': 'assets/logo2.png',
    },
    {
      'name': 'Beena Shah',
      'mobileNumber': '992571236',
      'color': const Color(0xff9575CD),
      'logo': 'assets/logo2.png',
    },
    {
      'name': 'Brijal Mehta',
      'mobileNumber': '845698712',
      'color': const Color(0xffF06292),
    },
    {
      'name': 'Benafsha Zariwala',
      'mobileNumber': '769845632',
      'color': const Color(0xff7986CB),
    },
    {
      'name': 'Bipin Patel',
      'mobileNumber': '925896314',
      'color': const Color(0xff64B5F6),
    },
    {
      'name': 'Charmi Patel',
      'mobileNumber': '992571235',
      'color': const Color(0xff4DD0E1),
      'logo': 'assets/logo2.png',
    },
    {
      'name': 'Diya Mehta',
      'mobileNumber': '845698123',
      'color': const Color(0xff4DB6AC),
    },
    {
      'name': 'Disha Sharma',
      'mobileNumber': '769845621',
      'color': const Color(0xff81C784),
    },
    {
      'name': 'Dolly John',
      'mobileNumber': '925896348',
      'color': const Color(0xffA1887F),
    },
    {
      'name': 'Dipali Sharma',
      'mobileNumber': '769845621',
      'color': const Color(0xff3D74B6),
    },
    {
      'name': 'Dolly John',
      'mobileNumber': '925893148',
      'color': const Color(0xffA1887F),
    },
    {
      'name': 'Dipali Sharma',
      'mobileNumber': '769845321',
      'color': const Color(0xff3D74B6),
    },
  ];

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
          'Select Contact',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(),
          newMobileNumber(),
          contacts(),
        ],
      ),
    );
  }

  searchTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
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
        cursorColor: PrimaryColor,
        style: black14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: fixPadding * 1.5),
          hintText: 'Enter a mobile number or name',
          hintStyle: grey14SemiBoldTextStyle,
          prefixIcon: const Icon(
            Icons.search,
            color: greyColor,
            size: 15,
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  newMobileNumber() {
    return Padding(
      padding: const EdgeInsets.only(
        left: fixPadding * 2.0,
        bottom: 6.5,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: PrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/icons/apps.png',
              color: whiteColor,
              height: 18,
              width: 18,
            ),
          ),
          widthSpace,
          widthSpace,
          Text(
            'New Mobile Number',
            style: PrimaryColor16BoldTextStyle,
          ),
        ],
      ),
    );
  }

  contacts() {
    return ColumnBuilder(
      itemCount: contactList.length,
      itemBuilder: (context, index) {
        final item = contactList[index];
        String getInitials = item['name']
            .toString()
            .trim()
            .split(' ')
            .map((l) => l[0])
            .take(2)
            .join();
        return InkWell(
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: SendMoney(
                name: item['name'],
                mobileNumber: item['mobileNumber'],
              ),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              3.5,
              fixPadding * 2.0,
              3.5,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(bottom: 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: item['color'],
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        getInitials,
                        style: white18BoldTextStyle,
                      ),
                    ),
                    item['logo'] != null
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(item['logo']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withOpacity(0.1),
                                    spreadRadius: 1.5,
                                    blurRadius: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                widthSpace,
                widthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: black16SemiBoldTextStyle,
                    ),
                    Text(
                      item['mobileNumber'],
                      style: grey14SemiBoldTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
