import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final todaysNotificationList = [
    {
      'notification': 'Electicity bill for the month of August is \$125/-',
      'time': '10:55 am',
    },
    {
      'notification': 'Amount send to CNIC has collected',
      'time': '10:45 am',
    },
    {
      'notification': 'You have received \$200 cashback added in your wallet',
      'time': '10:00 am',
    },
  ];

  final yesterdaysNotificationList = [
    {
      'notification':
          'Checkout the fashion collections you may like to see.Hurry!!',
      'time': '11:25 am',
    },
    {
      'notification': 'Get 25% cashback on first electricity bill payment.',
      'time': '10:55 am',
    },
    {
      'notification': 'Verify your phone number before booking a train ticket.',
      'time': '10:45 am',
    },
    {
      'notification': 'Your booking for AC bus from NY to KY is confirmed.',
      'time': '10:40 am',
    },
    {
      'notification':
          'Trx ID 123654789012. You receivedd \$150.00 from SCB in your Digital Payment account fee for this transaction is \$0.00.You new Digital Payment account balance is \$150.00',
      'time': '11:25 am',
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
          'Notifications',
          style: black20BoldTextStyle,
        ),
      ),
      body: todaysNotificationList.isEmpty && yesterdaysNotificationList.isEmpty
          ? emptyList()
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                todaysNotificationList.isEmpty
                    ? Container(
                        padding: const EdgeInsets.only(top: fixPadding * 2.0),
                      )
                    : todaysNotification(),
                yesterdaysNotificationList.isEmpty
                    ? Container()
                    : yesterdaysNotification(),
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
            'assets/icons/notification_off.png',
            color: greyColor,
            height: 50,
            width: 50,
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'No new notifications',
          style: grey18SemiBoldTextStyle,
        ),
      ],
    );
  }

  todaysNotification() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today 25 August 2021',
            style: orange16SemiBoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: todaysNotificationList.length,
            itemBuilder: (context, index) {
              final item = todaysNotificationList[index];
              return Dismissible(
                key: Key('$item'),
                background: Container(
                    margin: EdgeInsets.only(
                        top: index == 0 ? fixPadding * 1.5 : fixPadding),
                    color: PrimaryColor),
                onDismissed: (direction) {
                  setState(() {
                    todaysNotificationList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${item['notification']} dismissed")));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? fixPadding * 1.5 : fixPadding),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
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
                          item['notification'],
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                          style: black14RegularTextStyle,
                        ),
                        Text(
                          item['time'],
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  yesterdaysNotification() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yesterday 24 August 2021',
            style: orange16SemiBoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: yesterdaysNotificationList.length,
            itemBuilder: (context, index) {
              final item = yesterdaysNotificationList[index];
              return Dismissible(
                key: Key('$item'),
                background: Container(
                    margin: EdgeInsets.only(
                        top: index == 0 ? fixPadding * 1.5 : fixPadding),
                    color: PrimaryColor),
                onDismissed: (direction) {
                  setState(() {
                    yesterdaysNotificationList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${item['notification']} dismissed")));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? fixPadding * 1.5 : fixPadding),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
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
                          item['notification'],
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                          style: black14RegularTextStyle,
                        ),
                        Text(
                          item['time'],
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
