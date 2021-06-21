import 'package:farkplooktreeapp/components/farkPlookDialog.dart';
import 'package:farkplooktreeapp/models/donateHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/components/farkPlookCard.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FarkPlook extends StatefulWidget {
  @override
  _FarkPlookState createState() => _FarkPlookState();
}

class _FarkPlookState extends State<FarkPlook> {
  Future<List<Donation>> lastedDonationList;
  Future<List<Donation>> topDonationList;
  String uid;
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    lastedDonationList = fetchLastedDonation();
    topDonationList = fetchTopDonation();
    this.uid = getUserID();
  }

  String getUserID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
    return uid.toString();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPopupDialog(BuildContext context) {
      return FarkPlookDialog(
        uid: uid,
      );
    }

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.04),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: FlutterToggleTab(
                        height: 35,
                        width: 60,
                        borderRadius: 15,
                        initialIndex: 0,
                        selectedTextStyle: TextStyle(
                          color: Color(0xff176B37),
                          fontSize: 16,
                        ),
                        unSelectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        selectedBackgroundColors: [Colors.white],
                        unSelectedBackgroundColors: [Color(0xff40A848)],
                        labels: ["ปลูกล่าสุด", "ปลูกมากที่สุด"],
                        selectedLabelIndex: (index) {
                          setState(() {
                            print("Selected Index $index");
                            selectedindex = index;
                          });
                        },
                      ),
                    ),
                  ],
                )),
            (selectedindex == 0)
                ? Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: RefreshIndicator(
                        onRefresh: () {
                          setState(() {
                            lastedDonationList = fetchLastedDonation();
                            topDonationList = fetchTopDonation();
                          });
                        },
                        child: Column(
                          children: [
                            FutureBuilder<List<Donation>>(
                              future: lastedDonationList,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.49,
                                    width: 400,
                                    child: new ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      reverse: false,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          FarkPlookCard(snapshot.data[index]),
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
                    ),
                  )
                : Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: RefreshIndicator(
                        onRefresh: fetchTopDonation,
                        child: Column(
                          children: [
                            FutureBuilder<List<Donation>>(
                              future: topDonationList,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: 600,
                                    width: 400,
                                    child: new ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      reverse: false,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          FarkPlookCard(snapshot.data[index]),
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
                    ),
                  ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context)).then((value) {
                        initState();
                        setState(() {});
                      });
                    },
                    color: Color(0xffDD582D),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    child: Text('ปลูกตอนนี้', style: TextStyle(fontSize: 20)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
