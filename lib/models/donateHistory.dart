import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Donation {
  final String displayName;
  final int treeAmount;
  final DateTime donateTime;
  final String message;
  final int transNum;

  const Donation(
      {@required this.displayName,
      @required this.treeAmount,
      @required this.donateTime,
      @required this.message,
      @required this.transNum});
  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      displayName: json['displayname'],
      treeAmount: json['tree_amount'],
      donateTime: DateTime.parse(json['donate_datetime']),
      message: json['message'],
      transNum: json['transaction_no'],
    );
  }
}

Future<List<Donation>> fetchLastedDonation() async {
  final response =
      await http.get(Uri.parse('http://52.163.100.154/api/fpt/donatehistory'));

  if (response.statusCode == 200) {
    List<Donation> dataList = [];
    // If the server did return a 200 OK response,
    // then parse the JSON.
    for (int i = 0; i < json.decode(response.body).length; i++) {
      dataList.add(Donation.fromJson(jsonDecode(response.body)[i]));
    }
    print('------------LASTED DONATION------------');
    print(response.body);
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Donation>> fetchTopDonation() async {
  final response = await http
      .get(Uri.parse('http://52.163.100.154/api/fpt/topdonatehistory'));

  if (response.statusCode == 200) {
    List<Donation> dataList = [];
    // If the server did return a 200 OK response,
    // then parse the JSON.
    for (int i = 0; i < json.decode(response.body).length; i++) {
      dataList.add(Donation.fromJson(jsonDecode(response.body)[i]));
    }
    print('------------TOP DONATION------------');
    print(response.body);
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
