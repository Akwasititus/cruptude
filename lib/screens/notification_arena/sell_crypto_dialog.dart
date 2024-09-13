import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/utils.dart';
import '../APIs/getx_class.dart';
import '../landing_page/confirm_sell_cryptude.dart';
import '../landing_page/sell_cryto.dart';
import '../settings_house/faq.dart';
import '../settings_house/terms_and_condition.dart';

class SellCryptoDialog extends StatefulWidget {
  final String cryptoCode;
  const SellCryptoDialog({
    required this.cryptoCode,
  });

  @override
  State<SellCryptoDialog> createState() => _SellCryptoDialogState();
}

class _SellCryptoDialogState extends State<SellCryptoDialog> {
  // global form key here bro :)
  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //I am the controller for the dialog
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    //final CryptudeProvider getxController = Get.put(CryptudeProvider());
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 10,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Sell Crypto',
                        style: AllStyle.text15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Enter amount',
                        style: AllStyle.text15,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          // validator: (e) {
                          //   if (_controller.text.isEmpty ||
                          //       !RegExp(r'^[a-z A-Z]+$')
                          //           .hasMatch(_controller.text)) {
                          //     return "Field can't be empty or must be numbers only";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          keyboardType: TextInputType.number,
                          controller: _controller,
                          style: const TextStyle(
                              fontSize: 29,
                              height: 2,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: "\$100",
                              hintStyle:
                                  TextStyle(fontSize: 15.0, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      Text(
                        //this 'cryptocode' is the constructor created up there
                        //it displays the crypto selected by the user 'BTC','ETH' etc.
                        widget.cryptoCode,
                        style: AllStyle.text11,
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "You will get ",
                          style: AllStyle.text6,
                        ),
                        TextSpan(
                          text: ('750'),
                          style: AllStyle.text11,
                        ),
                        TextSpan(
                          text: ' Cedis',
                          style: AllStyle.text6,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),

              // Sell Button
              GestureDetector(
                onTap: () async {
                  // if (_formkey.currentState != null) {
                  //   _formkey.currentState?.validate();
                  // }
                  // Load crypto info using crypto code
                  //getxController.getCryptoInfo(widget.crypto_code);
                  //Getx navigation to the home screen
                  Get.off(
                    () => ConfirmSellCryptude(
                      //sending value to the next screen
                      amountEnteredByUser: _controller.text,
                      cryptoCode: widget.cryptoCode,
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: MyButtons.loginButton,
                  child: Center(
                    child: Text(
                      'Sell',
                      style: AllStyle.buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
