import 'package:farkplooktreeapp/models/myDonateHistory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          width: 150,
          height: 100,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              data.displayName,
                              style: TextStyle(
                                  color: Color(0xff0F3754),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                            Container(
                              width: 300,
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              data.message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                            Container(
                              width: 300,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(Icons.credit_card, size: 15),
                                Text(
                                  " "+data.cardNum,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                            Container(
                              width: 300,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(Icons.monetization_on_outlined, size: 15),
                                Text(
                                  " "+data.donateAmount+" บาท",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
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
                            child: 
                            Text(
                              data.treeAmount.toString()+" ต้น",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,12),
                        child: Text(
                            DateFormat('dd MMMM yyyy kk:MM').format(data.donateTime),
                            style: TextStyle(fontSize: 12)),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
