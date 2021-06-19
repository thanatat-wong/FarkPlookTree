import 'package:farkplooktreeapp/components/donationCard.dart';
import 'package:farkplooktreeapp/components/farkPlookCard.dart';
import 'package:farkplooktreeapp/models/myDonateHistory.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class donationPage extends StatefulWidget {
  @override
  _donationPageState createState() => _donationPageState();
}

class _donationPageState extends State<donationPage> {
  String uid;
  Future<List<MyDonation>> myJoinCampaignList;
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = getUserID();
    print(uid);
    myJoinCampaignList = fetchDonateHistory(uid);
  }

  String getUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    uid = user.uid;
    return uid;
  }

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
        appBar: AppBar(
          title: Text("ประวัติการบริจาค",
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
        body: Column(
          children: [
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: FutureBuilder<List<MyDonation>>(
                future: myJoinCampaignList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: SizedBox(
                        height: 680,
                        child: new ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              DonationCard(snapshot.data.elementAt(index)),
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
            ),
          ],
        ),
      ),
    );
  }
}
