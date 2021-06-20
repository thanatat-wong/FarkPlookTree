import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterCampaignModel {
  String name;
  String surname;
  String contact_email;
  String phone;
  String uid;
  String campaign_no;

  RegisterCampaignModel(
      {this.name,
      this.surname,
      this.contact_email,
      this.phone,
      this.uid,
      this.campaign_no});
}
