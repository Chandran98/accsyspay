import 'package:Accsys_Pay/pages/screens.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({Key key}) : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final productList = [
    {
      'image': 'assets/products/product7.png',
      'product': 'Solid women round neck white T-Shirt',
      'amount': '\$100',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product8.png',
      'product': 'Solid women round neck black T-Shirt',
      'amount': '\$99',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product9.png',
      'product': 'Casual cutout solid women red T-Shirt',
      'amount': '\$149',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product10.png',
      'product': 'Casual full sleeves black T-Shirt',
      'amount': '\$110',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product11.png',
      'product': 'Casual regular sleeves Tie & Dye',
      'amount': '\$99',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product12.png',
      'product': 'Solid women round neck green T-Shirt',
      'amount': '\$100',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product7.png',
      'product': 'Solid women round neck white T-Shirt',
      'amount': '\$100',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product8.png',
      'product': 'Solid women round neck black T-Shirt',
      'amount': '\$99',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product9.png',
      'product': 'Casual cutout solid women red T-Shirt',
      'amount': '\$149',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product10.png',
      'product': 'Casual full sleeves black T-Shirt',
      'amount': '\$110',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product11.png',
      'product': 'Casual regular sleeves Tie & Dye',
      'amount': '\$99',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product12.png',
      'product': 'Solid women round neck green T-Shirt',
      'amount': '\$100',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product7.png',
      'product': 'Solid women round neck white T-Shirt',
      'amount': '\$100',
      'isFavorite': true,
    },
    {
      'image': 'assets/products/product8.png',
      'product': 'Solid women round neck black T-Shirt',
      'amount': '\$99',
      'isFavorite': false,
    },
    {
      'image': 'assets/products/product9.png',
      'product': 'Casual cutout solid women red T-Shirt',
      'amount': '\$149',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Women\'s Clothing',
            style: black20BoldTextStyle,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
            indicatorColor: orangeColor,
            labelColor: orangeColor,
            unselectedLabelColor: greyColor,
            labelStyle: orange20SemiBoldTextStyle,
            unselectedLabelStyle: grey20SemiBoldTextStyle,
            tabs: const [
              Tab(text: 'Tops'),
              Tab(text: 'Sarees'),
              Tab(text: 'Dresses'),
              Tab(text: 'Jeans'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tops(),
            tops(),
            tops(),
            tops(),
          ],
        ),
      ),
    );
  }

  tops() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(fixPadding * 2.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final item = productList[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: ProductDetails(
                image: item['image'],
                product: item['product'],
                amount: item['amount'],
              ),
              type: PageTransitionType.rightToLeft,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: fixPadding / 2,
              horizontal: 2.2,
            ),
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
            child: Column(
              children: [
                Image.asset(
                  item['image'],
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.147,
                  width: MediaQuery.of(context).size.width * 0.235,
                ),
                const SizedBox(height: 6),
                Text(
                  item['product'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: black12SemiBoldTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['amount'],
                      style: black14BoldTextStyle,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          item['isFavorite'] = !item['isFavorite'];
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: item['isFavorite']
                              ? const Text('Item added to favorite')
                              : const Text('Item removed from favorite'),
                        ));
                      },
                      child: Icon(
                        item['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: greyColor,
                        size: 20,
                      ),
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
