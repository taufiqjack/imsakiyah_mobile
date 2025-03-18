import 'package:flutter/material.dart';
import 'package:imsakiyah_mobile/cores/constants/colors_cons.dart';
import 'package:imsakiyah_mobile/widgets/common_textstyle.dart';

class CommonDropDown extends StatelessWidget {
  final Color dropDownColor;
  final String hintText;
  final Object? value;
  final String validatorText;
  final List<DropdownMenuItem<Object>>? items;
  final Function(Object?)? onChange;
  const CommonDropDown(
      {super.key,
      required this.dropDownColor,
      required this.hintText,
      required this.validatorText,
      this.items,
      this.onChange,
      this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      dropdownColor: grey,
      style: const TextStyle(
        color: Color.fromARGB(153, 54, 54, 54),
        fontSize: 13.0,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w300,
      ),
      hint: CommonText(
        text: hintText,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: white,
        size: 16.0,
      ),
      value: value,
      validator: (value) {
        return value == null ? "\u26A0 $validatorText" : null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: greyLight),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyLight),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyLight),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: greyTwo,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        hintStyle: const TextStyle(
          color: Color.fromARGB(153, 79, 79, 79),
          fontSize: 13.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      items: items,
      onChanged: onChange,
    );
  }
}
