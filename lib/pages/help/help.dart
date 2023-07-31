import 'package:Accsys_Pay/pages/screens.dart';
import 'package:Accsys_Pay/widget/column_builder.dart';

import '../../MainApp/constant/constant.dart';

class Help extends StatelessWidget {
  Help({Key key}) : super(key: key);

  final topicList = [
    {'topic': 'How to book?'},
    {'topic': 'How to pay?'},
    {'topic': 'How to cancel booking?'},
    {'topic': 'How to complain about service?'},
    {'topic': 'What is service charge?'},
    {'topic': 'How to verify mobile number?'},
    {'topic': 'How to cancel and get back a refund for my flight booking?'},
    {'topic': 'How to purchase extra baggage?'},
    {'topic': 'How to reschedule my flight booking?'},
    {'topic': 'How to complain about service?'},
    {'topic': 'What is service charge?'},
    {'topic': 'How to verify mobile number?'},
    {'topic': 'How to book?'},
    {'topic': 'How to pay?'},
    {'topic': 'How to cancel booking?'},
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
          'Help',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          searchTextField(),
          topics(),
        ],
      ),
    );
  }

  searchTextField() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
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
        child: TextField(
          cursorColor: PrimaryColor,
          style: black18SemiBoldTextStyle,
          decoration: InputDecoration(
            hintText: 'Search for your answer here...',
            hintStyle: grey14SemiBoldTextStyle,
            prefixIcon: const Icon(
              Icons.search,
              color: greyColor,
              size: 15,
            ),
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  topics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Popular Topics',
            style: black18BoldTextStyle,
          ),
        ),
        heightSpace,
        ColumnBuilder(
          itemCount: topicList.length,
          itemBuilder: (context, index) {
            final item = topicList[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: HelpDetail(topic: item['topic']),
                  type: PageTransitionType.rightToLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2.0,
                  vertical: 6,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['topic'],
                        overflow: TextOverflow.fade,
                        style: black16SemiBoldTextStyle,
                      ),
                    ),
                    Container(
                      width: 40,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: blackColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
