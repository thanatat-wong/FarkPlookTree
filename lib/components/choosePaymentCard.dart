import 'package:flutter/material.dart';

class ChoosePaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.91,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.only(bottom: 5),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Credit/Debit Card",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "THANATAT WONGABUT",
                      style: TextStyle(fontSize: 12, color: Color(0xffA3A3A3)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("XXXX XXXX XXXX 1234",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xffA3A3A3))),
                        ),
                        Text("10/28",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffA3A3A3)))
                      ],
                    ),
                  ],
                ),
                Image.asset('images/visa.png'),
              ]),
        ),
      ),
    );
  }
}
