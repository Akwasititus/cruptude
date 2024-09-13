import 'package:get/get.dart';

import 'get_funtions.dart';

class CryptudeProvider extends GetxController {
  //=============================

  // =====================================
  // All data from API in variables
  // ======================================
  Map cryptoInfo = {};
  List allCryptos = [];

  // =====================================
  // All functions for receiving API data
  // ======================================
  void getCryptoInfo(String crypto_code) async {
    cryptoInfo = await GETCrypto.get_crypto_info(crypto_code);
    update();
  }

  void getAllCryptos() async {
    allCryptos = await GETCrypto.get_cryptos();
    update();
  }
}
