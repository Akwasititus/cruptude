import 'package:flutter/material.dart';

class TransactionHistory {
  String cryptoLogoUrl;
  String currency;
  String amount;
  String address;
  String transactionID;

  TransactionHistory(
      {required this.amount,
      required this.transactionID,
      required this.address,
      required this.cryptoLogoUrl,
      required this.currency});
}

List<TransactionHistory> getTransactionHistory = [
  TransactionHistory(
      amount: "1,641.20 BTC",
      address: "3DkQyAdof6kQlpMBu",
      transactionID: "3DkQyAdof6kQlpMBu",
      cryptoLogoUrl: 'images/BitcoinMainYello.png',
      currency: "Bitcoin"),
  TransactionHistory(
      amount: "1,641.20 BTC",
      address: "3DkQyAdof6kQlpMBu",
      transactionID: "3DkQyAdof6kQlpMBu",
      cryptoLogoUrl: 'images/BitcoinMainYello.png',
      currency: "Bitcoin"),
  TransactionHistory(
      amount: "1,641.20 BTC",
      address: "3DkQyAdof6kQlpMBu",
      transactionID: "3DkQyAdof6kQlpMBu",
      cryptoLogoUrl: 'images/BitcoinMainYello.png',
      currency: "Bitcoin"),
  TransactionHistory(
      amount: "1,641.20 BTC",
      address: "3DkQyAdof6kQlpMBu",
      transactionID: "3DkQyAdof6kQlpMBu",
      cryptoLogoUrl: 'images/BitcoinMainYello.png',
      currency: "Bitcoin"),
  TransactionHistory(
      amount: "1,641.20 BTC",
      address: "3DkQyAdof6kQlpMBu",
      transactionID: "3DkQyAdof6kQlpMBu",
      cryptoLogoUrl: 'images/BitcoinMainYello.png',
      currency: "Bitcoin"),
];
