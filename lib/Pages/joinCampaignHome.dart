import 'package:farkplooktreeapp/Pages/registerCampaign.dart';
import 'package:farkplooktreeapp/models/availableCampaign.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JoinCampaign extends StatefulWidget {
  final String uid;
  JoinCampaign(this.uid);
  @override
  _JoinCampaignState createState() => _JoinCampaignState(uid: uid);
}

class _JoinCampaignState extends State<JoinCampaign> {
  final String uid;
  _JoinCampaignState({@required this.uid});
  Future<List<AvailableCampaign>> availableCampaignList;
  @override
  void initState() {
    super.initState();
    availableCampaignList = fetchAvailableCampaign(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<AvailableCampaign>>(
                future: availableCampaignList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 1,
                      child: new ListView.builder(
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CampaignCard(snapshot.data[index]),
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
    );
  }
}

class CampaignCard extends StatelessWidget {
  final AvailableCampaign data;
  CampaignCard(this.data);
  @override
  Widget build(BuildContext context) {
    String _path = 'http://52.163.100.154';
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.26,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 3,
                          offset: Offset(2, 4))
                    ]),
                child: Row(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Image.network(_path + data.thumbnail,
                            cacheHeight: 170, cacheWidth: 120),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.0),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.17,
                            height: MediaQuery.of(context).size.height * 0.03,
                            decoration: BoxDecoration(
                                color: Color(0XFF0F3754),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
                            child: new Center(
                              child: Text(
                                data.type,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.26,
                            child: Text(
                              data.name,
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
                                (data.from_datetime.day.toString() ==
                                        data.to_datetime.day.toString())
                                    ? DateFormat('dd MMMM yyyy')
                                            .format(data.from_datetime) +
                                        " " +
                                        DateFormat('kk:mm')
                                            .format(data.from_datetime) +
                                        "-" +
                                        DateFormat('kk:mm')
                                            .format(data.to_datetime)
                                    : (data.from_datetime.month.toString() ==
                                            data.to_datetime.month.toString())
                                        ? DateFormat('dd')
                                                .format(data.from_datetime) +
                                            "-" +
                                            DateFormat('dd MMMM yyyy')
                                                .format(data.to_datetime)
                                        : DateFormat('dd MMMM yyyy kk:mm')
                                                .format(data.from_datetime) +
                                            " -" +
                                            "\n" +
                                            DateFormat('dd MMMM yyyy kk:mm')
                                                .format(data.to_datetime),
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 15),
                              SizedBox(width: 5.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  data.location,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Icon(Icons.people, size: 15),
                              SizedBox(width: 5.0),
                              Text(
                                data.attendee +
                                    "/" +
                                    data.limitation +
                                    " ผู้เข้าร่วม",
                                style: TextStyle(fontSize: 13),
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
                      MediaQuery.of(context).size.height * 0.195,
                      MediaQuery.of(context).size.width * 0.020,
                      0),
                  child: (data.isRegistered)
                      ? FlatButton(
                          child: Text(
                            "ลงทะเบียนแล้ว",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: Color(0xFFB0B0B0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                        )
                      : FlatButton(
                          child: Text(
                            "ลงทะเบียน",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: Color(0xFF3EAF51),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegisterCampaign(data)));
                          },
                        )),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.015,
        )
      ],
    );
  }
}

class CampaignCardNoRegisterBtn extends StatelessWidget {
  final AvailableCampaign data;
  CampaignCardNoRegisterBtn(this.data);
  @override
  Widget build(BuildContext context) {
    String _path = 'http://52.163.100.154';
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.86,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3,
                      offset: Offset(2, 4))
                ]),
            child: Row(
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Image.network(_path + data.thumbnail,
                        cacheHeight: 170, cacheWidth: 120),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                            color: Color(0XFF0F3754),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        child: new Center(
                          child: Text(
                            data.type,
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          data.name,
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
                            (data.from_datetime.day.toString() ==
                                    data.to_datetime.day.toString())
                                ? DateFormat('dd MMMM yyyy')
                                        .format(data.from_datetime) +
                                    " " +
                                    DateFormat('kk:mm')
                                        .format(data.from_datetime) +
                                    "-" +
                                    DateFormat('kk:mm').format(data.to_datetime)
                                : (data.from_datetime.month.toString() ==
                                        data.to_datetime.month.toString())
                                    ? DateFormat('dd')
                                            .format(data.from_datetime) +
                                        "-" +
                                        DateFormat('dd MMMM yyyy')
                                            .format(data.to_datetime)
                                    : DateFormat('dd MMMM yyyy kk:mm')
                                            .format(data.from_datetime) +
                                        " -" +
                                        "\n" +
                                        DateFormat('dd MMMM yyyy kk:mm')
                                            .format(data.to_datetime),
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 15),
                          SizedBox(width: 5.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              data.location,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Icon(Icons.people, size: 15),
                          SizedBox(width: 5.0),
                          Text(
                            data.attendee +
                                "/" +
                                data.limitation +
                                " ผู้เข้าร่วม",
                            style: TextStyle(fontSize: 13),
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
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.015,
        )
      ],
    );
  }
}
