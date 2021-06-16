import 'package:flutter/material.dart';

class JoinCampaign extends StatefulWidget {
  @override
  _JoinCampaignState createState() => _JoinCampaignState();
}

class _JoinCampaignState extends State<JoinCampaign> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.265,
            color: Colors.white,
            // color: Colors.blue,
            // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
            // height: MediaQuery.of(context).size.height * 0.6,
            // width: MediaQuery.of(context).size.width * 0.9,
            // padding: EdgeInsets.fromLTRB(20,0,0,120),
            child: Row(
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Image.asset(
                        "assets/images_login_fresh_34_/image 23.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: FlatButton(
                          child: Text(
                            "Volunteer",
                            style: TextStyle(fontSize: 11),
                          ),
                          color: Color(0xFFDD582D),
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.26,
                        child: Text(
                          "อาสาปลูกป่าเพื่ออนุรักษ์กวางลายดาว สวนสัตว์ขอนแก่น",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 15,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "23 กรกฎาคม 2564 7:00 - 15:00 น.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 15),
                          SizedBox(width: 5.0),
                          Text(
                            "สวนสัตว์ขอนแก่น",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Icon(Icons.people, size: 15),
                          SizedBox(width: 5.0),
                          Text(
                            "29 ผู้เข้าร่วม",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.width * 0.38,
                  MediaQuery.of(context).size.width * 0.025,
                  0),
              child: FlatButton(
                child: Text(
                  "สมัครเข้าร่วม",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                color: Color(0xFF3EAF51),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
              )),
        )
      ],
    );
  }
}
