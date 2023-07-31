import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class BillPayment extends StatelessWidget {
  final String logo;
  final String company;
  const BillPayment({Key key, this.company, this.logo}) : super(key: key);

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
          company,
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          idTextField(),
        ],
      ),
      bottomNavigationBar: confirmButton(context),
    );
  }

  idTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Consumer ID',
            style: grey14SemiBoldTextStyle,
          ),
          heightSpace,
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: PrimaryColor,
            style: black16BoldTextStyle,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(bottom: fixPadding / 2),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor)),
            ),
          ),
        ],
      ),
    );
  }

  confirmButton(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: BillDetail(logo: logo),
                type: PageTransitionType.rightToLeft,
              ),
            ),
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
                'Confirm',
                style: white22BoldTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
