import 'package:farkplooktreeapp/models/donateHistory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FarkPlookCard extends StatelessWidget {
  final Donation data;
  FarkPlookCard(this.data);
  @override
  Widget build(BuildContext context) {
    print(data);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: SizedBox(
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
                      padding: const EdgeInsets.fromLTRB(15, 7, 0, 0),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.displayName,
                            style: TextStyle(
                                color: Color(0xff0F3754),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.message,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )),
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
                              child: Text(
                                data.treeAmount.toString() + ' ต้น',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Text(
                            DateFormat('MMMM d, y kk:mm')
                                .format(data.donateTime),
                            style: TextStyle(fontSize: 12))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
