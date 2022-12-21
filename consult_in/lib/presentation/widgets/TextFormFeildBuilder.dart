import 'package:flutter/material.dart';

class TextFormFieldBuilder extends StatelessWidget {
  TextFormFieldBuilder(
      {super.key,
      required this.controller,
      required this.validate,
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
  String? Function(String?) validate;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: !hide,
      keyboardType: textInputType,
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
                /*
                TextField( 
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      print(value);
                    },
                    cursorColor: Color(0xff94B0B2),
                    decoration: InputDecoration( 
                      icon: Icon(
                        Icons.email,
                        color: Color(0xff057c82),
                      ),
                      hintText: 'Email or Username',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),*/
                  /* 
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onSubmitted: (value) {
                      print(value);
                    },
                    cursorColor: Color(0xff94B0B2),
                    decoration: InputDecoration(
                      icon: Icon(
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
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  */