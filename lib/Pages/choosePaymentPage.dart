import 'package:farkplooktreeapp/Pages/addCardPage.dart';
import 'package:farkplooktreeapp/components/choosePaymentCard.dart';
import 'package:farkplooktreeapp/models/paymentcard.dart';
import 'package:flutter/material.dart';

class ChoosePaymentPage extends StatefulWidget {
  final String uid;

  ChoosePaymentPage({this.uid});
  @override
  _ChoosePaymentPageState createState() => _ChoosePaymentPageState(uid: uid);
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  final String uid;
  Future<List<PaymentCard>> myCardList;
  List<PaymentCard> cardList = [];
  _ChoosePaymentPageState({this.uid});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            FutureBuilder<List<PaymentCard>>(
                future: myCardList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    this.cardList = snapshot.data;
                    return Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                  onTap: () => {
                                        Navigator.pop(
                                            context, cardList.elementAt(index)),
                                      },
                                  child: ChoosePaymentCard(
                                      data: cardList.elementAt(index))),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                }),
            TextButton(
                onPressed: () {
                  _awaitReturnValueFromChoosePaymentMethodScreen(uid);
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

  void _awaitReturnValueFromChoosePaymentMethodScreen(String uid) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddCardPage(
                uid: uid,
              )),
    );

    // after the SecondScreen result comes back update the Text widget with it
    if (result != null) {
      print(result);
      setState(() {
        this.cardList.add(result);
      });
    }
    initState();
  }
}
