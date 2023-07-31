import 'package:Accsys_Pay/pages/screens.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../MainApp/constant/constant.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final favoriteList = [
    {
      'image': 'assets/products/product7.png',
      'product': 'Solid women round neck white T-Shirt',
      'amount': '\$100',
    },
    {
      'image': 'assets/products/product8.png',
      'product': 'Solid women round neck black T-Shirt',
      'amount': '\$99',
    },
    {
      'image': 'assets/products/product12.png',
      'product': 'Solid women round neck green T-Shirt',
      'amount': '\$100',
    },
    {
      'image': 'assets/products/product11.png',
      'product': 'Casual regular sleeves Tie & Dye',
      'amount': '\$150',
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
          'Favorites',
          style: black20BoldTextStyle,
        ),
      ),
      body: favoriteList.isEmpty ? emptyList() : favoritesList(),
    );
  }

  emptyList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/icons/heart.png',
            color: greyColor,
            height: 36,
            width: 36,
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'No items in favorite',
          style: grey18SemiBoldTextStyle,
        ),
      ],
    );
  }

  favoritesList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        final item = favoriteList[index];
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? fixPadding * 2.0 : 0,
                bottom: fixPadding,
              ),
              child: IconSlideAction(
                color: redColor,
                icon: Icons.delete_outline,
                foregroundColor: whiteColor,
                onTap: () {
                  setState(() {
                    favoriteList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item Remove From Favorite List.'),
                  ));
                },
              ),
            ),
          ],
          child: Padding(
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
                      padding: const EdgeInsets.fromLTRB(7, 3, 5, 0),
                      child: Image.asset(
                        item['image'],
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.14,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['product'],
                              style: black16SemiBoldTextStyle,
                            ),
                            Text(
                              item['amount'],
                              style: black16BoldTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
