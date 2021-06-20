import 'package:farkplooktreeapp/Pages/addCardPage.dart';
import 'package:farkplooktreeapp/components/choosePaymentCard.dart';
import 'package:farkplooktreeapp/models/paymentcard.dart';
import 'package:flutter/material.dart';

class ChoosePaymentPage extends StatefulWidget {
  final List<PaymentCard> cardList;
  ChoosePaymentPage({this.cardList});
  @override
  _ChoosePaymentPageState createState() =>
      _ChoosePaymentPageState(cardList: cardList);
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  Future<List<PaymentCard>> myCardList;
  final List<PaymentCard> cardList;
  _ChoosePaymentPageState({this.cardList});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'เลือกบัตรที่ต้องการจะชำระ',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: new ListView.builder(
                  scrollDirection: Axis.vertical,
                  reverse: false,
                  itemCount: cardList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                          onTap: () => {
                                Navigator.pop(context, index),
                              },
                          child: ChoosePaymentCard(
                              data: cardList.elementAt(index))),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCardPage()),
                  );
                },
                child: Text('Add card', style: TextStyle(fontSize: 15)),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff0F3754),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.05),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ))
          ],
        ),
      ),
    );
  }
}
