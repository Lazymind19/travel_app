import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/rsponsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.jpg",
    "welcome-two.png",
    "welcome-three.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical ,
          itemCount: images.length,
          itemBuilder: (_,index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/"+images[index]),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain",textSize: 30,),
                      Container(
                        width: 250,
                        child: AppText(
                          textSize: 16,
                          text: "Hiking mountain will gives you different sense of freedom",
                        ),
                      ),
                      SizedBox(height: 20,),
                      ResponsiveButton(widht: 120,height: 40,)
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDot) => Container(
                      margin: EdgeInsets.only(bottom: 5),

                      width: 8,
                        height: index == indexDot? 25 : 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDot ? Colors.blue : Colors.blueGrey.withOpacity(0.3)
                      ),
                    )),
                  )
                ],
              ),

            ),

          );
      }),
    );
  }
}
