import 'dart:io';
import 'package:Accsys_Pay/MainApp/constant/colors/colors.dart';
import 'package:Accsys_Pay/MainApp/pages/main_screen.dart';
import 'package:Accsys_Pay/MainApp/provider/auth_provider.dart';
import 'package:Accsys_Pay/MainApp/utils/hover_message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../Theme/colors/colors.dart';
import '../utils/main_app_utils.dart';

class EditProfileScreen extends StatefulWidget {
  String name, mobile;

  EditProfileScreen({Key key, this.mobile, this.name}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Sample user profile data (you can replace it with real data)
  // UserProfile userProfile = UserProfile(name: "John Doe", mobile: "1234567890");

  // Controller to handle text editing for the name field
  TextEditingController _nameController, _mobileController;
  var pinCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _mobileController = TextEditingController(text: widget.mobile);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();
  var upname = "";
  var upmobile = "";
  void onBack() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var profileInfo = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () {
        onBack();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MainScreen()));
              },
              child: const Icon(Icons.arrow_back)),
          title: Text(
            "Edit Profile",
            style: GoogleFonts.inter(fontSize: 18, color: appColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // padding: EdgeInsets.all(25),
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Text(
                    profileInfo.profileData == null
                        ? ""
                        : profileInfo.profileData.name[0].toUpperCase(),
                    style: GoogleFonts.inter(
                        color: white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                spacer20Height,
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Enter new name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: _nameController,
                          validator: (value) {
                            if (value.length == 0) return "Name can't be empty";
                            return null;
                          },
                        ),
                        spacer20Height,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter your Mobile',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: _mobileController,
                          validator: (value) {
                            if (value.length == 0)
                              return "Email can't be empty";
                            return null;
                          },
                        ),
                        spacer20Height,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter your Pin',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: pinCtrl,
                          validator: (value) {
                            if (value.length == 0) return "Pin can't be empty";
                            return null;
                          },
                        ),
                        // spacer20Height,
                        // InkWell(
                        //     onTap: () {
                        //       // _determinePosition();
                        //     },
                        //     child: Container(
                        //         height: 70,
                        //         width: MediaQuery.of(context).size.width,
                        //         padding: EdgeInsets.all(10),
                        //         decoration: BoxDecoration(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(12)),
                        //             //  Border.symmetric(horizontal: BorderSide(width: 0.5,color: blackish))
                        //             border: Border.all(
                        //                 width: 0.5, color: Colors.black54)),
                        //         child: Text(
                        //           "currentAddress",
                        //           style: TextStyle(fontSize: 16),
                        //         )))
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: InkWell(
                      onTap: () {
                        // if (formKey.currentState.validate()) {
                        if (pinCtrl.text.length == 4) {
                          profileInfo.updateProfile(_nameController.text,
                              _mobileController.text, pinCtrl.text, context);
                        } else {
                          Utils.toastMessage("Pin should 4 Digits only");
                        }
                        // }
                        // updatetoDB();
                      },
                      child: profileInfo.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: white,
                            ))
                          : Center(
                              child: Text(
                              "Update Profile",
                              style: GoogleFonts.poppins(color: white),
                            )),
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
