import 'package:flutter/material.dart';

class TextFormFieldBuilder extends StatelessWidget {
  TextFormFieldBuilder(
      {super.key,
      this.hide = true,
      required this.textInputType,
      required this.hinttext,
      required this.mycursorcolor,
      required this.prefixicon,
      this.suffixicon});
  bool hide;
  TextInputType textInputType;
  Color mycursorcolor;
  Icon prefixicon;
  IconButton? suffixicon;
  String hinttext;
  Function(String?)? onsaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !hide,
      keyboardType: TextInputType.visiblePassword,
      onSaved: onsaved,
      cursorColor: mycursorcolor,
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: prefixicon,
          hintText: hinttext,
          suffixIcon: suffixicon),
    );
  }
}

/*
TextFormField(
                  obscureText: hide,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (value) {
                    print(value);
                  },
                  cursorColor: mysecondcolor,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xff057c82),
                    ),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hide = !hide;
                        });
                      },
                      icon: hide
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),*/