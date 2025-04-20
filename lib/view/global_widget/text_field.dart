import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.textController});
  final TextEditingController textController;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formKey,
      controller: textController,
      // keyboardType: TextInputType.number,
      // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]+'))],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "Field cant be null";
        } else {
          return null;
        }
      },
    );
  }
}
