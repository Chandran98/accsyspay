import 'package:Accsys_Pay/pages/screens.dart';

class SendMoneyList extends StatelessWidget {
  const SendMoneyList({Key key}) : super(key: key);

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
          'Send Money',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(),
          recentTransaction(context),
        ],
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: SelectContact(),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.8),
          decoration: BoxDecoration(
            color: PrimaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: PrimaryColor.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: whiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  searchTextField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
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
        style: black14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: fixPadding * 1.5),
          hintText: 'Enter a mobile number or name',
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

  recentTransaction(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            child: const SendMoney(name: 'Krishna Shah'),
            type: PageTransitionType.rightToLeft,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(fixPadding),
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
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/users/user3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Krishna Shah',
                          style: black16SemiBoldTextStyle,
                        ),
                        Text(
                          '17/10/2021',
                          style: grey12SemiBoldTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$50.00 - Received Instantly',
                          style: grey14SemiBoldTextStyle,
                        ),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            color: greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
