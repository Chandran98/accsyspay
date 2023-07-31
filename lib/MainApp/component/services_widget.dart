import 'package:Accsys_Pay/MainApp/provider/utilty_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:Accsys_Pay/pages/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../pages/utiltiy/2_service_provider_screen.dart';
import '../provider/themeprovider.dart';
import '../utils/main_app_utils.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({Key key}) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  final Color _color2 = const Color(0xFF515151);

  final List<CategoryModel> _categoryData = [];

  @override
  void initState() {
    // _categoryData.add(CategoryModel(
    //     id: 1, name: 'Mobile', image: "assets/icons/recharge.png"));
    // _categoryData
    // .add(CategoryModel(id: 4, name: 'DTH', image: "assets/icons/dth.png"));
    // _categoryData.add(
    //     CategoryModel(id: 12, name: 'Fastag', image: "assets/icons/toll.png"));
    // _categoryData.add(CategoryModel(
    //     id: 4, name: 'flight', image: "assets/icons/flight_ticket.png"));
    _categoryData.add(CategoryModel(
        id: 3, name: 'Electricity', image: "assets/icons/idea.png"));
    _categoryData.add(CategoryModel(
        id: 0, name: 'LPG Gas', image: "assets/icons/gas-cylinder.png"));
    // _categoryData.add(CategoryModel(
    //     id: 6, name: ' Mobile Postpaid', image: "assets/icons/smartphone.png"));

    _categoryData.add(CategoryModel(
        id: 13, name: 'Cable TV', image: "assets/icons/tvapp.png"));
    _categoryData.add(CategoryModel(
        id: 5, name: 'LandLine', image: "assets/icons/landline2.png"));
    _categoryData.add(CategoryModel(
        id: 7, name: 'Broadband', image: "assets/icons/router1.png"));
    _categoryData.add(CategoryModel(
      id: 9,
      name: 'Water',
      image: "assets/icons/drop.png",
    ));
    // _categoryData.add(CategoryModel(
    //     id: 8, name: 'Train', image: "assets/icons/train.png"));
    // _categoryData.add(CategoryModel(
    //     id: 8, name: 'Broadband\n Prepaid', image: "assets/icons/router.png"));

    _categoryData.add(CategoryModel(
        id: 11, name: 'Life Insurance', image: "assets/icons/li.png"));

    _categoryData.add(CategoryModel(
        id: 19, name: 'Insurance', image: "assets/icons/insurance2.png"));
    _categoryData.add(CategoryModel(
        id: 14, name: 'Health Insurance', image: "assets/icons/hi.png"));
    _categoryData.add(CategoryModel(
        id: 2, name: 'Piped Gas', image: "assets/icons/gas-pipe.png"));

    _categoryData.add(CategoryModel(
        id: 16, name: 'Municipal Taxes', image: "assets/icons/tax2.png"));

    _categoryData.add(
        CategoryModel(id: 118, name: 'Train', image: "assets/icons/train.png"));
    // _categoryData.add(CategoryModel(
    //     id: 12, name: 'House Rent', image: "assets/icons/rent_payment.png"));
    // _categoryData.add(CategoryModel(
    //     id: 13, name: 'Credit Card', image: "assets/icons/sbi_card.png"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UtilityProvider>(context);
    // var uprovider = Provider.of<MyAPIService>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 18, right: 13),
            child: Text(
              'Services',
              style: GoogleFonts.inter(
                color: theme.darkTheme ? Colors.white : black,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
              // style: boldTextStyle(
              //     size: 18, color: theme.darkTheme ? white : black)
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: theme.darkTheme ? black : Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: GridView.count(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              childAspectRatio: 1,
              shrinkWrap: true,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 3,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              children: List.generate(_categoryData.length, (index) {
                var id = _categoryData[index].id.toString();
                var title = _categoryData[index].name.toString();
                return GestureDetector(
                    onTap: () {
                      if (id == "14" || id == "11" || id == "19") {
                        Utils.toastMessage("comming soon");
                      } else {
                        title.toString() == "Train"
                            ? Utils.toastMessage("coming soon")
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => (BillerScreen(
                                          id: id,
                                          title: title,
                                        ))));
                        provider.fetchBillers(id);

                        provider.getCharges();
                      }
                    },
                    child: Column(children: [
                      spacer10Height,
                      spacer5Height,
                      Container(
                          decoration: BoxDecoration(
                              // color: Colors.grey.shade100,
                              shape: BoxShape.circle),
                          width: 11.w,
                          height: 6.h,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset(
                              _categoryData[index].image, fit: BoxFit.contain,
                              // color: PrimaryColor,
                            ),
                          )),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Text(
                            _categoryData[index].name,
                            style: GoogleFonts.inter(
                              color: theme.darkTheme ? Colors.white : black,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ]));
              }),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryModel {
  int id;
  String name;
  String image;
  Function onTap;

  CategoryModel({this.id, this.name, this.image, this.onTap});
}
