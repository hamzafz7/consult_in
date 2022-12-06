import 'package:flutter/material.dart';

class MaterialButtonBuilder extends StatelessWidget {
  MaterialButtonBuilder(
      // ignore: non_constant_identifier_names
      {super.key,
      required this.Child,
      required this.height,
      required this.onpressed,
      required this.width,
      required this.color,
      required this.textStyle});
  Function() onpressed;
  // ignore: non_constant_identifier_names
  String Child;
  double width;
  double height;
  Color color;
  TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          Child,
          style: textStyle,
        ),
      ),
    );
  }
}
