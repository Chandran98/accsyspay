import 'package:Accsys_Pay/pages/screens.dart';

class ShopByCategory extends StatelessWidget {
  ShopByCategory({Key key}) : super(key: key);

  final categoryList = [
    {
      'image': 'assets/products/product1.png',
      'category': 'Men\'s Clothing',
      'products':
          'Tshirts , Jeans , Shirts , Flip flops , Belts  Coats - Jackets , Sweaters - Vests , Polo shirts Rugby etc...',
    },
    {
      'image': 'assets/products/product2.png',
      'category': 'Women\'s Clothing',
      'products':
          'Tshirts , Jeans , Shirts , Suits , Saree , Kurtis Lehengas , Nightwear , Shorts , Dresses , Casual etc...',
    },
    {
      'image': 'assets/products/product3.png',
      'category': 'Kids Clothing',
      'products':
          'Tshirts , Trousers , Skirts , Shorts , Denim , Nightwear , Jeans , Dresses , Polos , Trousers etc... ',
    },
    {
      'image': 'assets/products/product4.png',
      'category': 'Footwear',
      'products':
          'Women’s : Ballet Flats , Flip-Flops , Sandals etc...\nMen’s : Loafers , Moccasins , Oxfords etc...',
    },
    {
      'image': 'assets/products/product5.png',
      'category': 'Accessories',
      'products':
          'Women’s : Shawls , Socks , Caps - Hats , Ties etc...\nMen’s : Ties , Caps , Suspenders etc...',
    },
    {
      'image': 'assets/products/product6.png',
      'category': 'Jewelry',
      'products':
          'Crowns , Earrings , Chokers , Necklaces , Bracelet , Rings Belly chain , Brooch , Kundan etc...',
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
          'Fashion',
          style: black20BoldTextStyle,
        ),
      ),
      body: category(),
    );
  }

  category() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final item = categoryList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 2.0 : 0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: const CategoryProducts(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, fixPadding, 0),
                    child: Image.asset(
                      item['image'],
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['category'],
                          style: black18BoldTextStyle,
                        ),
                        Text(
                          item['products'],
                          maxLines: 3,
                          style: grey14RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
