import 'package:flutter/material.dart';

import '../../../constants/utils.dart';
import '../../notification_arena/sell_crypto_dialog.dart';
import 'GiftCard_Bank.dart';

class SellGiftCard extends StatefulWidget {
  const SellGiftCard({Key? key}) : super(key: key);

  @override
  State<SellGiftCard> createState() => _SellGiftCardState();
}

class _SellGiftCardState extends State<SellGiftCard> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var cryptosArray = [
    'Amazon',
    'iTunes',
    'Apple',
    'Steam',
  ];

  // search filter
  //List _foundUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = getGiftCard.cast<Map<String, dynamic>>();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = getGiftCard.cast<Map<String, dynamic>>();
    } else {
      results = getGiftCard
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Gift Card',
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
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.09),
            child: _foundUsers.isNotEmpty
                ? SizedBox(
                    height: 330,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: getGiftCard.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      getGiftCard[cryptoIndex].imageURL,
                                      height: 45,
                                    ),
                                    Text(getGiftCard[cryptoIndex].text1,
                                        style: AllStyle.text2),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(getGiftCard[cryptoIndex].text2,
                                        style: AllStyle.text3),
                                    Expanded(child: Container()),
                                    Text(getGiftCard[cryptoIndex].amount,
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
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        ],
      ),
    );
  }
}
