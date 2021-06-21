import 'dart:convert';

import 'package:farkplooktreeapp/models/myJoinedCampaign.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CampaignHistory extends StatefulWidget {
  @override
  _CampaignHistoryState createState() => _CampaignHistoryState();
}

class _CampaignHistoryState extends State<CampaignHistory> {
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
      print(response.body);
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
        title: Text(
          "แคมเปญที่เคยเข้าร่วม",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
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
            FutureBuilder<List<MyJoinedCampaign>>(
              future: myJoinCampaignList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SizedBox(
                      width: 365,
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
      ),
    );
  }
}

class CampaignCard extends StatelessWidget {
  final MyJoinedCampaign data;
  CampaignCard(this.data);
  @override
  Widget build(BuildContext context) {
    String _path = 'http://52.163.100.154';
    var rtl;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 15, 10),
              child: Image.network(_path + data.thumbnail,
                  cacheHeight: 120, cacheWidth: 100),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 165, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.13,
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: BoxDecoration(
                        color: Color(0XFF0F3754),
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    child: new Center(
                      child: Text(
                        data.type,
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
                    data.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        (data.from_datetime.day.toString() ==
                                data.to_datetime.day.toString())
                            ? DateFormat('dd MMMM yyyy')
                                    .format(data.from_datetime) +
                                " " +
                                DateFormat('kk:mm').format(data.from_datetime) +
                                "-" +
                                DateFormat('kk:mm').format(data.to_datetime)
                            : (data.from_datetime.month.toString() ==
                                    data.to_datetime.month.toString())
                                ? DateFormat('dd').format(data.from_datetime) +
                                    "-" +
                                    DateFormat('dd MMMM yyyy')
                                        .format(data.to_datetime)
                                : DateFormat('dd MMMM yyyy kk:mm')
                                        .format(data.from_datetime) +
                                    " -" +
                                    "\n" +
                                    DateFormat('dd MMMM yyyy kk:mm')
                                        .format(data.to_datetime),
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 108, 0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 15),
                      SizedBox(width: 5.0),
                      Text(
                        data.location,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 6.0),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                //   child: Row(
                //     children: [
                //       Icon(Icons.people, size: 15),
                //       SizedBox(width: 5.0),
                //       Text(
                //         "29 ผู้เข้าร่วม",
                //         style: TextStyle(fontSize: 10),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
