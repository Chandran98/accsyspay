import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class ElectricityBillPayment extends StatelessWidget {
  ElectricityBillPayment({Key key}) : super(key: key);

  final companyList = [
    {
      'image': 'assets/electricity_company/company1.png',
      'name': 'APSPDCL AP South',
    },
    {
      'image': 'assets/electricity_company/company2.png',
      'name': 'Adani Electricity Mumbai Limited',
    },
    {
      'image': 'assets/electricity_company/company3.png',
      'name': 'Ajmer Vidyut Vitran Nigam Ltd',
    },
    {
      'image': 'assets/electricity_company/company4.png',
      'name': 'Assam Power Distribution Company',
    },
    {
      'image': 'assets/electricity_company/company5.png',
      'name': 'BESCOM Bangalore',
    },
    {
      'image': 'assets/electricity_company/company6.png',
      'name': 'BESL Bharatpur Electricity Services Ltd',
    },
    {
      'image': 'assets/electricity_company/company7.png',
      'name': 'DGVCL Dakshin Gujarat Vij Company',
    },
    {
      'image': 'assets/electricity_company/company8.png',
      'name': 'Gift Power Company Limited',
    },
    {
      'image': 'assets/electricity_company/company9.png',
      'name': 'MGVCL Madhya Gujarat Vij',
    },
    {
      'image': 'assets/electricity_company/company10.png',
      'name': 'Torrent Power',
    },
    {
      'image': 'assets/electricity_company/company11.png',
      'name': 'PGVCL Paschim Gujarat Vij',
    },
    {
      'image': 'assets/electricity_company/company1.png',
      'name': 'APSPDCL AP South',
    },
    {
      'image': 'assets/electricity_company/company2.png',
      'name': 'Adani Electricity Mumbai Limited',
    },
    {
      'image': 'assets/electricity_company/company3.png',
      'name': 'Ajmer Vidyut Vitran Nigam Ltd',
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
          'Electricity Bill Payment',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(context),
          company(context),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  searchTextField(context) {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: Search(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
          height: 48,
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
          child: Row(
            children: [
              widthSpace,
              widthSpace,
              const Icon(
                Icons.search,
                color: greyColor,
                size: 15,
              ),
              widthSpace,
              widthSpace,
              Text(
                'Type your provider name...',
                style: grey14SemiBoldTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  company(context) {
    return ColumnBuilder(
      itemCount: companyList.length,
      itemBuilder: (context, index) {
        final item = companyList[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: BillPayment(
                company: item['name'],
                logo: item['image'],
              ),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              index == 0 ? 0 : fixPadding,
              fixPadding * 2.0,
              0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      constraints:
                          const BoxConstraints(maxHeight: 40, maxWidth: 40),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(item['image']),
                    ),
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Text(
                        item['name'],
                        overflow: TextOverflow.ellipsis,
                        style: black16SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                heightSpace,
                heightSpace,
                divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
