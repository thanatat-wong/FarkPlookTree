import 'dart:convert';

import 'package:farkplooktreeapp/models/paymentcard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FarkPlookFormModel {
  int plantNum;
  String displayName;
  String message;
  double donateAmount;
  String refno;
  PaymentCard card;

  FarkPlookFormModel({
    this.plantNum,
    this.displayName,
    this.message,
    this.donateAmount,
    this.refno,
    this.card,
  });
}


