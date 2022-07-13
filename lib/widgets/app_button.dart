import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

   AppButton(
      {Key? key,this.text,this.icon,this.isIcon, required this.color, required this.backgroundColor, required this.size, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: borderColor,
              width: 1.0
            ),
            color: backgroundColor,
      ),
      child: isIcon ==false? Center(child: AppText(text: text!, color: color,)) : Center(child: Icon(icon, color: color,)),
    );
  }
}
