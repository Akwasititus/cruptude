import 'package:flutter/material.dart';

class Crypto {
  String imageURL;
  String text1;
  String text2;
  String amount;

  Crypto(
      {required this.imageURL,
      required this.text1,
      required this.text2,
      required this.amount});
}

List<Crypto> getCrypto = [
  Crypto(
      imageURL: 'images/bitcoin_symbol.png',
      text1: 'BitCoin',
      text2: 'BTC',
      amount: '\$36,641.20'),
  Crypto(
      imageURL: 'images/ethereum_symbol.png',
      text1: 'Ethereum',
      text2: 'ETH',
      amount: '\$2,605.95'),
  Crypto(
      imageURL: 'images/eos_symbol.png',
      text1: 'EOS',
      text2: 'EOS.IO',
      amount: '\$426.32'),
  Crypto(
      imageURL: 'images/tether.png',
      text1: 'Tether',
      text2: 'USDT',
      amount: '\$1.00'),
  Crypto(
      imageURL: 'images/ada_symbol.png',
      text1: 'Cardano',
      text2: 'ADA',
      amount: '\$1.86'),
];
