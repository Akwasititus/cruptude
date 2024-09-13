import 'dart:core';

import 'package:cryptude/screens/transaction_history/transaction_histroy_bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/utils.dart';
import '../APIs/getx_class.dart';

class TransactionHistory extends StatefulWidget {
  // final String amountEnteredByUser;
  // final String cryptoCode;
  // final String cryptoInfo;
  // const TransactionHistory(
  //      this.cryptoCode,  this.amountEnteredByUser,  this.cryptoInfo);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Center(child: Text(item, style: AllStyle.hintStyle)),
      );

  DropdownMenuItem<String> buildMenuItem2(String item2) => DropdownMenuItem(
        child: DropdownMenuItem(
          value: item2,
          child: Center(
            child: Text(
              item2,
              style: AllStyle.hintStyle,
            ),
          ),
        ),
      );
  final items1 = ['BitCoin', 'Ethereum', 'EOS', 'Tether', 'Cardano'];
  final items2 = [
    'One day',
    'One Week',
    'One Month',
    'One Year',
  ];
  String? value1;
  String? value2;

  final TextEditingController _textController = TextEditingController();

  //List _foundUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = getTransactionHistory.cast<Map<String, dynamic>>();
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = getTransactionHistory.cast<Map<String, dynamic>>();
    } else {
      results = getTransactionHistory
          .where((user) => user.currency
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  ///......

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    // Initializing state management 'controller' class to access all of it's variables (implementation)
    final CryptudeProvider getxController = Get.put(CryptudeProvider());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.5)),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          items: items1.map(buildMenuItem).toList(),
                          value: value1,
                          isExpanded: true,
                          hint: Text('Any type', style: AllStyle.hintStyle),
                          elevation: 0,
                          icon: const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                            size: 12,
                          ),
                          onChanged: (value) => setState(() {
                                value1 = value;
                              })),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 33,
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      controller: _textController,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0x00ffffff),
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintText: "Search",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.search_sharp,
                            size: 12,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 33,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.5)),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          items: items2.map(buildMenuItem).toList(),
                          value: value2,
                          isExpanded: true,
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('All time', style: AllStyle.hintStyle),
                              const SizedBox(
                                width: 7,
                              ),
                              const Icon(
                                Icons.calendar_today,
                                size: 12,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          iconSize: 15,
                          iconEnabledColor: Colors.white,
                          elevation: 0,
                          onChanged: (value) => setState(() {
                                value2 = value;
                              })),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text('History', style: AllStyle.history),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: getTransactionHistory.length,
                        itemBuilder: (context, transactionHistoryIndex) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 75,
                                          decoration: const ShapeDecoration(
                                            color: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                          ),
                                          child: Center(
                                              child: Text('Pending',
                                                  style: AllStyle.text17)),
                                        ),
                                        Expanded(child: Container()),
                                        Row(
                                          children: [
                                            Image.asset(
                                              getTransactionHistory[
                                                      transactionHistoryIndex]
                                                  .cryptoLogoUrl,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              width: 8.5,
                                            ),
                                            Text(
                                                getTransactionHistory[
                                                        transactionHistoryIndex]
                                                    .currency,
                                                //widget.cryptoCode,
                                                style: AllStyle.text2)
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text('Amount', style: AllStyle.text6),
                                        Expanded(child: Container()),
                                        Text(
                                            getTransactionHistory[
                                                    transactionHistoryIndex]
                                                .amount,
                                            // widget.amountEnteredByUser +
                                            //     " " +
                                            //     widget.cryptoCode,
                                            style: AllStyle.text2)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text('Address', style: AllStyle.text6),
                                        Expanded(child: Container()),
                                        Text(
                                            getTransactionHistory[
                                                    transactionHistoryIndex]
                                                .address,
                                            // getxController
                                            //     .cryptoInfo?['sell_link'],
                                            style: AllStyle.text2)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text('Transaction ID',
                                            style: AllStyle.text6),
                                        Expanded(child: Container()),
                                        Text(
                                            getTransactionHistory[
                                                    transactionHistoryIndex]
                                                .transactionID,
                                            style: AllStyle.text2)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text('Date', style: AllStyle.text6),
                                        Expanded(child: Container()),
                                        Text(DateFormat("yyyy-MM-dd kk:mm:ss")
                                            .format(DateTime.now())),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 0.2,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        })
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
