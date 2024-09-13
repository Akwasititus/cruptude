import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/Controller.dart';
import '../../constants/utils.dart';
import '../APIs/getx_class.dart';

class SellCryptoDone extends StatelessWidget {
  //SellCryptoDone({Key? key}) : super(key: key);

  //final controller = Get.put(Controller());
  final String amountEnteredByUser;
  final String cryptoCode;
  const SellCryptoDone(
      {required this.amountEnteredByUser, required this.cryptoCode});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final CryptudeProvider getxController = Get.put(CryptudeProvider());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 35,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  'images/yay.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "You Successfully sold " +
                        amountEnteredByUser +
                        " " +
                        cryptoCode +
                        " for 750 \n"
                            " Cedis.",
                    textAlign: TextAlign.center,
                    style: AllStyle.text12),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  //margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: AppColors.cardColorBorder),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Status',
                              style: AllStyle.text10,
                            ),
                            Expanded(child: Container()),
                            Text(
                              'Transaction ID',
                              style: AllStyle.text10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Pending',
                              style: AllStyle.text16,
                            ),
                            Expanded(child: Container()),
                            Text(
                              '0msx836930...87r39',
                              style: AllStyle.text10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Get.offNamed('/homeScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.3),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: MyButtons.loginButtonWithBorders,
                    child: Center(
                      child: Text(
                        'Done',
                        style: AllStyle.buttonTextStyle4Register,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
