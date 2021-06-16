import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class joinCampaign extends StatefulWidget {
  @override
  _joinCampaignState createState() => _joinCampaignState();
}

class _joinCampaignState extends State<joinCampaign> {
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
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: 350,
                height: 270,
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Container(
                        child: Text(
                          "ข้อมูลผู้เข้าร่วม",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 3, 0),
                      child: Container(
                          child: Text(
                        "* กรอกข้อมูลของท่านให้ถูกต้อง เพื่อสิทธิประโยชน์ของตัวท่านเอง หากท่านกรอกข้อมูลไม่ถูกต้อง ท่านจะไม่สามารถแก้ไขข้อมูลได้ และระบบจะไม่รับผิดชอบความผิดพลาดของท่าน",
                        style:
                            TextStyle(fontSize: 11, color: Color(0xFFA3A3A3)),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 3, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  validator: (value){
                                    if(value.isNotEmpty && value.length > 2){
                                      return null;
                                    } else if (value.length < 3 && value.isNotEmpty){
                                      return 'ชื่อของคุณสั้นจนเกินไป';
                                    } else
                                      return 'กรอกชื่อของคุณ';
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'ชื่อ',
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'นามสกุล',
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextFormField(
                                validator: (value){
                                  if(value.isEmpty){
                                    return "กรุณากรอกชื่อ";
                                  }
                                  if(value.length < 2){
                                    return "กรุณากรอกตัวอักษรมากกว่า 1 ตัวอักษร";
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'E-mail',
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'เบอร์โทรศัพท์',
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: FlatButton(
                child: Text(
                  "ยืนยัน",
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                color: Color(0xFFDD582D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
