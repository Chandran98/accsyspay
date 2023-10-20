import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../pages/screens.dart';
import '../../provider/themeprovider.dart';
import '../../provider/utilty_provider.dart';
import '../../utils/main_app_utils.dart';
import '../setting_screen/faq_screen.dart';

class UtilityFetchScreen extends StatefulWidget {
  UtilityFetchScreen({Key key, this.id, this.mode, this.name})
      : super(key: key);
  String id;
  String mode;
  String name;

  @override
  State<UtilityFetchScreen> createState() => _UtilityFetchScreenState();
}

class _UtilityFetchScreenState extends State<UtilityFetchScreen> {
  final _params2controller = TextEditingController();
  final _params3controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UtilityProvider>(context);

    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          iconTheme: const IconThemeData(color: white),
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 17),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FaqScreen()));
                },
                icon: const Icon(
                  Icons.info_outline,
                ))
          ],
        ),
        body: provider.loading
            ? const Center(
                child: CircularProgressIndicator(
                color: PrimaryColor,
              ))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomAppBar(
                      //   title: widget.name,
                      // ),
                      spacer30Height,
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: theme.darkTheme ? black : white,
                              border: Border.all(color: Colors.grey.shade300)),
                          // padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacer30Height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Biller ID",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(widget.id,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              spacer10Height,
                              Divider(
                                color: Colors.grey.shade500,
                              ),
                              // TabCard(
                              //   titletext: "Biller ID",
                              //   text: widget.id,
                              // ),
                              spacer20Height,
                              Text(
                                widget.mode,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              spacer10Height,
                              TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '********'),
                                controller: _params2controller,
                              ),
                              spacer20Height,
                              // Text(
                              //   provider.paramsModal.length == 2
                              //       ? provider.paramsModal[1].details[1].name
                              //       : "",
                              //   style: TextStyle(
                              //       fontSize: 12.sp,
                              //       fontWeight: FontWeight.w500),
                              // ),
                              // spacer10Height,
                              // provider.paramsModal.length == 2
                              //     ? TextFormField(
                              //         decoration: const InputDecoration(
                              //             border: OutlineInputBorder()),
                              //         controller: _params3controller,
                              //       )
                              //     : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 40),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          onTap: () {
                            provider.fetchAmountBiller(
                                widget.id,widget.mode,
                                // provider.paramsModal[0].details[0].name,
                                // provider.paramsModal.length == 2
                                //     ? provider.paramsModal[1].details[1].name
                                //     : "",
                                _params2controller.text,
                                // _params3controller.text,
                                context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 80,
                            padding: const EdgeInsets.all(fixPadding * 1.2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: PrimaryColor.withOpacity(0.4),
                              //     spreadRadius: 2,
                              //     blurRadius: 2,
                              //   ),
                              // ],
                            ),
                            child: provider.loading
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Proceed ',
                                    style: TextStyle(
                                        fontSize: 13.5.sp,
                                        color: white,
                                        fontWeight: FontWeight.w500),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
