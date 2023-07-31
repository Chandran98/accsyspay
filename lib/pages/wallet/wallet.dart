import 'package:Accsys_Pay/pages/screens.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final transactionList = [
    {
      'paid': 'Paid for order',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$35',
      'status': 'sent',
    },
    {
      'paid': 'Paid from friend',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '8:30pm',
      'amount': '\$100',
      'status': 'received',
    },
    {
      'paid': 'Paid from friend',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '8:00pm',
      'amount': '\$500',
      'status': 'received',
    },
    {
      'paid': 'Paid for moive ticket',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$500',
      'status': 'sent',
    },
    {
      'paid': 'Paid electricity bill',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$2,589',
      'status': 'sent',
    },
    {
      'paid': 'Paid for order',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$35',
      'status': 'sent',
    },
    {
      'paid': 'Paid from friend',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '8:30pm',
      'amount': '\$100',
      'status': 'received',
    },
    {
      'paid': 'Paid from friend',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '8:00pm',
      'amount': '\$500',
      'status': 'received',
    },
    {
      'paid': 'Paid for moive ticket',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$500',
      'status': 'sent',
    },
    {
      'paid': 'Paid electricity bill',
      'id': 'D123654789012365',
      'date': '5 May, 2020',
      'time': '9:00pm',
      'amount': '\$2,589',
      'status': 'sent',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: fixPadding * 5.0),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          toolbarHeight: 110,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Wallet',
                style: black20BoldTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: fixPadding,
                  top: fixPadding,
                ),
                child: Column(
                  children: [
                    Text(
                      'Digital Payment Wallet Balance',
                      style: grey18SemiBoldTextStyle,
                    ),
                    Text(
                      'Rs.5,945.00',
                      style: black25BoldTextStyle,
                    ),
                  ],
                ),
              ),
            ],
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
              Tab(text: 'All'),
              Tab(text: 'Received'),
              Tab(text: 'Sent'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            all(),
            received(),
            sent(),
          ],
        ),
      ),
    );
  }

  all() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: fixPadding * 2.0),
      physics: const BouncingScrollPhysics(),
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final item = transactionList[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: fixPadding / 2),
                child: Image.asset(
                  item['status'] == 'sent'
                      ? 'assets/icons/send_money.png'
                      : 'assets/icons/add_money.png',
                  height: 35,
                  width: 35,
                ),
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['paid'],
                      style: grey16RegularTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['id'],
                          style: black18BoldTextStyle,
                        ),
                        Text(
                          item['amount'],
                          style: item['status'] == 'sent'
                              ? red18BoldTextStyle
                              : green18BoldTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      '${item['date']} ${item['time']}',
                      style: grey14RegularTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  received() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: fixPadding * 2.0),
      physics: const BouncingScrollPhysics(),
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final item = transactionList[index];
        return item['status'] == 'sent'
            ? Container()
            : Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  0,
                  fixPadding * 2.0,
                  fixPadding,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: fixPadding / 2),
                      child: Image.asset(
                        'assets/icons/add_money.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['paid'],
                            style: grey16RegularTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['id'],
                                style: black18BoldTextStyle,
                              ),
                              Text(
                                item['amount'],
                                style: green18BoldTextStyle,
                              ),
                            ],
                          ),
                          Text(
                            '${item['date']} ${item['time']}',
                            style: grey14RegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  sent() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: fixPadding * 2.0),
      physics: const BouncingScrollPhysics(),
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final item = transactionList[index];
        return item['status'] == 'sent'
            ? Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  0,
                  fixPadding * 2.0,
                  fixPadding,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: fixPadding / 2),
                      child: Image.asset(
                        'assets/icons/send_money.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['paid'],
                            style: grey16RegularTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['id'],
                                style: black18BoldTextStyle,
                              ),
                              Text(
                                item['amount'],
                                style: red18BoldTextStyle,
                              ),
                            ],
                          ),
                          Text(
                            '${item['date']} ${item['time']}',
                            style: grey14RegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
