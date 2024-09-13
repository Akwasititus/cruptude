import 'package:cryptude/screens/landing_page/dash_bord.dart';

import 'package:cryptude/screens/referal/referal_program.dart';
import 'package:cryptude/screens/transaction_history/transaction_history.dart';
import 'package:flutter/material.dart';

import '../../constants/utils.dart';
import '../settings_house/settings.dart';

class HomeScreen extends StatefulWidget {
  // final String amountEnteredByUser;
  // final String cryptoCode;
  // final String cryptoInfo;
  // HomeScreen(
  //     {required this.cryptoCode,
  //     required this.amountEnteredByUser,
  //     required this.cryptoInfo});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    const DashBord(),
    TransactionHistory(
        // amountEnteredByUser: widget.amountEnteredByUser,
        // cryptoCode: widget.cryptoCode,
        // cryptoInfo: widget.cryptoInfo,
        ),
    ReferralProgram(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColorBlue,
          iconSize: 30,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.lightBlueAccent,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/sellBTC.png")),
              label: 'Sell',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/history.png")),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/referral.png")),
              label: 'Referral',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/settings.png")),
              label: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
