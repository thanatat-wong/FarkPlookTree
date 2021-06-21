import 'dart:convert';

import 'package:farkplooktreeapp/models/paymentcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:credit_card_validate/credit_card_validate.dart';
import 'package:http/http.dart' as http;

class AddCardPage extends StatefulWidget {
  final String uid;
  AddCardPage({this.uid});
  @override
  State<AddCardPage> createState() => _AddCardPageState(uid: uid);
}

class _AddCardPageState extends State<AddCardPage> {
  final String uid;
  _AddCardPageState({this.uid});
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String cardType = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addMyCard(String card_no, String expire_month,
      String expire_year, String cardholder, String uid, String cvv) async {
    print(card_no);
    final response = await http.post(
      Uri.parse('http://52.163.100.154/api/fpt/addpaymentcard'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "card_no": card_no,
        "expire_month": expire_month,
        "expire_year": expire_year,
        "cardholder": cardholder,
        "uid": uid,
        "cvv": cvv
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Navigator.pop(
          context,
          new PaymentCard(
              cardno: card_no,
              expireMonth: expiryDate.substring(0, 2),
              expireYear: expiryDate.substring(3, 5),
              cvv: cvvCode,
              cardHolder: cardHolderName));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Register Campaign');
    }
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "กรอกข้อมูลบัตร",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 650,
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        showBackView: isCvvFocused,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        cardBgColor: Colors.black,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              themeColor: Colors.blue,
                              cardNumberDecoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                              ),
                              expiryDateDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Card Holder',
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      print('valid!');
                                      print(
                                          CreditCardValidator.identifyCardBrand(
                                              cardNumber));
                                      addMyCard(
                                        cardNumber.replaceAll(' ', ''),
                                        expiryDate.substring(0, 2),
                                        expiryDate.substring(3, 5),
                                        cardHolderName,
                                        uid,
                                        cvvCode,
                                      );
                                    } else {
                                      print('invalid!');
                                      print(
                                          CreditCardValidator.identifyCardBrand(
                                              cardNumber));
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                          MediaQuery.of(context).size.height *
                                              0.055),
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      backgroundColor: Color(0xffDD582D)),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
