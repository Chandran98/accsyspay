import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';
import 'package:provider/provider.dart';

import '../../MainApp/pages/wallet_history/all_wallet_screen.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location;

  final transactionList = [
    {
      'image': 'assets/users/user4.png',
      'name': 'Tina Shah',
      'amount': '\$35.00',
      'date': '17/10',
      'status': 'sent',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Tanay John',
      'amount': '\$150.00',
      'date': '17/10',
      'status': 'received',
    },
    {
      'image': 'assets/users/user3.png',
      'name': 'Isha Khatri',
      'amount': '\$150.00',
      'date': '17/10',
      'status': 'received',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // var customerId = Provider.of<AuthProvider>(context).userId;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(left: fixPadding * 2.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/users/user1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Location',
              style: black14SemiBoldTextStyle,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                elevation: 0,
                isDense: true,
                hint: Text(
                  "customerId",
                  style: black16BoldTextStyle,
                ),
                iconEnabledColor: blackColor,
                value: location,
                style: black16BoldTextStyle,
                onChanged: (String newValue) {
                  setState(() {
                    location = newValue;
                  });
                },
                items: <String>[
                  'Surat',
                  'Ahmedabad',
                  'Vadodara',
                  'Rajkot',
                  'Gandhinagar',
                  'Anand',
                  'Navsari',
                  'Surendranagar',
                  'Bharuch',
                  'Vapi',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                  child: const QRScan(),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
              icon: Image.asset(
                'assets/icons/scan.png',
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                  child: const Notifications(),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
              icon: Image.asset(
                'assets/icons/notification.png',
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: IconButton(
              padding: EdgeInsets.zero, onPressed: () {},
              // onPressed: () => Navigator.push(
              //   context,
              //   PageTransition(
              //     child: WalletHistoryScreen(),
              //     type: PageTransitionType.rightToLeft,
              //   ),
              // ),
              icon: Image.asset(
                'assets/icons/help_line.png',
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(),
          mainFeatures(),
          banner(),
          rechargesAndBillPays(),
          options(),
          recentTransaction(),
        ],
      ),
    );
  }

  searchTextField() {
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

  mainFeatures() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: const SendMoneyList(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/send_money.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  'Send Money',
                  style: black16BoldTextStyle,
                ),
              ],
            ),
          ),
          InkWell(
            // onTap: () => Navigator.push(
            //   context,
            //   PageTransition(
            //     child:  A(),
            //     type: PageTransitionType.rightToLeft,
            //   ),
            // ),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/add_money.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  'Add Money',
                  style: black16BoldTextStyle,
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: const Wallet(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 6,
                bottom: 6,
                left: 9,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Samantha John',
                    style: grey14RegularTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 1),
                          Text(
                            '012365478910',
                            style: black14BoldTextStyle,
                          ),
                          const SizedBox(height: 1),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Current Balance: ',
                                  style: black12SemiBoldTextStyle,
                                ),
                                TextSpan(
                                  text: '\$5,945',
                                  style: orange12ExtraBoldTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              'assets/banner_image1.png',
              height: 150,
              width: 200,
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
                  'Up to 20% cashback on bill payments every...',
                  style: white16BoldTextStyle,
                ),
                heightSpace,
                Text(
                  'Lorem Ipsum is simply dummy text of \nthe printing',
                  style: white14RegularTextStyle,
                ),
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
                    'Know More',
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

  rechargesAndBillPays() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Recharges & Bill Pays',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 70,
            ),
            children: [
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const MobileRecharge(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Recharge',
                image: 'assets/icons/recharge.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Electricity',
                image: 'assets/icons/electricity.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const TicketsBooking(currentValue: 0),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Flight Ticket',
                image: 'assets/icons/flight_ticket.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const TicketsBooking(currentValue: 2),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Moive Ticket',
                image: 'assets/icons/moive_ticket.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const TicketsBooking(currentValue: 1),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Bus Ticket',
                image: 'assets/icons/bus_ticket.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const MobileRecharge(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Payments',
                image: 'assets/icons/payments.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const MobileRecharge(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Money Transfer',
                image: 'assets/icons/money_transfer.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Landline',
                image: 'assets/icons/landline.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Broadband',
                image: 'assets/icons/broadband.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Piped Gas',
                image: 'assets/icons/piped_gas.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'Bill Payments',
                image: 'assets/icons/bill_payments.png',
              ),
              payment(
                ontap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: QuickRechargesAndBillPays(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                title: 'More',
                image: 'assets/icons/more.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  payment({Function ontap, String image, String title}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 35,
            width: 35,
          ),
          heightSpace,
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: black12SemiBoldTextStyle,
          ),
        ],
      ),
    );
  }

  options() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        children: [
          optionContainer(
            image: 'assets/icons/offers.png',
            title: 'Offers',
            ontap: () => Navigator.push(
              context,
              PageTransition(
                child: Offers(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          optionContainer(
            image: 'assets/icons/rewards.png',
            title: 'Rewards',
            ontap: () => Navigator.push(
              context,
              PageTransition(
                child: Rewards(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
          optionContainer(
            image: 'assets/icons/invite.png',
            title: 'Invite Now',
            ontap: () => Navigator.push(
              context,
              PageTransition(
                child: InviteFriends(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
          ),
        ],
      ),
    );
  }

  optionContainer({String image, String title, Function ontap}) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 3,
          ),
          decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 25,
                width: 25,
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: white16SemiBoldTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  recentTransaction() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: black18BoldTextStyle,
              ),
              Text(
                'View All',
                style: black14ExtraBoldTextStyle,
              ),
            ],
          ),
          ColumnBuilder(
            itemCount: transactionList.length,
            itemBuilder: (context, index) {
              final item = transactionList[index];
              return Padding(
                padding: const EdgeInsets.only(top: fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Text(
                          item['name'],
                          style: black16SemiBoldTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['amount'],
                          style: item['status'] == 'sent'
                              ? red14BoldTextStyle
                              : green14BoldTextStyle,
                        ),
                        Text(
                          item['date'],
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
