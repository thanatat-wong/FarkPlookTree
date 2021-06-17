import 'package:farkplooktreeapp/components/farkPlookCard.dart';
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
                  "ประวัติการบริจาค",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
