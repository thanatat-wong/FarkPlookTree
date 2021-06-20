import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentCard {
  String cardno;
  String expireMonth;
  String expireYear;
  String cardHolder;
  String cvv;

  PaymentCard({
    this.cardno,
    this.expireMonth,
    this.expireYear,
    this.cardHolder,
    this.cvv,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    return PaymentCard(
      cardno: json['card_no'],
      expireMonth: (json['expire_month'] < 10)
          ? "0" + json['expire_month'].toString()
          : json['expire_month'].toString(),
      expireYear: json['expire_year'].toString(),
      cardHolder: json['cardholder'],
      cvv: json['cvv'],
    );
  }
}

Future<List<PaymentCard>> fetchMyPaymentCard(String uid) async {
  final response = await http
      .get(Uri.parse('http://52.163.100.154/api/fpt/mypaymentcard/${uid}'));

  if (response.statusCode == 200) {
    List<PaymentCard> dataList = [];
    // If the server did return a 200 OK response,
    // then parse the JSON.
    for (int i = 0; i < json.decode(response.body).length; i++) {
      dataList.add(PaymentCard.fromJson(jsonDecode(response.body)[i]));
    }
    print(response.body);
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
