import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final cartList = [
    {
      'image': 'assets/products/product7.png',
      'product': 'NAUTICA Solid Women Round Neck  White T-Shirt',
      'size': 'M',
      'color': 'White',
      'amount': '\$100',
      'qty': 1,
    },
    {
      'image': 'assets/products/product10.png',
      'product': 'NAUTICA Solid Women Round Neck  White T-Shirt',
      'size': 'M',
      'color': 'Black',
      'amount': '\$99',
      'qty': 1,
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
          'My Cart',
          style: black20BoldTextStyle,
        ),
      ),
      body: cartList.isEmpty
          ? emptyList()
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                products(),
                priceDetails(),
                checkoutButton(),
              ],
            ),
    );
  }

  emptyList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/icons/shopping_basket.png',
            color: greyColor,
            height: 50,
            width: 50,
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'No new product ',
          style: grey18SemiBoldTextStyle,
        ),
      ],
    );
  }

  products() {
    return ColumnBuilder(
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        final item = cartList[index];
        int qty = item['qty'];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 2.0 : 0,
            fixPadding * 2.0,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding * 1.5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      item['image'],
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['product'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: black16SemiBoldTextStyle,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Size : ${item['size']}',
                          style: grey14RegularTextStyle,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Color : ${item['color']}',
                          style: grey14RegularTextStyle,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item['amount'],
                          style: black16BoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              Row(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              qty = qty == 0 ? 0 : qty - 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.4)),
                            child: const Icon(
                              Icons.remove,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Text(
                          qty.toString(),
                          style: black14ExtraBoldTextStyle,
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        InkWell(
                          onTap: () {
                            setState(() {
                              qty = qty + 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2.5),
                            decoration: const BoxDecoration(color: orangeColor),
                            child: const Icon(
                              Icons.add,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  InkWell(
                    onTap: () {
                      setState(() {
                        cartList.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Item removed from cart'),
                      ));
                    },
                    child: Text(
                      'Remove',
                      style: PrimaryColor18BoldTextStyle,
                    ),
                  ),
                ],
              ),
              divider(),
            ],
          ),
        );
      },
    );
  }

  priceDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 3.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total(2 Items)',
                style: grey14RegularTextStyle,
              ),
              Text(
                '\$199',
                style: grey14RegularTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
                style: grey14RegularTextStyle,
              ),
              Text(
                'Free',
                style: grey14RegularTextStyle,
              ),
            ],
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount Payable',
                style: black16SemiBoldTextStyle,
              ),
              Text(
                '\$199',
                style: black16SemiBoldTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  checkoutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              child: const Checkout(),
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
              'Checkout',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
