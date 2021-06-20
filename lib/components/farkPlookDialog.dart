import 'package:farkplooktreeapp/Pages/paymentPage.dart';
import 'package:farkplooktreeapp/models/farkplookFormModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FarkPlookDialog extends StatefulWidget {
  final String uid;
  FarkPlookDialog({
    @required this.uid,
  });
  @override
  State<FarkPlookDialog> createState() => _FarkPlookDialogState(uid: uid);
}

class _FarkPlookDialogState extends State<FarkPlookDialog> {
  FarkPlookFormModel form = new FarkPlookFormModel();
  final String uid;
  _FarkPlookDialogState({@required this.uid});
  int page = 0;
  @override
  void initState() {
    super.initState();
    this.form.plantNum = 5;
  }

  clearTextInput() {
    nameHolder.clear();
  }

  final nameHolder = TextEditingController();
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
          child: (page == 0)
              ? Column(
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
                                  style: OutlinedButton.styleFrom(
                                    primary: this.form.plantNum == 5
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: this.form.plantNum == 5
                                        ? Color(0xff40A848)
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    clearTextInput();
                                    setState(() {
                                      this.form.plantNum = 5;
                                    });
                                  },
                                  child: Text(
                                    "5 ต้น",
                                  ),
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    primary: this.form.plantNum == 10
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: this.form.plantNum == 10
                                        ? Color(0xff40A848)
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    clearTextInput();
                                    setState(() {
                                      this.form.plantNum = 10;
                                    });
                                  },
                                  child: Text(
                                    "10 ต้น",
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
                                  style: OutlinedButton.styleFrom(
                                    primary: this.form.plantNum == 15
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: this.form.plantNum == 15
                                        ? Color(0xff40A848)
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    clearTextInput();
                                    setState(() {
                                      this.form.plantNum = 15;
                                    });
                                  },
                                  child: Text(
                                    "15 ต้น",
                                  ),
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    primary: this.form.plantNum == 20
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: this.form.plantNum == 20
                                        ? Color(0xff40A848)
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    clearTextInput();
                                    setState(() {
                                      this.form.plantNum = 20;
                                    });
                                  },
                                  child: Text(
                                    "20 ต้น",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: 250,
                              height: 50,
                              child: TextField(
                                controller: nameHolder,
                                onTap: () {
                                  this.form.plantNum = 0;
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    this.form.plantNum = int.parse(value);
                                  });
                                  print(this.form.plantNum);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 15),
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
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 40,
                            child: RaisedButton(
                              onPressed: () {
                                print(this.form.plantNum);
                                setState(() {
                                  page++;
                                });
                                initState();
                              },
                              color: Color(0xffDD582D),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('ปลูกตอนนี้',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        splashRadius: 22,
                        iconSize: 20,
                        color: Color(0xff40A848),
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          setState(() {
                            page--;
                          });
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                      child: Text(
                        "ชื่อที่ใช้แสดงผล",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff467240),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        width: 250,
                        height: 40,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              this.form.displayName = value;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10, left: 15),
                            border: OutlineInputBorder(),
                            hintText: 'นามแฝง',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                      child: Text(
                        "ข้อความประชาสัมพันธ์",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff467240),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        width: 250,
                        height: 80,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          onChanged: (value) {
                            setState(() {
                              this.form.message = value;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10, left: 15),
                            border: OutlineInputBorder(),
                            hintText: 'ระบุข้อความที่ใช้แสดงผลบนหน้าแอพ',
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Divider(
                          thickness: 2,
                          indent: 50,
                          endIndent: 50,
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 40,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentPage(form: form, uid: uid)),
                                );
                              },
                              color: Color(0xffDD582D),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text('สรุปรายการค่าใช้จ่าย',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
