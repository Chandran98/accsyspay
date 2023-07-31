import 'package:Accsys_Pay/pages/screens.dart';
import 'package:intl/intl.dart';

class SendMoney extends StatefulWidget {
  final String name;
  final String mobileNumber;
  const SendMoney({Key key, this.name, this.mobileNumber = '9925789632'})
      : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final messageController = TextEditingController();
  String _currentAmount;
  String currentDate = DateFormat('yMd').format(DateTime.now());

  final messageList = [
    {
      'image': 'assets/users/user1.png',
      'amount': '\$35.00',
      'time': '8:27 pm',
      'date': '13 Jan 2021',
      'transfer': true,
      'isMe': true,
    },
    {
      'image': 'assets/users/user3.png',
      'amount': '\$35.00',
      'time': '8:27 pm',
      'date': '13 Jan 2021',
      'transfer': true,
      'isMe': false,
    },
    {
      'image': 'assets/users/user1.png',
      'amount': '\$105.00',
      'time': '8:27 pm',
      'date': '12 Jan 2021',
      'transfer': false,
      'isMe': true,
    },
    {
      'image': 'assets/users/user3.png',
      'amount': '\$105.00',
      'time': '8:27 pm',
      'date': '12 Jan 2021',
      'transfer': false,
      'isMe': false,
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
        title: Row(
          children: [
            Container(
              height: 30,
              width: 30,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: black14BoldTextStyle,
                ),
                Text(
                  widget.mobileNumber,
                  style: grey12SemiBoldTextStyle,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          messagesList(),
          textField(),
        ],
      ),
    );
  }

  messagesList() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final item = messageList[index];
          return Padding(
            padding: const EdgeInsets.only(top: fixPadding * 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: item['isMe']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                item['isMe']
                    ? Container()
                    : Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(right: fixPadding),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Container(
                  width: MediaQuery.of(context).size.width - 200,
                  padding: const EdgeInsets.fromLTRB(
                    fixPadding,
                    fixPadding,
                    fixPadding,
                    fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        item['isMe'] ? whiteColor : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: item['isMe']
                            ? blackColor.withOpacity(0.1)
                            : greyColor.withOpacity(0.1),
                        spreadRadius: 1.2,
                        blurRadius: 1.2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['amount'],
                        style: black20BoldTextStyle,
                      ),
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              item['transfer']
                                  ? const Icon(
                                      Icons.check_circle_outline,
                                      color: greenColor,
                                      size: 16,
                                    )
                                  : const Icon(
                                      Icons.error_outline,
                                      color: redColor,
                                      size: 16,
                                    ),
                              widthSpace,
                              Text(
                                item['transfer']
                                    ? item['isMe']
                                        ? 'Sent Securely'
                                        : 'Received Instantly'
                                    : 'Failed',
                                style: black16SemiBoldTextStyle,
                              ),
                            ],
                          ),
                          item['transfer']
                              ? const Icon(
                                  Icons.arrow_forward_ios,
                                  color: blackColor,
                                  size: 10,
                                )
                              : Container(),
                        ],
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${item['date']}, ${item['time'].toString()}',
                            style: grey12SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                item['isMe']
                    ? Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(left: fixPadding),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  textField() {
    var mes = {
      'image': 'assets/users/user1.png',
      'amount': _currentAmount,
      'time': DateFormat.jm().format(DateTime.now()),
      'date': DateFormat('d MMM y').format(DateTime.now()),
      'transfer': false,
      'isMe': true,
    };
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: fixPadding),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.1),
                    spreadRadius: 1.2,
                    blurRadius: 1.2,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _currentAmount = value;
                  });
                },
                controller: messageController,
                cursorColor: PrimaryColor,
                style: black14SemiBoldTextStyle,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    top: fixPadding * 1.5,
                    left: fixPadding * 1.5,
                  ),
                  hintText: 'Enter amount or say something',
                  hintStyle: grey14RegularTextStyle,
                  suffixIcon: InkWell(
                    onTap: () {
                      messageController.clear();
                      setState(() {
                        messageList.add(mes);
                      });
                    },
                    child: const Icon(
                      Icons.send_outlined,
                      size: 15,
                      color: greyColor,
                    ),
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () => Navigator.push(
              context,
              PageTransition(
                child: const TransactionSuccessful(),
                type: PageTransitionType.rightToLeft,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding * 3,
                vertical: fixPadding,
              ),
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: PrimaryColor.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Text(
                'Pay',
                style: white22BoldTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
