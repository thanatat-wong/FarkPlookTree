import 'dart:convert';
import 'dart:math';
import 'package:farkplooktreeapp/Pages/choosePaymentPage.dart';
import 'package:farkplooktreeapp/models/farkplookFormModel.dart';
import 'package:farkplooktreeapp/models/paymentcard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final FarkPlookFormModel form;
  final String uid;

  const PaymentPage({@required this.form, @required this.uid});

  @override
  _PaymentPageState createState() => _PaymentPageState(form: form, uid: uid);
}

class _PaymentPageState extends State<PaymentPage> {
  Future<List<PaymentCard>> myCardList;
  PaymentCard selectedCard = new PaymentCard();
  final FarkPlookFormModel form;
  final String uid;
  _PaymentPageState({@required this.form, @required this.uid});

  final chars = "0123456789";
  String randomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  Future<void> completeDonatePayment() async {
    final response = await http.post(
      Uri.parse('http://52.163.100.154/api/fpt/donate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "uid": uid,
        "tree_amount": form.plantNum.toString(),
        "message": form.message,
        "displayname": form.displayName,
        "donate_amount": form.donateAmount.toString(),
        "card_no": form.card.cardno,
        "refno": form.refno
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Register Campaign');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.form.refno = randomString(11);
    this.form.donateAmount = form.plantNum.toDouble() * 30;
    myCardList = fetchMyPaymentCard(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff3EAF51),
      body: Center(
        child: FutureBuilder<List<PaymentCard>>(
            future: myCardList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  selectedCard =
                      snapshot.data.elementAt(snapshot.data.length - 1);
                } else {}

                form.card = selectedCard;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.63,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "กรุณาชำระเงิน",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(form.donateAmount.toString(),
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Color(0xff3EAF51))),
                                  Container(
                                    padding: EdgeInsets.only(top: 22, left: 5),
                                    child: Text(" BAHT",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Container(
                                  child: Row(
                                children: [
                                  Text(
                                    "วิธีการชำระเงิน",
                                    style: TextStyle(color: Color(0xffA0A0A0)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        _awaitReturnValueFromChoosePaymentMethodScreen(
                                            context, snapshot.data, uid);
                                      },
                                      child: Text('เลือกวิธีการชำระเงิน'))
                                ],
                              )),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('images/visa.png'),
                                  (this.selectedCard.cardno != null)
                                      ? Text(
                                          'xxxx xxxx xxxx ${this.selectedCard.cardno.substring(this.selectedCard.cardno.length - 4, this.selectedCard.cardno.length)} (${this.selectedCard.expireMonth}/${this.selectedCard.expireYear})')
                                      : Text('Please Add Card'),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('จ่ายให้'),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('ดูรายละเอียด'))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('เลขอ้างอิง'),
                                  Text(this.form.refno.toString()),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              Text('รายละเอียดการชำระเงิน'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('รวมราคาทั้งหมด (ไม่รวมภาษี)'),
                                  Text('${form.donateAmount.toString()} Baht'),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ภาษี'),
                                  Text('0.00 Baht'),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('รวมราคาทั้งหมด (รวมภาษี)'),
                                  Text('${form.donateAmount.toString()}  Baht'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          print('Heyt1');
                          print(selectedCard.cardno);
                          print('Heyt2');
                          print(form.card.cardno);
                          completeDonatePayment();
                        },
                        style: TextButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.9,
                                MediaQuery.of(context).size.height * 0.055),
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            backgroundColor: Color(0xffDD582D)),
                        child: Text(
                          'Pay now',
                          style: TextStyle(fontSize: 15),
                        )),
                    SizedBox()
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  void _awaitReturnValueFromChoosePaymentMethodScreen(
      BuildContext context, List<PaymentCard> cardListnaja, String uid) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChoosePaymentPage(
                uid: uid,
              )),
    );

    // after the SecondScreen result comes back update the Text widget with it
    if (result != null) {
      print(result);
      setState(() {
        this.selectedCard.cardno = result.cardno;
        this.selectedCard.cardHolder = result.cardHolder;
        this.selectedCard.cvv = result.cvv;
        this.selectedCard.expireMonth = result.expireMonth;
        this.selectedCard.expireYear = result.expireYear;
        form.card = result;
      });
      print(selectedCard.cardno);
    }
  }
}
