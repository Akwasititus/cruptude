import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/utils.dart';
import '../../APIs/getx_class.dart';
import '../../notification_arena/sell_crypto_dialog.dart';
import 'cryptude_Bank.dart';

class SellCrytude extends StatefulWidget {
  const SellCrytude({Key? key}) : super(key: key);

  @override
  State<SellCrytude> createState() => _SellCrytudeState();
}

class _SellCrytudeState extends State<SellCrytude> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  var cryptosArray = ['BTC', 'ETH', 'EOS.IO', 'USDT', 'ADA'];

  // search fillter from line 54 - 85
  //List _foundUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];

  void allCryptos() {
    final CryptudeProvider getxController = Get.put(CryptudeProvider());
    getxController.getAllCryptos();
  }

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = getCrypto.cast<Map<String, dynamic>>();
    allCryptos();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = getCrypto.cast<Map<String, dynamic>>();
    } else {
      results = getCrypto
          .where((user) =>
              user.text1.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final CryptudeProvider getxController = Get.put(CryptudeProvider());
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Crypto',
                  style: AllStyle.text5,
                ),
                const SizedBox(
                  height: 10,
                ),

                //search Box
                TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0x00ffffff),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: "Search Coin",
                      hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.search_sharp,
                        size: 15,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: AppColors.primaryColorBlue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("# Name ", style: AllStyle.text6),
              Text("Price 24h %", style: AllStyle.text6),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
            child: const Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // List of Cryptos
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
              child: getxController.allCryptos.isNotEmpty
                  ? SizedBox(
                      height: 330,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: getxController.allCryptos.length,
                          itemBuilder: (context, cryptoIndex) {
                            return InkWell(
                              splashColor: Colors.grey,
                              onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SellCryptoDialog(
                                        cryptoCode: cryptosArray[cryptoIndex]),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        getxController
                                            .allCryptos[cryptoIndex].icon,
                                        height: 45,
                                      ),
                                      Text(
                                          getxController
                                              .allCryptos[cryptoIndex].name,
                                          style: AllStyle.text2),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          getxController
                                              .allCryptos[cryptoIndex].code,
                                          style: AllStyle.text3),
                                      Expanded(child: Container()),
                                      Text(
                                          getxController
                                              .allCryptos[cryptoIndex].rate,
                                          style: AllStyle.text2),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 0.2,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
