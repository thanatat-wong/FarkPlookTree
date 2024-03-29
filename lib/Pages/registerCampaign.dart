import 'dart:convert';

import 'package:farkplooktreeapp/Pages/joinCampaignHome.dart';
import 'package:farkplooktreeapp/Pages/qrCodeForJoinCampaign.dart';
import 'package:farkplooktreeapp/models/availableCampaign.dart';
import 'package:farkplooktreeapp/models/registerCampaign.dart';
import 'package:farkplooktreeapp/models/registerCampaignResponse.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RegisterCampaign extends StatefulWidget {
  final AvailableCampaign data;
  RegisterCampaign(this.data);
  @override
  _RegisterCampaignState createState() => _RegisterCampaignState(data);
}

class _RegisterCampaignState extends State<RegisterCampaign> {
  RegisterCampaignModel formRegister = RegisterCampaignModel();

  final AvailableCampaign data;
  _RegisterCampaignState(this.data);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.formRegister.uid = getUserID();
    this.formRegister.campaign_no = data.campaign_no;
  }

  String getUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    String uid = user.uid;
    return uid;
  }

  Future<RegisterCampaignResponse> registerCampaign(
      String name,
      String surname,
      String contact_email,
      String phone,
      String uid,
      String campaign_no) async {
    final response = await http.post(
      Uri.parse('http://52.163.100.154/api/fpt/joincampaign'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "surname": surname,
        "contact_email": contact_email,
        "phone": phone,
        "uid": uid,
        "campaign_no": campaign_no
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return RegisterCampaignResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Register Campaign');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _path = 'http://52.163.100.154';
    String successJoinCode;
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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("ร่วมแคมเปญ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF3EAF51),
          centerTitle: true,
          elevation: 0,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 9, 0, 0),
                                child: Container(
                                  child: Text(
                                    "รายละเอียด",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 9, 0, 0),
                                child: Text(
                                  data.description,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 200, 0),
                                child: Container(
                                  child: Text(
                                    "ข้อมูลผู้เข้าร่วม",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 5, 3, 0),
                                child: Container(
                                    child: Text(
                                  "* กรอกข้อมูลของท่านให้ถูกต้อง เพื่อสิทธิประโยชน์ของตัวท่านเอง หากท่านกรอกข้อมูลไม่ถูกต้อง ท่านจะไม่สามารถแก้ไขข้อมูลได้ และระบบจะไม่รับผิดชอบความผิดพลาดของท่าน",
                                  style: TextStyle(
                                      fontSize: 11, color: Color(0xFFA3A3A3)),
                                )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 3, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              this.formRegister.name = value;
                                            },
                                            // autofocus: true,
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value.isNotEmpty &&
                                                  value.length > 2) {
                                                return null;
                                              } else if (value.length < 3 &&
                                                  value.isNotEmpty) {
                                                return 'ชื่อของคุณสั้นจนเกินไป';
                                              } else
                                                return 'กรอกชื่อของคุณ';
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'ชื่อ',
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                this.formRegister.surname =
                                                    value;
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'นามสกุล',
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 25, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            this.formRegister.contact_email =
                                                value;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "กรุณากรอกอีเมลล์ที่ใช้ติดต่อ";
                                            }
                                            if (!value.contains('@')) {
                                              return "กรุณากรอกอีเมลล์ให้ถูกต้อง";
                                            }
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'E-mail',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 25, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            this.formRegister.phone = value;
                                          },
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'เบอร์โทรศัพท์',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0)),
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
                    ],
                  ),
                ),
              ),
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
                    print(data.campaign_no);
                    registerCampaign(
                            this.formRegister.name,
                            this.formRegister.surname,
                            this.formRegister.contact_email,
                            this.formRegister.phone,
                            this.formRegister.uid,
                            this.formRegister.campaign_no)
                        .then((value) {
                      print(value.join_code);
                      setState(() {
                        successJoinCode = value.join_code;
                      });
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return qrCodeForJoinCampaign(data, value.join_code);
                      }));
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
