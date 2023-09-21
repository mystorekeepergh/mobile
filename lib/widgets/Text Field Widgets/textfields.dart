import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final String hintext;
  final TextEditingController controller;
  final String? Function(dynamic value)? validator;
  final TextInputType keyboardType;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintext,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff1D4771)),
          ),
          hintText: hintext,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
