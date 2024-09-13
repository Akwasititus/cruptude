import 'package:flutter/material.dart';

class SellGiftCard {
  String imageURL;
  String text1;
  String text2;
  String amount;

  SellGiftCard(
      {required this.imageURL,
      required this.text1,
      required this.text2,
      required this.amount});
}

List<SellGiftCard> getGiftCard = [
  SellGiftCard(
      imageURL: 'images/bitcoin_symbol.png',
      text1: 'Amazon',
      text2: 'BTC',
      amount: '3.6'),
  SellGiftCard(
      imageURL: 'images/ethereum_symbol.png',
      text1: 'iTunes',
      text2: 'Gift Card',
      amount: '3.6'),
  SellGiftCard(
      imageURL: 'images/eos_symbol.png',
      text1: 'Apple',
      text2: 'Gift Card',
      amount: '3.6'),
  SellGiftCard(
      imageURL: 'images/tether.png',
      text1: 'Steam',
      text2: 'Gift Card',
      amount: '3.6'),
];
