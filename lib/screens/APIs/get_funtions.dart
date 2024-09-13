import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/utils.dart';
import '../sharePref/savedUserData.dart';

// Take data from api
class GETCrypto {
  //getting 'sell link' and 'QR link'
  static get_crypto_info(String crypto_code) async {
    final token = await SavedUserData.getUserToken();
    Map data;

    http.Response response = await http.get(
        Uri.parse(base_url + "/api/v1/cryptos/$crypto_code"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      data = json.decode(response.body)["data"];
    } else {
      data = {};
    }
    return data;
  }

  // get all Cryptude
  static get_cryptos() async {
    final token = await SavedUserData.getUserToken();
    List allCryptosData;
    print("Printing Token");
    print(token);

    http.Response response = await http.get(
        Uri.parse(base_url + "/api/v1/cryptos/"),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    print("RESPONSE : " + response.statusCode.toString());
    if (response.statusCode == 200) {
      print("DATA : ");
      print(json.decode(response.body)["results"]);
      allCryptosData = json.decode(response.body)["results"];
    } else {
      allCryptosData = [];
    }
    return allCryptosData;
  }
}
