import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool openpanel = false;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
        backgroundColor: Color(0xff3EAF51),
        body: SlidingUpPanel(
          onPanelOpened: () {
            setState(() {
              openpanel = true;
            });
          },
          onPanelClosed: () {
            setState(() {
              openpanel = false;
            });
          },
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          panel: Center(
            child: Text("This is the sliding Widget"),
          ),
          collapsed: Container(
            decoration:
                BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
            child: Center(
              child: Text(
                "This is the collapsed Widget",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: openpanel == true
              ? Container(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        alignment: Alignment.topCenter,
                        child: Image.asset('images/world2.png'),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Text(
                              'เราปลูกไปแล้ว',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                            Text(
                              '20,000,000 ต้น',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset('images/world.png'),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Swiper.children(
                                autoplay: false,
                                control: SwiperControl(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(30)),
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'เราปลูกไปแล้ว',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                      Text(
                                        '20,000,000 ต้น',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50.0),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'มีผู้ร่วมปลูกแล้ว',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                      Text(
                                        '600,000 คน',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50.0),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'จัดแคมเปญแล้ว',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                      Text(
                                        '10 ครั้ง',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50.0),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
          borderRadius: radius,
        ));
  }
}
