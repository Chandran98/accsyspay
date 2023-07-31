import 'package:Accsys_Pay/pages/screens.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String product;
  final String amount;
  const ProductDetails({Key key, this.image, this.product, this.amount})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedSize = 'M';
  Color selectedColor = whiteColor;
  int qty = 1;

  final sizeList = [
    {'size': 'X'},
    {'size': 'XS'},
    {'size': 'M'},
    {'size': 'L'},
    {'size': 'XL'},
  ];

  final colorList = [
    {'color': whiteColor},
    {'color': const Color(0xff66BB6A)},
    {'color': const Color(0xff26C6DA)},
    {'color': const Color(0xff8D6E63)},
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
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          productDetail(),
          heightSpace,
          heightSpace,
          selectSize(),
          heightSpace,
          heightSpace,
          heightSpace,
          selectColor(),
          heightSpace,
          heightSpace,
          heightSpace,
          selectQuantity(),
          heightSpace,
          heightSpace,
          heightSpace,
          description(),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            children: [
              addToCartButton(),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              buyNowButton(),
            ],
          ),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  productDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            widget.image,
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'NAUTICA',
          style: grey18SemiBoldTextStyle,
        ),
        Text(
          widget.product,
          style: black18SemiBoldTextStyle,
        ),
      ],
    );
  }

  selectSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Size',
          style: black16RegularTextStyle,
        ),
        heightSpace,
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizeList.length,
            itemBuilder: (context, index) {
              final item = sizeList[index];
              return Padding(
                padding: const EdgeInsets.only(right: fixPadding),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    setState(() {
                      selectedSize = item['size'];
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSize == item['size']
                          ? orangeColor
                          : greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item['size'],
                      style: selectedSize == item['size']
                          ? white18ExtraBoldTextStyle
                          : black18ExtraBoldTextStyle,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  selectColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Color',
          style: black16RegularTextStyle,
        ),
        heightSpace,
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorList.length,
            itemBuilder: (context, index) {
              final item = colorList[index];
              return Padding(
                padding: const EdgeInsets.only(right: fixPadding),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    setState(() {
                      selectedColor = item['color'];
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item['color'],
                      border: Border.all(
                        color: selectedColor == item['color']
                            ? orangeColor
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.1),
                          spreadRadius: 1.2,
                          blurRadius: 1.2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  selectQuantity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Quantity',
          style: black16RegularTextStyle,
        ),
        heightSpace,
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  qty = qty == 0 ? 0 : qty - 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(color: greyColor.withOpacity(0.4)),
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
                  qty++;
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
        ),
      ],
    );
  }

  description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Description',
          style: black16RegularTextStyle,
        ),
        heightSpace,
        Text(
          'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
          style: grey14RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Center(
          child: Text(
            widget.amount,
            style: black18BoldTextStyle,
          ),
        ),
      ],
    );
  }

  addToCartButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: const MyCart(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          alignment: Alignment.center,
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
          child: Text(
            'Add to Cart',
            style: PrimaryColor20BoldTextStyle,
          ),
        ),
      ),
    );
  }

  buyNowButton() {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: const Checkout(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
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
            'Buy Now',
            style: white20BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
