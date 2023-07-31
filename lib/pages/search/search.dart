import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

class Search extends StatelessWidget {
  Search({Key key}) : super(key: key);

  final searchList = [
    {'search': 'Train tiTckes booking'},
    {'search': 'Buy tops'},
    {'search': 'Water bill'},
  ];

  final linkList = [
    {
      'image': 'assets/icons/money_transfer.png',
      'name': 'Money Transfer',
    },
    {
      'image': 'assets/icons/payments.png',
      'name': 'Payments',
    },
    {
      'image': 'assets/icons/water.png',
      'name': 'Water',
    },
    {
      'image': 'assets/icons/discount.png',
      'name': 'Discounts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          searchTextField(),
          recentSearches(),
          links(),
        ],
      ),
    );
  }

  searchTextField() {
    return Container(
      height: 30,
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor)),
      ),
      child: TextField(
        cursorColor: PrimaryColor,
        style: black14SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(top: fixPadding / 2),
          hintText: 'What\'re you looking for?',
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

  recentSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Searches',
            style: black18BoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              final item = searchList[index];
              return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: index == 0 ? 6 : fixPadding / 2),
                child: Text(
                  item['search'],
                  style: grey14RegularTextStyle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  links() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Links',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 60,
            ),
            itemCount: linkList.length,
            itemBuilder: (context, index) {
              final item = linkList[index];
              return Column(
                children: [
                  Image.asset(
                    item['image'],
                    height: 35,
                    width: 35,
                  ),
                  heightSpace,
                  Text(
                    item['name'],
                    overflow: TextOverflow.ellipsis,
                    style: black12SemiBoldTextStyle,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
