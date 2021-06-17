import 'dart:convert';

import 'package:farkplooktreeapp/models/myJoinedCampaign.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class campaignHistory extends StatefulWidget {
  @override
  _campaignHistoryState createState() => _campaignHistoryState();
}

class _campaignHistoryState extends State<campaignHistory> {
  String uid;
  Future<List<MyJoinedCampaign>> myJoinCampaignList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = getUserID();
    print(uid);
    myJoinCampaignList = fetchCampaignHistory(uid);
  }

  String getUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    uid = user.uid;
    return uid;
  }

  Future<List<MyJoinedCampaign>> fetchCampaignHistory(userid) async {
    final response = await http.get(
        Uri.parse('http://52.163.100.154/api/fpt/myjoinedcampaign/${userid}'));

    if (response.statusCode == 200) {
      List<MyJoinedCampaign> dataList = [];
      // If the server did return a 200 OK response,
      // then parse the JSON.
      for (int i = 0; i < json.decode(response.body).length; i++) {
        dataList.add(MyJoinedCampaign.fromJson(jsonDecode(response.body)[i]));
      }
      return dataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Campaign');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "แคมเปญที่เคยเข้าร่วม",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          FutureBuilder<List<MyJoinedCampaign>>(
            future: myJoinCampaignList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: SizedBox(
                    height: 200,
                    child: new ListView.builder(
                      scrollDirection: Axis.vertical,
                      reverse: false,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          CampaignCard(snapshot.data.elementAt(index)),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class CampaignCard extends StatelessWidget {
  final MyJoinedCampaign data;
  CampaignCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 350,
        height: 160,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 15, 10),
              child: Image.asset("assets/images_login_fresh_34_/image 23.png"),
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
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    child: new Center(
                      child: Text(
                        "Volunteer",
                        style: TextStyle(color: Colors.white, fontSize: 10),
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
    );
  }
}
