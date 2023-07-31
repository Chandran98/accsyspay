// ignore_for_file: must_be_immutable

import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../pages/screens.dart';
import '../../../constant/colors/colors.dart';
import '../../../provider/bus_provider.dart';
import '../../../provider/themeprovider.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/main_app_utils.dart';

class BoardingPoint extends StatefulWidget {
  List seatData;
  String totalAmount;
  BoardingPoint({Key key, this.totalAmount, this.seatData}) : super(key: key);

  @override
  State<BoardingPoint> createState() => _BoardingPointState();
}

class _BoardingPointState extends State<BoardingPoint> {
  @override
  Widget build(BuildContext context) {
    final cityProvider =
        Provider.of<BusBookingProvider>(context, listen: false);
    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          iconTheme: IconThemeData(color: white),
          title: Text(
            "Boarding Point",
            style: GoogleFonts.inter(
                color: theme.darkTheme ? Colors.black : Colors.white),
          ),
        ),
        body: cityProvider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: cityProvider.boardingPlaces.length,
                // separatorBuilder: (BuildContext context, int index) {
                //   return const Divider(
                //     color: black,
                //   );
                // },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DroppingPoint(
                                  totalAmount: widget.totalAmount,
                                  seatData: widget.seatData,
                                  id: cityProvider.boardingPlaces[index]
                                      ["bpId"])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          tileColor: white,
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: black,
                          ),
                          title: Text(
                            cityProvider.boardingPlaces[index]["address"],
                            style: const TextStyle(color: black, fontSize: 15),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                cityProvider.boardingPlaces[index]["location"],
                                style:
                                    const TextStyle(color: gray, fontSize: 13),
                              ),
                              Text(
                                "",
                                // DateFormat("h:mma").format(DateTime.tryParse(
                                //     cityProvider.boardingPlaces[index]
                                //         ["time"])),
                                style:
                                    const TextStyle(color: gray, fontSize: 13),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class DroppingPoint extends StatefulWidget {
  String id, totalAmount;
  List seatData;
  DroppingPoint({Key key, this.id, this.totalAmount, this.seatData})
      : super(key: key);

  @override
  State<DroppingPoint> createState() => _DroppingPointState();
}

class _DroppingPointState extends State<DroppingPoint> {
  @override
  Widget build(BuildContext context) {
    final cityProvider =
        Provider.of<BusBookingProvider>(context, listen: false);
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        iconTheme: IconThemeData(color: white),
        title: Text(
          "Departing Point",
          style: GoogleFonts.inter(
              color: theme.darkTheme ? Colors.black : Colors.white),
        ),
      ),
      body: cityProvider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: cityProvider.departingPlaces.length,
              // separatorBuilder: (BuildContext context, int index) {
              //   return const Divider(
              //     color: black,
              //   );
              // },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: white,
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: black,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlockScreen(
                                    totalAmount: widget.totalAmount,
                                    seat: widget.seatData,
                                    bp: widget.id,
                                    dp: cityProvider.boardingPlaces[index]
                                        ["bpId"])));
                      },
                      title:
                          Text(cityProvider.departingPlaces[index]["address"]),
                      subtitle: Text(
                        cityProvider.boardingPlaces[index]["location"]
                            .toString(),
                        style: const TextStyle(color: gray, fontSize: 13),
                      )),
                );
              },
            ),
    );
  }
}

class BlockScreen extends StatefulWidget {
  String bp, dp, totalAmount;
  List seat;
  BlockScreen({this.bp, this.totalAmount, this.dp, this.seat});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idNoController = TextEditingController();
  final TextEditingController _idTypeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  var genderList = ["MALE", "FEMALE", "OTHERS"];

  var titleList = ["Mr", "Ms"];

  var primaryList = ["true", "false"];
  String genderValue = 'MALE';
  String titleValue = 'Mr';
  String primaryValue = 'true';

  String seatDropDownValue;
  List userList = [];
  String selectedTotalFare = "";
  String ladiesSeat = "";

  getSelectedSeat(String seatNo) {
    return widget.seat.firstWhere((seat) => seat['seatNo'] == seatNo);
  }

  @override
  Widget build(BuildContext context) {
    final blockProvider = Provider.of<BusBookingProvider>(context);

    var theme = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: appColor,
            iconTheme: IconThemeData(color: white),
            title: Text(
              "Personal Information",
              style: GoogleFonts.inter(
                  color: theme.darkTheme ? Colors.black : Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              userList.length == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacer20Height,
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Passenger Details",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          spacer10Height,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: userList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  tileColor: appColor.withOpacity(0.1),
                                  title: Text(userList[index]["passenger"]
                                          ["name"]
                                      .toString()),
                                  subtitle: Column(
                                    children: [
                                      spacer10Height,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Seat No.${userList[index]["seatName"].toString()}"),
                                          Text(
                                              "Amount. ${userList[index]["fare"].toString()}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      userList.remove(userList[index]);
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.delete_outline_rounded,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacer20Height,
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Add User Details",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacer20Height,
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: CustomTextEditor(
                                  controller: _nameController,
                                  keyboardType: TextInputType.name,
                                  message: "Please add Your Name",
                                  title: "Name",
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    height: 7.5.h,
                                    width: 5.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: DropdownButton(
                                        underline: Container(
                                            color: Colors.transparent),
                                        value: titleValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: titleList.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            titleValue = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomTextEditor(
                            controller: _mobileController,
                            keyboardType: TextInputType.number,
                            message: "Please add Your Mobile",
                            title: "Mobile",
                          ),
                          spacer10Height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Gender",
                                            style: GoogleFonts.inter(
                                                color: black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        // spacer20Width,
                                        Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: DropdownButton(
                                              underline: Container(
                                                  color: Colors.transparent),
                                              value: genderValue,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: genderList
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: GoogleFonts.inter(
                                                        color: black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String newValue) {
                                                setState(() {
                                                  genderValue = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              spacer10Width,
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Seat No.",
                                            style: GoogleFonts.inter(
                                                color: black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        spacer20Width,
                                        Expanded(
                                          child: Center(
                                            child: DropdownButton(
                                              underline: Container(
                                                  color: Colors.transparent),
                                              value: seatDropDownValue,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: widget.seat.map((items) {
                                                final bool isEnabled =
                                                    seatDropDownValue == null ||
                                                        seatDropDownValue !=
                                                            items['seatNo'];
                                                return DropdownMenuItem(
                                                  enabled: isEnabled,
                                                  value: items['seatNo'],
                                                  child: Text(
                                                    items["seatNo"],
                                                    style: GoogleFonts.inter(
                                                        color: black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  seatDropDownValue = newValue;
                                                  final selectedSeat =
                                                      getSelectedSeat(newValue);
                                                  selectedTotalFare =
                                                      selectedSeat[
                                                          'total_fare'];
                                                  ladiesSeat = selectedSeat[
                                                      'ladiesSeat'];
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // spacer10Height,
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 25.0),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Primary",
                          //         style: GoogleFonts.inter(
                          //             color: black,
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //       spacer20Width,
                          //       DropdownButton(
                          //         underline: Container(color: Colors.transparent),
                          //         value: primaryValue,
                          //         icon: const Icon(Icons.keyboard_arrow_down),
                          //         items: primaryList.map((String items) {
                          //           return DropdownMenuItem(
                          //             value: items,
                          //             child: Text(items),
                          //           );
                          //         }).toList(),
                          //         onChanged: (String newValue) {
                          //           setState(() {
                          //             primaryValue = newValue;
                          //           });
                          //         },
                          //       )
                          //     ],
                          //   ),
                          // ),

                          spacer10Height,
                          CustomTextEditor(
                            controller: _addressController,
                            message: "Please add Your Address",
                            title: "Address",
                          ),
                          CustomTextEditor(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            message: "Please add Your Age",
                            title: "Age",
                          ),
                          CustomTextEditor(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            message: "Please add Your Email",
                            title: "Email",
                          ),
                          // spacer10Height,

                          spacer10Height,
                          CustomTextEditor(
                            controller: _idNoController,
                            message: "Please add Your ID no",
                            title: "ID no",
                          ),
                          CustomTextEditor(
                            controller: _idTypeController,
                            message: "Please add Id Type",
                            title: "Id Type",
                          ),
                          spacer20Height,
                          userList.length < widget.seat.length
                              ? CustomBottomButton(
                                  onTap: () {
                                    print(widget.seat);

                                    if (_formKey.currentState.validate()) {
                                      print("user list $userList");
                                      // blockProvider.blockTicket(
                                      //     widget.bp,
                                      //     widget.dp,
                                      //     widget.totalAmount,
                                      //     "true",
                                      //     _addressController.text,
                                      //     _ageController.text,
                                      //     _emailController.text,
                                      //     genderValue,
                                      //     _idNoController.text,
                                      //     _idTypeController.text,
                                      //     _mobileController.text,
                                      //     _nameController.text,
                                      //     "true",
                                      //     titleValue,
                                      //     seatDropDownValue,
                                      //     context);
                                    }

                                    seatDropDownValue == null
                                        ? Utils.toastMessage(
                                            "Please select seat No.")
                                        : userList.add(
                                            {
                                              "fare": selectedTotalFare,
                                              "ladiesSeat": ladiesSeat,
                                              "passenger": {
                                                "address": _addressController
                                                    .text
                                                    .trim(),
                                                "age":
                                                    _ageController.text.trim(),
                                                "email": _emailController.text
                                                    .trim(),
                                                "gender": genderValue,
                                                "idNumber":
                                                    _idNoController.text.trim(),
                                                "idType": _idTypeController.text
                                                    .trim(),
                                                "mobile": _mobileController.text
                                                    .trim(),
                                                "name":
                                                    _nameController.text.trim(),
                                                "primary": "true",
                                                "title": titleValue
                                              },
                                              "seatName": seatDropDownValue
                                            },
                                          );
                                    print(userList);

                                    print(userList.length);
                                    setState(() {});
                                  },
                                  loader: blockProvider.loading,
                                  title: "Continue",
                                  color: white,
                                )
                              : CustomBottomButton(
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      blockProvider.blockTicket(
                                          widget.bp,
                                          widget.dp,
                                          widget.totalAmount,
                                          userList,
                                          context);
                                    }

                                    setState(() {});
                                  },
                                  loader: blockProvider.loading,
                                  title: "Book Tickets",
                                  color: white,
                                ),
                          spacer40Height
                          // InkWell(
                          //     onTap: () {
                          //       // print(userList);
                          //       print(widget.seat);

                          //       if (_formKey.currentState.validate()) {
                          //         print("object");
                          //         // print(widget.seat);
                          //         // userList.length < widget.seat.length
                          //         //     ? userList.add({
                          //         //         _nameController.text,
                          //         //         titleValue,
                          //         //         _mobileController.text,
                          //         //         seatDropDownValue,
                          //         //         _ageController.text,
                          //         //         _emailController.text,
                          //         //         genderValue,
                          //         //         _addressController.text,
                          //         //         _idNoController.text,
                          //         //         _idTypeController.text,
                          //         //         primaryValue,
                          //         //       })
                          //         //     : Utils.toastMessage(
                          //         //         "You have booked your seats");
                          //         print("user list $userList");
                          //         blockProvider.blockTicket(
                          //             widget.bp,
                          //             widget.dp,
                          //             widget.totalAmount,
                          //             "true",
                          //             _addressController.text,
                          //             _ageController.text,
                          //             _emailController.text,
                          //             genderValue,
                          //             _idNoController.text,
                          //             _idTypeController.text,
                          //             _mobileController.text,
                          //             _nameController.text,
                          //             primaryValue,
                          //             titleValue,
                          //             seatDropDownValue,
                          //             context);
                          //       }
                          //       setState(() {});
                          //     },
                          //     child: Container(
                          //       height: 50,
                          //       color: PrimaryColor,
                          //       child: const Center(
                          //           child: Text(
                          //         "Continue",
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 18),
                          //       )),
                          //     )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}

class CustomTextEditor extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String message, title;
  CustomTextEditor(
      {Key key, this.controller, this.keyboardType, this.message, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        // ignore: missing_return
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
        },
        decoration: InputDecoration(
          label: Text(title),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomNameTilePs extends StatelessWidget {
  String title, subtitle;
  CustomNameTilePs({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600, fontSize: 10.sp),
            ),
          ),
          // spacer20Width,
          Expanded(
            flex: 3,
            child: Text(
              subtitle,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, fontSize: 10.sp),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
