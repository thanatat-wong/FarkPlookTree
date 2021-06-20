import 'package:farkplooktreeapp/Pages/choosePaymentPage.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
        child: Column(
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
                          "คุณต้องชำระเงิน",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("79.00",
                              style: TextStyle(
                                  fontSize: 50, color: Color(0xff3EAF51))),
                          Container(
                            padding: EdgeInsets.only(top: 22, left: 5),
                            child:
                                Text(" BAHT", style: TextStyle(fontSize: 20)),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChoosePaymentPage()),
                                );
                              },
                              child: Text('เลือกวิธีการชำระเงิน'))
                        ],
                      )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/visa.png'),
                          Text('xxxx xxxx xxxx 1234 (12/21)')
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('จ่ายให้'),
                          TextButton(
                              onPressed: () {}, child: Text('ดูรายละเอียด'))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('เลขอ้างอิง'),
                          Text('45768902913'),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รวมราคาทั้งหมด (ไม่รวมภาษี)'),
                          Text('79.00 Baht'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('รวมราคาทั้งหมด (รวมภาษี)'),
                          Text('79.00 Baht'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.9,
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
        ),
      ),
    );
  }
}
