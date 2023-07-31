import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../provider/wallet_provider.dart';
import '../../../pages/screens.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../main_app_utils.dart';

class TransactionChart extends StatefulWidget {
  const TransactionChart({Key key}) : super(key: key);

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  @override
  void initState() {
    Provider.of<WalletProvider>(context, listen: false).postWalletHistory();
    Provider.of<WalletProvider>(context, listen: false).walletBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var walletProvider = Provider.of<WalletProvider>(context, listen: false);
    final List<TransactionFlow> chartData = [
      TransactionFlow('Income', walletProvider.totalInflowAmount.toString(),
          Color(0xFF074aa1)),
      TransactionFlow(
          'Expense', walletProvider.totalOutflowAmount.toString(), appColor),
    ];
    print(walletProvider.totalInflowAmount);
    print(walletProvider.totalOutflowAmount);
    return Column(
      children: [
        Container(
          height: 140,
          width: 150,
          child: SfCircularChart(
            margin: EdgeInsets.all(0),
            // title:
            //     ChartTitle(text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
            // legend:
            //     Legend(isVisible: true, overflowMode: LegendItem OverflowMode.wrap),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries>[
              DoughnutSeries<TransactionFlow, String>(
                dataSource: chartData,
                xValueMapper: (walletProvider, _) => walletProvider.title,
                yValueMapper: (walletProvider, _) =>
                    walletProvider.amount.toInt(),
                pointColorMapper: (data, _) => data.color,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TransactionFlow {
  TransactionFlow(this.title, this.amount, this.color);
  final String title, amount;
  final Color color;
}
