import 'dart:convert';

import 'package:farkplooktreeapp/Pages/Setting.dart';
import 'package:farkplooktreeapp/models/homeData.dart';
import 'package:farkplooktreeapp/pages/farkPlook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;
import 'joinCampaignHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController animationController;
  String uid;
  Future<HomeData> fetchedData;
  String getUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    uid = user.uid;
    return uid;
  }

  Future<HomeData> fetchHomeData() async {
    final response = await http
        .get(Uri.parse('http://52.163.100.154/api/fpt/homedata/$uid'));

    if (response.statusCode == 200) {
      HomeData data;
      // If the server did return a 200 OK response,
      // then parse the JSON.
      data = (HomeData.fromJson(jsonDecode(response.body)[0]));

      print('------------LASTED DONATION------------');
      print(response.body);
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    uid = getUserID();
    fetchedData = fetchHomeData();
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 50),
    );
    animationController.repeat();
  }

  stopRotation() {
    animationController.stop();
  }

  startRotation() {
    animationController.repeat();
  }

  final PanelController _pc = PanelController();
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final String uid = user.uid;
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    print(uid);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            user.isAnonymous
                ? IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      auth.signOut();
                    })
                : IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return SettingPage();
                      }));
                    })
          ],
        ),
        backgroundColor: Color(0xff3EAF51),
        body: SlidingUpPanel(
          color: Color(0xFFF3FFF5),
          controller: _pc,
          defaultPanelState: PanelState.CLOSED,
          panelSnapping: true,
          onPanelOpened: () {
            setState(() {
              fetchedData = fetchHomeData();
              openpanel = true;
            });
          },
          onPanelClosed: () {
            setState(() {
              fetchedData = fetchHomeData();
              openpanel = false;
            });
          },
          maxHeight: MediaQuery.of(context).size.height * 0.74,
          minHeight: MediaQuery.of(context).size.height * 0.058,
          panel: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: radius,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 10  horizontally
                              2.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: currentTab == 0 ? 4 : 0,
                                        color: currentTab == 0
                                            ? Color(0xFF0F3754)
                                            : Colors.transparent))),
                            child: MaterialButton(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              minWidth: MediaQuery.of(context).size.width / 2,
                              onPressed: () {
                                _pc.open();
                                setState(() {
                                  openpanel = true;
                                  currentScreen = FarkPlook();
                                  currentTab = 0;
                                });
                              },
                              child: Text(
                                "ฝากปลูก",
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? Color(0xFF0F3754)
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: currentTab == 1 ? 4 : 0,
                                          color: currentTab == 1
                                              ? Color(0xFF0F3754)
                                              : Colors.transparent))),
                              child: MaterialButton(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                minWidth: MediaQuery.of(context).size.width / 2,
                                onPressed: () {
                                  _pc.open();
                                  setState(() {
                                    openpanel = true;
                                    currentScreen = JoinCampaign(uid);
                                    currentTab = 1;
                                  });
                                },
                                child: Text("ร่วมแคมเปญ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: currentTab == 1
                                            ? Color(0xFF0F3754)
                                            : Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ],
                      ),
                    ),
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
              ? GestureDetector(
                  onTap: () {
                    _pc.close();
                    openpanel = false;
                  },
                  child: FutureBuilder<HomeData>(
                      future: fetchedData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 45, 8, 0),
                                  child: AnimatedBuilder(
                                    animation: animationController,
                                    child: Container(
                                      child: Image.asset('images/world2.png'),
                                    ),
                                    builder: (context, Widget _widget) {
                                      return Transform.rotate(
                                          angle:
                                              animationController.value * 6.3,
                                          child: _widget);
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(top: 100),
                                  child: Column(
                                    children: [
                                      Text(
                                        'คุณปลูกไปแล้ว',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                      Text(
                                        '${snapshot.data.myplantedtree.toString().replaceAllMapped(reg, mathFunc)} ต้น',
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
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      }),
                )
              : FutureBuilder<HomeData>(
                  future: fetchedData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: <Widget>[
                                AnimatedBuilder(
                                  animation: animationController,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Image.asset('images/world.png'),
                                  ),
                                  builder: (context, Widget _widget) {
                                    return Transform.rotate(
                                        angle: animationController.value * 6.3,
                                        child: _widget);
                                  },
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'รับฝากปลูกแล้ว',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              '${snapshot.data.sumTreeAmount.toString().replaceAllMapped(reg, mathFunc)} ต้น',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50.0),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'มีผู้ร่วมปลูกแล้ว',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              '${snapshot.data.countDonator} คน',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50.0),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'จัดแคมเปญแล้ว',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              '${snapshot.data.countCampaign} ครั้ง',
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
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return SizedBox(
                      width: 0,
                    );
                  }),
          borderRadius: radius,
        ));
  }
}
