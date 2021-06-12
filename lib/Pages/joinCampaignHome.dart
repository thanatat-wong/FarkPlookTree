import 'package:flutter/material.dart';

class JoinCampaign extends StatefulWidget {
  @override
  _JoinCampaignState createState() => _JoinCampaignState();
}

class _JoinCampaignState extends State<JoinCampaign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }
}
