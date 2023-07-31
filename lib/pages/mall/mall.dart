import 'package:Accsys_Pay/pages/screens.dart';

import '../../MainApp/constant/constant.dart';

class Mall extends StatelessWidget {
  Mall({Key key}) : super(key: key);

  final categoriesList = [
    {
      'image': 'assets/shopping_category/fashion.png',
      'category': 'Fashion',
    },
    {
      'image': 'assets/shopping_category/electronics.png',
      'category': 'Electronics',
    },
    {
      'image': 'assets/shopping_category/phones.png',
      'category': 'Phones',
    },
    {
      'image': 'assets/shopping_category/devices.png',
      'category': 'Devices',
    },
    {
      'image': 'assets/shopping_category/beauty.png',
      'category': 'Beauty',
    },
    {
      'image': 'assets/shopping_category/home_decor.png',
      'category': 'Home Decor',
    },
    {
      'image': 'assets/shopping_category/toys_games.png',
      'category': 'Toys-Games',
    },
    {
      'image': 'assets/shopping_category/baby_care.png',
      'category': 'Baby Care Products',
    },
  ];

  final dealList = [
    {
      'image': 'assets/shopping_deals/accessories.png',
      'deal': 'Accessories Deals',
      'off': 'Up to 25% off',
    },
    {
      'image': 'assets/shopping_deals/fashion.png',
      'deal': 'Fashion Deals',
      'off': 'Up to 20% off',
    },
    {
      'image': 'assets/shopping_deals/hair_care.png',
      'deal': 'Hair Care Deals',
      'off': 'Up to 25% off',
    },
    {
      'image': 'assets/shopping_deals/electronics_item.png',
      'deal': 'Electronics Item Deals',
      'off': 'Up to 20% off',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Mall',
          style: black20BoldTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              PageTransition(
                child: const MyCart(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            icon: Image.asset(
              'assets/icons/shopping_basket.png',
              height: 16,
              width: 17,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(context),
          categories(),
          banner(),
          deals(),
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
                'Search here...',
                style: grey14SemiBoldTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: Text(
            'Shop by Categories',
            style: black18BoldTextStyle,
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              final item = categoriesList[index];
              return Container(
                width: 60,
                margin: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  2,
                  fixPadding,
                  0,
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: ShopByCategory(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: blackColor.withOpacity(0.1),
                              spreadRadius: 1.2,
                              blurRadius: 1.2,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        item['category'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: black12SemiBoldTextStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  banner() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/banner_image2.png',
              height: 135,
              width: 185,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: fixPadding,
              top: 6,
              bottom: fixPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All New Summer Collection',
                  style: white16BoldTextStyle,
                ),
                heightSpace,
                Text(
                  'Get 25% Off',
                  style: white14SemiBoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 1.2,
                    vertical: fixPadding,
                  ),
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Shop Now',
                    style: white18BoldTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  deals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Today\'s Deals',
            style: black18BoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            mainAxisExtent: 240,
          ),
          itemCount: dealList.length,
          itemBuilder: (context, index) {
            final item = dealList[index];
            return InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: ShopByCategory(),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
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
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item['image'],
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.206,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding,
                            vertical: fixPadding / 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['deal'],
                                overflow: TextOverflow.ellipsis,
                                style: black16SemiBoldTextStyle,
                              ),
                              Text(
                                item['off'],
                                style: orange14BoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
