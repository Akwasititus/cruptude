import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constants/utils.dart';
import '../landing_page/sell_crypto_done.dart';
import '../login_screen/login_decoration/input_deco_design.dart';

class ReferralProgram extends StatefulWidget {
  @override
  _ReferralProgramState createState() => _ReferralProgramState();
}

class _ReferralProgramState extends State<ReferralProgram> {
  bool referralCodeIsCopied = true;
  String referralText = "ui8.net/bitcloud1509";

  //final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  final TextEditingController _paymentWallet = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
            child: Column(
              children: [
                //referral header
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Referral', style: AllStyle.history),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text('Home', style: AllStyle.text6)),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Referral', style: AllStyle.history),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                const SizedBox(
                  height: 25,
                ),
                // amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Reward', style: AllStyle.text2),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "1,056.00", style: AllStyle.amountBig),
                          TextSpan(
                            text: ' Cedis ',
                            style: AllStyle.cedisBig,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "You're earning 10% of all transactions of your referrals",
                        style: AllStyle.text6),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),

                Container(
                  decoration: BoxDecoration(
                      color: AppColors.referralTxtColor1real,
                      borderRadius: BorderRadius.circular(20)),
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Invite Friends to\n"
                          "earn 20%",
                          textAlign: TextAlign.left,
                          style: AllStyle.amountBig,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Referral Link",
                              style: AllStyle.text2,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              height: 50,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: SelectableText(referralText),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Referral code",
                              style: AllStyle.text2,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 1.5),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: Row(
                                  children: [
                                    Center(child: Text(referralText)),
                                    Expanded(child: Container()),
                                    Container(
                                      height: 90,
                                      width: 80,
                                      decoration: const ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      child: Center(
                                          child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            referralCodeIsCopied =
                                                !referralCodeIsCopied;
                                            FlutterClipboard.copy(referralText);
                                            Get.snackbar(
                                              "Referral Code",
                                              "Code copied",
                                            );
                                          });
                                        },
                                        child: Text(
                                            referralCodeIsCopied
                                                ? "Copy"
                                                : "Copied",
                                            style: AllStyle.text17),
                                      )),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //payment wallet
              ],
            ),
          ),
        ),
      ),
    );
  }
}
