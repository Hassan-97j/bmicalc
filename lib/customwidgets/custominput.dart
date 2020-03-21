import 'package:flutter/material.dart';
import 'package:bmicalc/themes.dart';

class CustomTextinput extends StatelessWidget {
  const CustomTextinput({
    Key key,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.prefixIcon,
    this.controller, 
  }) :  

        super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Card(
        elevation: 4.0,
        child: TextFormField(
          style: setTextStyle(
            color: primaryColor,
            size: 15,
          ),
          cursorColor: primaryColor,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: setTextStyle(color: primaryColor, size: 15),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
               // borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
