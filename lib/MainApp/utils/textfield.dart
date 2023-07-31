import 'package:Accsys_Pay/MainApp/Theme/custom_fonts.dart';
import 'package:Accsys_Pay/MainApp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/colors/colors.dart';
import '../constant/colors/colors.dart';
import '../constant/constant.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt, validatorMessage;
  final FocusNode focusNode;
  final Color fillColor;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isValidator;

  CustomPasswordTextField(
      {this.controller,
      this.isValidator = false,
      this.fillColor,
      this.hintTxt,
      this.validatorMessage,
      this.focusNode,
      this.nextNode,
      this.textInputAction});

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(6),
        child: TextFormField(
          // cursorColor: Theme.of(context).PrimaryColor,
          controller: widget.controller,
          obscureText: _obscureText,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (v) {
            setState(() {
              widget.textInputAction == TextInputAction.done
                  ? FocusScope.of(context).consumeKeyboardToken()
                  : FocusScope.of(context).requestFocus(widget.nextNode);
            });
          },
          validator: (input) {
            if (input.isEmpty) {
              return " Password is Empty";
            }
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: appColor,
                  ),
                  onPressed: _toggle),
              hintText: widget.hintTxt ?? '',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              isDense: true,
              filled: true,
              fillColor: widget.fillColor,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: appColor)),
              hintStyle:
                  titilliumRegular.copyWith(color: Theme.of(context).hintColor),
              border: InputBorder.none),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;
  final TextCapitalization capitalization;

  CustomTextField(
      {this.controller,
      this.hintText,
      this.textInputType,
      this.maxLine,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.isPhoneNumber = false,
      this.isValidator = false,
      this.validatorMessage,
      this.capitalization = TextCapitalization.none,
      this.fillColor});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: isPhoneNumber
            ? BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6))
            : BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ?? 1,
        textCapitalization: capitalization,
        maxLength: isPhoneNumber ? 10 : null,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        //keyboardType: TextInputType.number,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        //autovalidate: true,
        inputFormatters: [
          isPhoneNumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        validator: (input) {
          if (input.isEmpty) {
            if (isValidator) {
              return validatorMessage ?? "";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          counterText: '',
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: appColor)),
          hintStyle:
              titilliumRegular.copyWith(color: Theme.of(context).hintColor),
          errorStyle: TextStyle(height: 1.5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
