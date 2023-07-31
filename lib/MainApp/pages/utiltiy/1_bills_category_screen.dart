import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:provider/provider.dart';

import '../../../pages/screens.dart';
import '2_service_provider_screen.dart';

class UtilityCategoryScreen extends StatefulWidget {
  const UtilityCategoryScreen({Key key}) : super(key: key);

  @override
  State<UtilityCategoryScreen> createState() => _UtilityCategoryScreenState();
}

class _UtilityCategoryScreenState extends State<UtilityCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Bills Category",
            style: TextStyle(color: blackColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Categorytile(
                title: "LPG GAS",
                id: "0",
              ),
              Categorytile(
                title: "GAS",
                id: "2",
              ),
              Categorytile(
                title: "Electricity",
                id: "3",
              ),
              Categorytile(
                title: "DTH",
                id: "4",
              ),
              Categorytile(
                title: "Landline Postpaid",
                id: "5",
              ),
              Categorytile(
                title: "Mobile Postpaid",
                id: "6",
              ),
              Categorytile(
                title: "Broadband Postpaid",
                id: "7",
              ),
              Categorytile(
                title: "Broadband Prepaid",
                id: "8",
              ),
              Categorytile(
                title: "Water",
                id: "9",
              ),
              Categorytile(
                title: "Life Insurance",
                id: "11",
              ),
              Categorytile(
                title: "Fastag",
                id: "12",
              ),
              Categorytile(
                title: "Health Insurance",
                id: "14",
              ),
              Categorytile(
                title: "Municipal Taxes",
                id: "16",
              ),
              Categorytile(
                title: "Insurance",
                id: "19",
              ),
              Categorytile(
                title: "Cable TV",
                id: "13",
              ),
            ],
          ),
        ));
  }
}

class Categorytile extends StatelessWidget {
  Categorytile({Key key, this.title, this.id}) : super(key: key);
  String title;
  String id;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UtilityProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            print(id);
            
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => (BillerScreen(id: id, title: title))));

              provider.fetchBillers(id);
              provider.getCharges();
            
          },
          child: ListTile(
            tileColor: Colors.grey.shade100,
            title: Text(title),
            subtitle: Text(id),
          )),
    );
  }
}
