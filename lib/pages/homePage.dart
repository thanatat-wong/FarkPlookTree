import 'package:farkplooktreeapp/Pages/Setting.dart';
import 'package:farkplooktreeapp/pages/farkPlook.dart';
import 'package:farkplooktreeapp/pages/joinCampaignHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [FarkPlook()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = FarkPlook();

  bool openpanel = false;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(25.0),
      topRight: Radius.circular(25.0),
    );
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return SettingPage();
                  }));
                })
          ],
        ),
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
          minHeight: MediaQuery.of(context).size.height * 0.058,
          panel: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: currentTab == 0 ? 4 : 0,
                                  color: currentTab == 0
                                      ? Colors.black
                                      : Colors.transparent))),
                      child: MaterialButton(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        minWidth: MediaQuery.of(context).size.width / 2,
                        onPressed: () {
                          setState(() {
                            currentScreen = FarkPlook();
                            currentTab = 0;
                          });
                        },
                        child: Text(
                          "ฝากปลูก",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: currentTab == 1 ? 4 : 0,
                                    color: currentTab == 1
                                        ? Colors.black
                                        : Colors.transparent))),
                        child: MaterialButton(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          minWidth: MediaQuery.of(context).size.width / 2,
                          onPressed: () {
                            setState(() {
                              currentScreen = JoinCampaign();
                              currentTab = 1;
                            });
                          },
                          child: Text("ร่วมแคมเปญ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        )),
                  ],
                ),
              ),
              PageStorage(
                child: currentScreen,
                bucket: bucket,
              )
            ],
          ),
          body: openpanel == true
              ? Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        alignment: Alignment.topCenter,
                        child: Image.asset('images/world2.png'),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 100),
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
