import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../cubit/app_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var bottomImages = {
    "welcome-one.jpg":"One",
    "welcome-two.png":"Two",
    "welcome-three.jpg" : "Three",
    "welcome-ones.jpg" : "Four",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is  LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //navigation menu
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //discovered
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discovered")),
                SizedBox(
                  height: 5,
                ),
                //tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      indicator: CircleTabIndicator(color: Colors.blue, radius: 4),
                      tabs: [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        )
                      ],
                    ),
                  ),
                ),
                //Tab bar view
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(left: 20),
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 200,
                            height: 300,
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                  fit: BoxFit.cover
                              ),
                            ),
                          );
                        },
                      ),
                      Text("Whats up"),
                      Text("Lol")
                    ],
                  ),
                ),
                //Explore more
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: AppLargeText(text: "Explore More", size: 22,)),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      child: AppText(text: "See more", textSize: 18,),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                //bottom tab
                Container(
                  width: double.maxFinite,
                  height: 80,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(right: 50),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "img/"+bottomImages.keys.elementAt(index)
                                        ),
                                        fit: BoxFit.cover

                                    )
                                ),
                              ),
                              Container(
                                child: AppText(text: bottomImages.values.elementAt(index),),
                              )
                            ],
                          ),
                        );
                      }),
                )

              ],
            );
          }
          else  {
           return Container();
          }
        }),

    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset customOffSet = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + customOffSet, radius, _paint);
  }
}
