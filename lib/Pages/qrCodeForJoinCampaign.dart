import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class qrCodeForJoinCampaign extends StatefulWidget {
  @override
  _qrCodeForJoinCampaignState createState() => _qrCodeForJoinCampaignState();
}

class _qrCodeForJoinCampaignState extends State<qrCodeForJoinCampaign> {
  final AuthenticationService _auth =
      AuthenticationService(FirebaseAuth.instance);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().currentUser),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF3EAF51),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0XFF3EAF51),
        body: Column(
          children: [
            Center(
              child: Container(
                child: Text(
                  "ร่วมแคมเปญ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              child: SizedBox(
                width: 350,
                height: 160,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 15, 10),
                      child: Image.asset(
                          "assets/images_login_fresh_34_/image 23.png"),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 165, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: MediaQuery.of(context).size.height * 0.03,
                            decoration: BoxDecoration(
                                color: Color(0XFF0F3754),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
                            child: new Center(
                              child: Text(
                                "Volunteer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.height * 0.27,
                          child: Text(
                            "อาสาปลูกป่าเพื่ออนุรักษ์กวางลายดาว สวนสัตว์ขอนแก่น",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 15,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                "23 กรกฎาคม 2564 7:00 - 15:00 น.",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 132, 0),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, size: 15),
                              SizedBox(width: 5.0),
                              Text(
                                "สวนสัตว์ขอนแก่น",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                          child: Row(
                            children: [
                              Icon(Icons.people, size: 15),
                              SizedBox(width: 5.0),
                              Text(
                                "29 ผู้เข้าร่วม",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              child: SizedBox(
                width: 350,
                height: 270,
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                      child: Container(
                        child: Text(
                          "QR Code",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 5, 10, 0),
                      child: Container(
                          child: Text(
                        "โปรดแคปหน้าจอและนำ QR Code นี้มายืนยันเข้าร่วมกิจกรรมกับเจ้าหน้าที่ในวันและเวลาดังกล่าวที่ท่านลงทะเบียน",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFDD582D),
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(child: 
                    Image.asset("assets/images_login_fresh_34_/qrcode.jpg"),
                    width: 150, height: 150),
                    Text("Code: 7QX56A",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
