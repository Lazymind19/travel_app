import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? widht;
  double? height = 60;

  ResponsiveButton({Key? key, this.widht = 120, this.isResponsive = false, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: isResponsive ==true? const EdgeInsets.only(left: 20, right: 20): EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: isResponsive ==true? double.maxFinite :  widht,
        height: height,
        child: Row(
          mainAxisAlignment:isResponsive==true? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
          children: [
            isResponsive == true? Container(
                child: AppText(text: "Book Trip Now",color: Colors.white,)) : Container(),
            Icon(Icons.arrow_forward,
            size: 30,
            color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
