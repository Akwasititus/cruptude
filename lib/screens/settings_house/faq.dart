import 'package:flutter/material.dart';

import '../../constants/utils.dart';
import 'faqs_model.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            "FREQUENTLY ASKED \nQUESTIONS",
            style: AllStyle.cedisBig,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: getFAQModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        leading: Text(getFAQModel[index].num),
                        title: Text(getFAQModel[index].header),
                        children: [
                          Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                getFAQModel[index].discription,
                                style: AllStyle.text2,
                              )),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.2,
                      ),
                    ],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
