import 'package:clipboard/clipboard.dart';
import 'package:cryptude/screens/landing_page/sell_crypto_done.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/Controller.dart';
import '../../constants/utils.dart';
import '../APIs/getx_class.dart';
import '../login_screen/login_decoration/input_deco_design.dart';

class SellCryptoConfirm extends StatefulWidget {
  // i am a constractor for getting the input amount and the crypto like 'BTC'
  final String amountEnteredByUser;
  final String cryptoCode;
  const SellCryptoConfirm({
    required this.cryptoCode,
    required this.amountEnteredByUser,
  });

  @override
  _SellCryptoConfirmState createState() => _SellCryptoConfirmState();
}

class _SellCryptoConfirmState extends State<SellCryptoConfirm> {
  //final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  final TextEditingController _paymentWallet = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _paymentWallet.dispose();
    _name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    // Initializing state management 'controller' class to access all of it's variables (implementation)
    final CryptudeProvider getxController = Get.put(CryptudeProvider());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sell Crypto',
          style: AllStyle.text15,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Confirm',
                  style: AllStyle.text15,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      color: AppColors.referralTxtColor1real,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'images/wallet.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sell', style: AllStyle.text6),
                              Text(
                                widget.amountEnteredByUser +
                                    " " +
                                    widget.cryptoCode,
                                style: AllStyle.text10,
                              ),
                            ],
                          ),
                        ],
                      ), //
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'images/wallet_green.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Get', style: AllStyle.text6),
                              Text(
                                '750 Cedis',
                                style: AllStyle.text10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address', style: AllStyle.text15),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Only Sent ' +
                            //here's the crypto (BTC)
                            widget.cryptoCode +
                            ' to this address. Sending any other asset '
                                'to this address may result in loss of asset!',
                        textAlign: TextAlign.center,
                        style: AllStyle.text10),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.referralTxtColor1real,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              width: 1, color: AppColors.cardColorBorder)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // getting sell link from API
                          getxController.cryptoInfo['sell_link'] != null
                              ? Text(
                                  getxController.cryptoInfo['sell_link'],
                                  style: const TextStyle(
                                      color: AppColors.textCardColorBorder),
                                )
                              : const Center(
                                  child: Text(
                                  'xxxxxxxxxxxxxxxxxxxxxxx',
                                  style: TextStyle(
                                      color: AppColors.textCardColorBorder),
                                )),

                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              //'FlutterClipboard' will copy the sell link to clipboard
                              FlutterClipboard.copy(
                                  getxController.cryptoInfo['sell_link']);
                              Get.snackbar(
                                "Get Code",
                                "Code copied",
                              );
                            },
                            child: const Icon(
                              Icons.copy_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Sell QR Code
                    //this is getting the QR-Code from API
                    getxController.cryptoInfo['sell_qr_code'] != null
                        ? Image.network(
                            getxController.cryptoInfo['sell_qr_code'])
                        : const Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            color: Colors.blue,
                          )),

                    const SizedBox(
                      height: 20,
                    ),
                    //Text('Payment Details', style: AllStyle.text11),
                  ],
                ),

                // Form(
                //   //key: _formkey2,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Text('Payment Wallet', style: AllStyle.text6),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       TextFormField(
                //         // validator: (e) {
                //         //   if (_paymentWallet.text.isEmpty) {
                //         //     return "Please enter Number";
                //         //   } else {
                //         //     return null;
                //         //   }
                //         // },
                //         controller: _paymentWallet,
                //         style: RegisterStyles.subBody1,
                //         keyboardType: TextInputType.phone,
                //         decoration: buildInputDecoration("0201094411"),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Text('Name', style: AllStyle.text6),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       TextFormField(
                //         // validator: (e) {
                //         //   if (_name.text.isEmpty) {
                //         //     return "Please enter Name";
                //         //   } else {
                //         //     return null;
                //         //   }
                //         // },
                //         controller: _name,
                //         style: RegisterStyles.subBody1,
                //         keyboardType: TextInputType.name,
                //         decoration: buildInputDecoration("John Authur"),
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //     ],
                //   ),
                // ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Text(
                //         "You are about to sell " +
                //             //this is the value entered by the user in the sell_crypto dialog
                //             widget.amountEnteredByUser +
                //             " " +
                //             //here's the crypto (BTC)
                //             widget.cryptoCode +
                //             " for 750 \n"
                //                 " Cedis. Send " +
                //             widget.cryptoCode +
                //             " to the address below.",
                //         textAlign: TextAlign.center,
                //         style: AllStyle.text10),
                //     const SizedBox(
                //       height: 20,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Get.offNamed('/homeScreen');
                //       },
                //       child: Container(
                //         height: 50,
                //         width: double.infinity,
                //         decoration: MyButtons.loginButtonWithBorders,
                //         child: Center(
                //           child: Text(
                //             'Cancel',
                //             style: AllStyle.buttonTextStyle4Register,
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     ),
                //     GestureDetector(
                //         onTap: () {
                //           //checking for validation
                //           // if (_formkey2.currentState != null) {
                //           //   _formkey2.currentState?.validate();
                //           // }
                //           Get.off(
                //             () => SellCryptoDone(
                //               // i'm passing some value here 'amountEnteredByUser' and 'cryptude'
                //               // selected by the user to the next screen
                //               amountEnteredByUser: widget.amountEnteredByUser,
                //               cryptoCode: widget.cryptoCode,
                //             ),
                //           );
                //         },
                //         child: Container(
                //           height: 45,
                //           width: double.infinity,
                //           decoration: MyButtons.loginButton,
                //           child: Center(
                //             child: Text(
                //               'I Understand, Continue',
                //               style: AllStyle.buttonTextStyle,
                //             ),
                //           ),
                //         )),
                //     const SizedBox(
                //       height: 20,
                //     ),
                //   ],
                // ),

                //buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}
