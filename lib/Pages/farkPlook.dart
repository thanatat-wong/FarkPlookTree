import 'package:farkplooktreeapp/components/farkPlookDialog.dart';
import 'package:flutter/material.dart';
import 'package:farkplooktreeapp/components/farkPlookCard.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class FarkPlook extends StatefulWidget {
  @override
  _FarkPlookState createState() => _FarkPlookState();
}

class _FarkPlookState extends State<FarkPlook> {
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
