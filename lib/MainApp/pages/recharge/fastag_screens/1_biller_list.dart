import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/constant/data_constant.dart';
import 'package:Accsys_Pay/MainApp/provider/themeprovider.dart';
import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/main_app_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../pages/screens.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/shimmer_List.dart';
import '../../utiltiy/3_bills_fetch_details.dart';
import '2_biller_screen.dart';

class FastagBillerScreen extends StatefulWidget {
  FastagBillerScreen({Key key, this.id, this.title}) : super(key: key);
  String id;
  String title;

  @override
  State<FastagBillerScreen> createState() => _FastagBillerScreenState();
}

class _FastagBillerScreenState extends State<FastagBillerScreen> {
  TextEditingController _textcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textcontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UtilityProvider>(context);
    // var provider = Provider.of<MyAPIService>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor:
              theme.darkTheme ? appColor.withOpacity(0.1) : Colors.white,
          // appBar: AppBar(
          //   title: Text(
          //     widget.title,
          //     // style: const TextStyle(color: black),
          //   ),
          //   backgroundColor: PrimaryColor,
          //   iconTheme: const IconThemeData(color: white),
          // ),
          body: Column(
            children: [
              CustomAppBar(
                title: widget.title,
              ),
              spacer20Height,
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1.2,
                              blurRadius: 1.2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: InkWell(
                                  onTap: () {
                                    provider.search(
                                        _textcontroller.text.toLowerCase());
                                  },
                                  child: TextFormField(
                                    // onSaved:  (val) {
                                    //   if(val.length > 0){
                                    //     _provider.searchItems(val);
                                    //   }
                                    //   else {
                                    //     _provider.getAll();
                                    //   }
                                    // },
                                    decoration: const InputDecoration(
                                        hintText: "Search...",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    controller: _textcontroller,
                                    style: const TextStyle(color: black),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color: PrimaryColor,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomRight:
                                                  Radius.circular(25))),
                                      child: Center(
                                          child: Text(
                                        "submit",
                                        style: GoogleFonts.inter(color: white),
                                      ))),
                                  onTap: () {
                                    // provider.search(_textcontroller.text);
                                    provider.search(_textcontroller.text);
                                  },
                                )),
                          ],
                        )),
                  ),
                ),
              ),
              spacer20Height,
              Expanded(
                flex: 5,
                child: Container(
                  child: provider.loading
                      ? const ServicewidgetShimmerList()
                      : ListView.separated(
                          itemCount: provider.searchedbillers.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = provider.searchedbillers[index];

                            return InkWell(
                                onTap: () {
                                  _textcontroller.clear();
                                  provider.getBillerParams(
                                      data.billerId, context);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => FastagFetchScreen(
                                              name: data.billerName,
                                              id: data.billerId,
                                              mode: data.billerMode)));
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
                                          data.billerName[0],
                                          style: GoogleFonts.inter(
                                              color: white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                      ),
                                      title: Text(
                                        data.billerName,
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
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
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.0),
                              child: Divider(),
                            );
                          },
                        ),
                ),
              ),
            ],
          )),
    );
  }
}
