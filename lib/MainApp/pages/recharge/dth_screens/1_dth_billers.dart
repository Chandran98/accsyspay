import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/constant/data_constant.dart';
import 'package:Accsys_Pay/MainApp/pages/recharge/dth_screens/2_dth_bill_details.dart';
import 'package:Accsys_Pay/MainApp/pages/utiltiy/3_bills_fetch_details.dart';
import 'package:Accsys_Pay/MainApp/provider/dth_provider.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/app_bar.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:Accsys_Pay/MainApp/utils/shimmer_List.dart';
import 'package:provider/provider.dart';
import '../../../../pages/screens.dart';

class DthBillerScreen extends StatefulWidget {
  DthBillerScreen({Key key, this.id, this.title}) : super(key: key);
  String id;
  String title;

  @override
  State<DthBillerScreen> createState() => _DthBillerScreenState();
}

class _DthBillerScreenState extends State<DthBillerScreen> {
  TextEditingController _textcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textcontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DthProvider>(context);
    // var provider = Provider.of<MyAPIService>(context);
    var theme = Provider.of<ThemeProvider>(context);

    var dthProvider = Provider.of<DthProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor:
              theme.darkTheme ? appColor.withOpacity(0.1) : Colors.white,
          body: Column(
            children: [
              CustomAppBar(
                title: widget.title,
              ),
              spacer20Height,
              // SizedBox(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 20.0,
              //     ),
              //     child: InkWell(
              //       borderRadius: BorderRadius.circular(5),
              //       onTap: () {},
              //       child: Container(
              //           height: 48,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(25),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(0.1),
              //                 spreadRadius: 1.2,
              //                 blurRadius: 1.2,
              //               ),
              //             ],
              //           ),
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 flex: 3,
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 28.0),
              //                   child: InkWell(
              //                     onTap: () {
              //                       provider.search(_textcontroller.text);
              //                     },
              //                     child: TextFormField(
              //                       // onSaved:  (val) {
              //                       //   if(val.length > 0){
              //                       //     _provider.searchItems(val);
              //                       //   }
              //                       //   else {
              //                       //     _provider.getAll();
              //                       //   }
              //                       // },
              //                       decoration: const InputDecoration(
              //                           hintText: "Search...",
              //                           hintStyle:
              //                               TextStyle(color: Colors.grey),
              //                           border: InputBorder.none),
              //                       controller: _textcontroller,
              //                       style: const TextStyle(color: black),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                   flex: 1,
              //                   child: InkWell(
              //                     child: Container(
              //                         decoration: const BoxDecoration(
              //                             color: PrimaryColor,
              //                             borderRadius: BorderRadius.only(
              //                                 topRight: Radius.circular(25),
              //                                 bottomRight:
              //                                     Radius.circular(25))),
              //                         child: const Center(
              //                             child: Text(
              //                           "submit",
              //                           style: TextStyle(color: white),
              //                         ))),
              //                     onTap: () {
              //                       // provider.search(_textcontroller.text);
              //                       provider.search(_textcontroller.text);
              //                     },
              //                   )),
              //             ],
              //           )),
              //     ),
              //   ),
              // ),
              spacer20Height,
              Expanded(
                  flex: 5,
                  child: FutureBuilder<List<DTHOperator>>(
                      future: dthProvider.getAllDTHOperators(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const ServicewidgetShimmerList();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final List<DTHOperator> operators = snapshot.data;

                          return ListView.separated(
                            itemCount: operators.length,
                            itemBuilder: (context, index) {
                              final DTHOperator operator = operators[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                DthBillDetailsScreen(
                                                  name: operator.name,
                                                  id: operator.id.toString(),
                                                )));
                                  },
                                  child: Container(
                                    decoration: boxDecoration(
                                      radius: 10,
                                      showShadow: true,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 8, left: 8),
                                      child: ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Sticky.getColorItem()),
                                          child: Center(
                                              child: Text(
                                            operator.name[0],
                                            style: const TextStyle(
                                                color: white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          )),
                                        ),
                                        title: Text(
                                          operator.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: ListTile(
                                  //     title: Text(datas.billerName),
                                  //   ),
                                  // ),
                                  );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                child: Divider(),
                              );
                            },
                          );
                        }
                      }))
            ],
          )),
    );
  }
}
