import 'package:Accsys_Pay/pages/screens.dart';

class QuickRechargesAndBillPays extends StatelessWidget {
  QuickRechargesAndBillPays({Key key}) : super(key: key);

  final rechargeList = [
    {
      'image': 'assets/icons/recharge.png',
      'name': 'Mobile Recharge',
    },
    {
      'image': 'assets/icons/fastag.png',
      'name': 'FASTag Recharge',
    },
    {
      'image': 'assets/icons/dth.png',
      'name': 'DTH',
    },
    {
      'image': 'assets/icons/cableTV.png',
      'name': 'Cable TV Recharge',
    },
  ];

  final utilitiesList = [
    {
      'image': 'assets/icons/cylinder.png',
      'name': 'Book a Cylinder',
    },
    {
      'image': 'assets/icons/piped_gas.png',
      'name': 'Piped Gas',
    },
    {
      'image': 'assets/icons/water.png',
      'name': 'Water',
    },
    {
      'image': 'assets/icons/electricity.png',
      'name': 'Electricity',
    },
    {
      'image': 'assets/icons/postpaid.png',
      'name': 'Postpaid',
    },
    {
      'image': 'assets/icons/broadband.png',
      'name': 'Broadband',
    },
    {
      'image': 'assets/icons/rent_payment.png',
      'name': 'Rent Payment',
    },
    {
      'image': 'assets/icons/landline.png',
      'name': 'Landline',
    },
  ];

  final creditCardBillList = [
    {
      'image': 'assets/icons/sbi_card.png',
      'name': 'SBI Card (Instant)',
    },
    {
      'image': 'assets/icons/hdfc.png',
      'name': 'HDFC Bank (Instant)',
    },
    {
      'image': 'assets/icons/icici.png',
      'name': 'ICICI Bank',
    },
    {
      'image': 'assets/icons/other_bank.png',
      'name': 'Other Banks',
    },
  ];

  final servicesAndTaxList = [
    {
      'image': 'assets/icons/loan_payment.png',
      'name': 'Loan Payment',
    },
    {
      'image': 'assets/icons/insurance.png',
      'name': 'LIC Insurance',
    },
    {
      'image': 'assets/icons/tax.png',
      'name': 'Municipal Tax',
    },
    {
      'image': 'assets/icons/education_fees.png',
      'name': 'Education Fees',
    },
  ];

  final ticketsList = [
    {
      'image': 'assets/icons/flight_ticket.png',
      'name': 'Flight Ticket',
    },
    {
      'image': 'assets/icons/bus_ticket.png',
      'name': 'Bus Ticket',
    },
    {
      'image': 'assets/icons/moive_ticket.png',
      'name': 'Moive Ticket',
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
          'Quick Recharges & Bill Pays',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          rechargesAndBillPays(),
          utilities(),
          creditCardBill(),
          servicesAndTax(),
          tickets(),
        ],
      ),
    );
  }

  rechargesAndBillPays() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recharge',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 75,
            ),
            itemCount: rechargeList.length,
            itemBuilder: (context, index) {
              final item = rechargeList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: const MobileRecharge(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      item['image'],
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: black12SemiBoldTextStyle,
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

  utilities() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Utilities',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 60,
              mainAxisSpacing: 10,
            ),
            itemCount: utilitiesList.length,
            itemBuilder: (context, index) {
              final item = utilitiesList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image'],
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            item['name'],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: black12SemiBoldTextStyle,
                          ),
                        ],
                      ),
                    ),
                    item['name'] == 'Rent Payment'
                        ? Positioned(
                            right: 15,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: whiteColor, width: 1.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: blackColor.withOpacity(0.1),
                                    spreadRadius: 1.2,
                                    blurRadius: 1.2,
                                  ),
                                ],
                              ),
                              child: Text(
                                'NEW',
                                style: white6BlackTextStyle,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  creditCardBill() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 1.5,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Card Bill Payments',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 75,
            ),
            itemCount: creditCardBillList.length,
            itemBuilder: (context, index) {
              final item = creditCardBillList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      item['image'],
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: black12SemiBoldTextStyle,
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

  servicesAndTax() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Financial Services & Taxes',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 60,
            ),
            itemCount: servicesAndTaxList.length,
            itemBuilder: (context, index) {
              final item = servicesAndTaxList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: ElectricityBillPayment(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      item['image'],
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: black12SemiBoldTextStyle,
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

  tickets() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book a Tickets',
            style: black18BoldTextStyle,
          ),
          heightSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 60,
            ),
            itemCount: ticketsList.length,
            itemBuilder: (context, index) {
              final item = ticketsList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: TicketsBooking(currentValue: index),
                    type: PageTransitionType.rightToLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      item['image'],
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item['name'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: black12SemiBoldTextStyle,
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
