// ignore_for_file: must_be_immutable

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../provider/utilty_provider.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/main_app_utils.dart';
import '../../setting_screen/faq_screen.dart';
import '/../../../pages/screens.dart';


class FastagFetchScreen extends StatefulWidget {
    String id;
  String mode;
  String name;
  FastagFetchScreen({Key key, this.id, this.mode, this.name})
      : super(key: key);


  @override
  State<FastagFetchScreen> createState() => _FastagFetchScreenState();
}

class _FastagFetchScreenState extends State<FastagFetchScreen> {
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
            widget.name,style: const TextStyle(fontSize: 17),
          ),actions: [IconButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => FaqScreen()));}, icon: const Icon(Icons.info_outline ,))],
        ),
        body: provider.loading
            ? const Center(child: CircularProgressIndicator(color: PrimaryColor,))
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                              color: theme.darkTheme?black: white,
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
                                  const Text(
                                    "Biller ID",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(widget.id,
                                      style: const TextStyle(
                                          fontSize: 16,
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
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
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
                              //   style: const TextStyle(
                              //       fontSize: 16, fontWeight: FontWeight.w500),
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
                      ),spacer50Height,
                      CustomBottomButton(title: "Proceed",loader: provider.loading,onTap: (){
                                provider.fastagBiller(
                                    widget.id,widget.mode,
                                    // provider.paramsModal[0].details[0].name,
                                    // provider.paramsModal.length == 2
                                    //     ? provider
                                    //         .paramsModal[1].details[1].name
                                    //     : "",
                                    _params2controller.text,
                                    // _params3controller.text,
                                    context);},),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
