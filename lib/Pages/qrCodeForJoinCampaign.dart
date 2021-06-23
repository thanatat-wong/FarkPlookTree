import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:farkplooktreeapp/models/availableCampaign.dart';
import 'package:intl/intl.dart';

import 'joinCampaignHome.dart';

class qrCodeForJoinCampaign extends StatefulWidget {
  final String joinCode;
  final AvailableCampaign data;
  qrCodeForJoinCampaign(this.data, this.joinCode);
  @override
  _qrCodeForJoinCampaignState createState() =>
      _qrCodeForJoinCampaignState(data, joinCode);
}

class _qrCodeForJoinCampaignState extends State<qrCodeForJoinCampaign> {
  final String joinCode;
  final AvailableCampaign data;
  _qrCodeForJoinCampaignState(this.data, this.joinCode);

  final AuthenticationService _auth =
      AuthenticationService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    String _path = 'http://52.163.100.154';
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
          title: Text("ร่วมแคมเปญ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white)),
        ),
        backgroundColor: Color(0XFF3EAF51),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 5.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CampaignCardNoRegisterBtn(data),
                      SizedBox(height: 10.0),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                          width: 350,
                          height: 290,
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 240, 0),
                                child: Container(
                                  child: Text(
                                    "QR Code",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(13, 5, 10, 0),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    child: Image.asset(
                                        "assets/images_login_fresh_34_/qrcode.jpg"),
                                    width: 150,
                                    height: 150),
                              ),
                              Text(
                                "Code: $joinCode",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: FlatButton(
                          child: Text(
                            "กลับสู่หน้าหลัก",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          color: Color(0xFF0F3754),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
