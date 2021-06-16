import 'package:farkplooktreeapp/components/farkPlookDialog.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/components/farkPlookCard.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

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
    Widget _buildPopupDialog(BuildContext context) {
      return FarkPlookDialog();
    }

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.04),
        color: Color(0xffF3FFF5),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: FlutterToggleTab(
                        height: 35,
                        width: 60,
                        borderRadius: 15,
                        initialIndex: 0,
                        selectedTextStyle: TextStyle(
                          color: Color(0xff176B37),
                          fontSize: 16,
                        ),
                        unSelectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        selectedBackgroundColors: [Colors.white],
                        unSelectedBackgroundColors: [Color(0xff40A848)],
                        labels: ["ปลูกล่าสุด", "ปลูกมากที่สุด"],
                        selectedLabelIndex: (index) {
                          setState(() {
                            print("Selected Index $index");
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 300),
                      child: Image.asset('images/searchFarkPlook.png'),
                    )
                  ],
                )),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FarkPlookCard(),
                    FarkPlookCard(),
                    FarkPlookCard(),
                    FarkPlookCard(),
                    FarkPlookCard(),
                    FarkPlookCard(),
                    FarkPlookCard()
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context));
                    },
                    color: Color(0xffDD582D),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    child: Text('ปลูกตอนนี้', style: TextStyle(fontSize: 20)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
