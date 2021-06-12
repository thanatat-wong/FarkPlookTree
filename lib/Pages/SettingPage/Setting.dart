import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:farkplooktreeapp/login_fresh.dart';
import 'package:farkplooktreeapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farkplooktreeapp/main.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final AuthenticationService _auth = AuthenticationService(FirebaseAuth.instance);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),],
          child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF3EAF51),
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Setting",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            )),
        backgroundColor: Color(0XFF3EAF51),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.grey))),
                          child: Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 10.0),
                              Text(
                                "ประวัติการบริจาค",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.grey))),
                          child: Row(
                            children: [
                              Icon(Icons.done_all),
                              SizedBox(width: 10.0),
                              Text(
                                "แคมเปญที่เคยเข้าร่วม",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthenticationWrapper()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.grey))),
                          child: Row(
                            children: [
                              Icon(Icons.filter_frames),
                              SizedBox(width: 10.0),
                              Text(
                                "นโยบายความเป็นส่วนตัว",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        await _auth.signOut().then((value) => 
                        Navigator.of(context).pop());
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: Colors.grey))),
                          child: Row(
                            children: [
                              Icon(Icons.power_settings_new, color: Colors.red),
                              SizedBox(width: 10.0),
                              Text(
                                "ออกจากระบบ",
                                style: TextStyle(fontSize: 15, color: Colors.red),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
