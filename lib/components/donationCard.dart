import 'package:farkplooktreeapp/models/donateHistory.dart';
import 'package:farkplooktreeapp/models/myDonateHistory.dart';
import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  final MyDonation data;
  DonationCard(this.data);
  @override
  Widget build(BuildContext context) {
    print(data);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'images/world2.png',
                  height: 60,
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        data.displayName,
                        style: TextStyle(
                            color: Color(0xff0F3754),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: Color(0xff40A848),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 25,
                            child: Text(
                              data.treeAmount.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Text(
                          data.donateTime.month.toString() +
                              " " +
                              data.donateTime.day.toString() +
                              ", " +
                              data.donateTime.year.toString() +
                              " " +
                              data.donateTime.hour.toString() +
                              ":" +
                              data.donateTime.minute.toString(),
                          style: TextStyle(fontSize: 12))
                    ],
                  ))
            ],
          ),
          height: 80,
          width: 340,
        ),
      ),
    );
  }
}
