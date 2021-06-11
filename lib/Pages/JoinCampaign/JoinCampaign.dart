import 'package:flutter/material.dart';

class joinCampaign extends StatefulWidget {
  @override
  _joinCampaignState createState() => _joinCampaignState();
}

class _joinCampaignState extends State<joinCampaign> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0XFF3EAF51),
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Tutorials'),
              Tab(text: 'Test',)
            ]
          ),
        ),
      ),
    );
  }
}