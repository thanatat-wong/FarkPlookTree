import 'package:flutter/material.dart';

class FarkPlookDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "ฝากเราปลูก",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff467240),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "เพียงต้นละ 30 บาท",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff467240),
                      ),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 114,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "5 ต้น",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 114,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "10 ต้น",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 114,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "15 ต้น",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 114,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "20 ต้น",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: 260,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10, left: 15),
                            border: OutlineInputBorder(),
                            hintText: 'ระบุจำนวนต้น',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Divider(
                    thickness: 2,
                    indent: 50,
                    endIndent: 50,
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  width: 240,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xffDD582D),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('ปลูกตอนนี้', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
