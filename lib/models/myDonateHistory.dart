import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDonation {
  final String displayName;
  final int treeAmount;
  final String donateAmount;
  final DateTime donateTime;
  final String cardNum;
  final String message;
  final int transNum;

  const MyDonation(
      {@required this.displayName,
      @required this.treeAmount,
      @required this.donateTime,
      @required this.message,
      @required this.donateAmount,
      @required this.cardNum,
      @required this.transNum});
  factory MyDonation.fromJson(Map<String, dynamic> json) {
    return MyDonation(
      displayName: json['displayname'],
      treeAmount: json['tree_amount'],
      donateTime: DateTime.parse(json['donate_datetime']),
      message: json['message'],
      transNum: json['transaction_no'],
      cardNum: json['card_no'],
      donateAmount: json['donate_amount'].toString(),
    );
  }
}

Future<List<MyDonation>> fetchDonateHistory(String uid) async {
  final response = await http
      .get(Uri.parse('http://52.163.100.154/api/fpt/donatehistory/${uid}'));

  if (response.statusCode == 200) {
    List<MyDonation> dataList = [];
    // If the server did return a 200 OK response,
    // then parse the JSON.
    for (int i = 0; i < json.decode(response.body).length; i++) {
      dataList.add(MyDonation.fromJson(jsonDecode(response.body)[i]));
    }
    print(response.body);
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

