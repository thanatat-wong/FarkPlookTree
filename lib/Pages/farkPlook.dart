import 'package:flutter/material.dart';

class FarkPlook extends StatefulWidget {
  @override
  _FarkPlookState createState() => _FarkPlookState();
}

class _FarkPlookState extends State<FarkPlook> {
  // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
  // height: MediaQuery.of(context).size.height * 0.6,
  // width: MediaQuery.of(context).size.width * 0.9,

  Future<void> _showMyDialog() async {
    TextEditingController numberTree;
    bool fiveBtn = true;
    bool twentyBtn = false;
    bool fiftyBtn = false;
    bool hundredBtn = false;
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            return GestureDetector(
              onTap: () {
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: AlertDialog(
                title: const Text("ฝากเราปลูก เพียงต้นละ 30 บาท"),
                content: Container(
                  height: 170,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "5 ต้น",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                color: fiveBtn ? Colors.grey : Colors.white,
                                onPressed: () => {
                                  currentFocus.unfocus(),
                                  setState(() {
                                    fiveBtn = true;
                                    twentyBtn = false;
                                    fiftyBtn = false;
                                    hundredBtn = false;
                                  }),
                                },
                              ),
                            ),
                            Container(
                              child: FlatButton(
                                  child: Text(
                                    "20 ต้น",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  color: twentyBtn ? Colors.grey : Colors.white,
                                  onPressed: () => {
                                        currentFocus.unfocus(),
                                        setState(() {
                                          fiveBtn = false;
                                          twentyBtn = true;
                                          fiftyBtn = false;
                                          hundredBtn = false;
                                        }),
                                      }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: Row(
                          children: [
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "50 ต้น",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                color: fiftyBtn ? Colors.grey : Colors.white,
                                onPressed: () => {
                                  setState(() {
                                    fiveBtn = false;
                                    twentyBtn = false;
                                    fiftyBtn = true;
                                    hundredBtn = false;
                                  }),
                                },
                              ),
                            ),
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "100 ต้น",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                color: hundredBtn ? Colors.grey : Colors.white,
                                onPressed: () => {
                                  setState(() {
                                    fiveBtn = false;
                                    twentyBtn = false;
                                    fiftyBtn = false;
                                    hundredBtn = true;
                                  }),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: numberTree,
                        onTap: () => {
                          setState(() {
                            fiveBtn = false;
                            twentyBtn = false;
                            fiftyBtn = false;
                            hundredBtn = false;
                          }),
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ระบุจำนวนต้นไม้ที่ต้องการปลูก'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Next'),
                    child: const Text("ถัดไป"),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 40,
      width: 130,
      child: FlatButton(
          child: Text(
            "ปลูกตอนนี้",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          color: Color(0xFFDD582D),
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => {
                _showMyDialog(),
              }),
    );
  }
}
