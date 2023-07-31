import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:Accsys_Pay/pages/screens.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key key}) : super(key: key);

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  int isSelected = 0;

  final addressTypeList = [
    {
      'image': 'assets/icons/home_address.png',
      'type': 'Home',
    },
    {
      'image': 'assets/icons/office_address.png',
      'type': 'Office',
    },
    {
      'image': 'assets/icons/other_address.png',
      'type': 'Other',
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
          'Add New Address',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          nameTextField(),
          mobileNumberTextField(),
          pincodeTextField(),
          buildingTextField(),
          streetNameTextField(),
          addressType(),
          addButton(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  nameTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver To',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'e.g. Samantha John',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mobileNumberTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile Number',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
              keyboardType: TextInputType.phone,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'e.g. (+91) 1236547890',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  pincodeTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pincode',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
              keyboardType: TextInputType.number,
              cursorColor: PrimaryColor,
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'e.g. 123654',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildingTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'House Number and Building',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'e.g. Oberoi Heights',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  streetNameTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Street Name',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          Container(
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
              style: black18SemiBoldTextStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: fixPadding * 2.0),
                hintStyle: grey16RegularTextStyle,
                hintText: 'e.g. Back Street',
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  addressType() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 3.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address Type',
            style: black18SemiBoldTextStyle,
          ),
          heightSpace,
          SizedBox(
            height: 50,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: addressTypeList.length,
              itemBuilder: (context, index) {
                final item = addressTypeList[index];
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : fixPadding),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 1.68),
                      decoration: BoxDecoration(
                        color: isSelected == index ? orangeColor : whiteColor,
                        border: Border.all(
                          color: isSelected == index ? orangeColor : greyColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: isSelected == index
                            ? [
                                BoxShadow(
                                  color: orangeColor.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ]
                            : [],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image'],
                            height: 25,
                            width: 25,
                          ),
                          widthSpace,
                          Text(
                            item['type'],
                            style: isSelected == index
                                ? white16SemiBoldTextStyle
                                : black16SemiBoldTextStyle,
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
      ),
    );
  }

  addButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => Navigator.pop(context),
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
              'Add',
              style: white22BoldTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
