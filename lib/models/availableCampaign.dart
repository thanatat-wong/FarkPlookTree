import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AvailableCampaign {
  final String campaign_no;
  final String name;
  final String description;
  final String limitation;
  final DateTime from_datetime;
  final DateTime to_datetime;
  final String location;
  final bool isenable;
  final String thumbnail;
  final String type;
  final String attendee;
  final bool isRegistered;

  AvailableCampaign(
      {this.campaign_no,
      this.name,
      this.description,
      this.limitation,
      this.from_datetime,
      this.to_datetime,
      this.location,
      this.isenable,
      this.thumbnail,
      this.type,
      this.attendee,
      this.isRegistered});

  factory AvailableCampaign.fromJson(Map<String, dynamic> json) {
    return AvailableCampaign(
      campaign_no: json['campaign_no'].toString(),
      name: json['name'],
      description: json['description'],
      limitation: json['limitation'].toString(),
      from_datetime: DateTime.parse(json['from_datetime']),
      to_datetime: DateTime.parse(json['to_datetime']),
      location: json['location'],
      isenable: (json['isenable'].toString() == '1') ? true : false,
      thumbnail: json['thumbnail'],
      type: json['type'],
      attendee: json['attendee'].toString(),
      isRegistered: (json['isRegistered'].toString() == "1") ? true : false,
    );
  }
}

Future<List<AvailableCampaign>> fetchAvailableCampaign(String id) async {
  final response = await http
      .get(Uri.parse('http://52.163.100.154/api/fpt/availableCampaign/$id'));

  if (response.statusCode == 200) {
    List<AvailableCampaign> dataList = [];
    // If the server did return a 200 OK response,
    // then parse the JSON.
    for (int i = 0; i < json.decode(response.body).length; i++) {
      dataList.add(AvailableCampaign.fromJson(jsonDecode(response.body)[i]));
    }
    print(response.body);
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load AvailableCampaign');
  }
}
