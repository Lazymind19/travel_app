import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/rsponsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state){
      DetailState detailState  = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detailState.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  )),
              Positioned(
                  top: 220,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name and cost
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detailState.place.name,
                              size: 16,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: detailState.place.price.toString(),
                              size: 16,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //location
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(text: detailState.place.location)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //rating
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                      (index) => Icon(
                                    Icons.star,
                                    color: index < gottenStar
                                        ? Colors.yellow
                                        : Colors.grey.withOpacity(0.5),
                                  )),
                            ),
                            AppText(text: detailState.place.stars.toString())
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          text: "People",
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          textSize: 14,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //paging
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AppButton(
                                  isIcon: false,
                                  text: index.toString(),
                                  color: selectedIndex == index? Colors.white : Colors.black,
                                  backgroundColor: selectedIndex == index? Colors.black : Colors.white,
                                  size: 50,
                                  borderColor: Colors.black,
                                ));
                          }),
                        ),
                        SizedBox(height: 10,),
                        AppLargeText(text: "Description",size: 16,color: Colors.black.withOpacity(0.8),),
                        SizedBox(height: 5,),
                        AppText(textSize:14,text: detailState.place.description),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            AppButton(color: Colors.black, backgroundColor: Colors.white, size: 50, borderColor: Colors.black,isIcon:true,icon: Icons.favorite_border,),
                            ResponsiveButton(isResponsive: true, height: 50,)
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );

    });
  }
}
