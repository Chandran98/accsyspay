import 'package:Accsys_Pay/MainApp/utils/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../pages/screens.dart';
import '../../constant/colors/colors.dart';
import '../main_screen.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<FaqModal> _faqList = [
    FaqModal(
        title: "What is Accsys pay.",
        subtitle:
            "Accsys pay is a utility payment, where you can get secure seamless service. Using Accsys voucher you can redeem your Accsys to INR"),
    FaqModal(
        title:
            "The merchant transaction failed but the payment was not updated.",
        subtitle:
            "The issue will be resolved within 5 business days (usually within hours) from the date of payment initiation. During this period, money will be transferred  to your bank account. Check your bank statement to verify the same."),
    FaqModal(
        title:
            "The transaction failed but the amount got deducted from the bank account.",
        subtitle:
            "Banks usually take up to 3 business days to add money back to your account. Please wait for your bank to complete the reversal. Refer to the bank account statement to verify if your transaction has been reversed."),
    FaqModal(
        title:
            "The bill payment transaction is settled/processing but the payment was not updated. ",
        subtitle:
            "How many days it might take for the money to reach the biller. After the stated number of days, check with your biller to confirm that the money has been paid."),
    FaqModal(
        title: "How can i get voucher?",
        subtitle:
            "You can generate your Accsys voucher in Accsys staking app. Please install Accsys staking app and generate your voucher "),
    FaqModal(
        title: "Why can't I redeem my Accsys voucher?",
        subtitle:
            "Please check you are entering valid voucher code. Check the voucher has balance or not. If everything is in your way, please raise ticket to support.  "),
    FaqModal(
        title: "How can I resolve issues with failed  transactions?",
        subtitle:
            "If transactions are failing, check internet connection, verify details, check balance, check transaction limit, contact bank, try again later, check with UPI provider. Keep the bank and UPI app  teams informed for further investigation."),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            title: const Text("FAQ"),
            actions: [
              Image.asset(
                "assets/images/logo/vl.png",
                scale: 6,
              )
            ],
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: white,
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _faqList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: ExpansionTile(
                        iconColor: PrimaryColor,
                        textColor: PrimaryColor,
                        title: Text(_faqList[index].title,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, wordSpacing: 3)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: Text(_faqList[index].subtitle,
                                style: GoogleFonts.inter(wordSpacing: 3)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class FaqModal {
  String title, subtitle;
  FaqModal({this.subtitle, this.title});
}
