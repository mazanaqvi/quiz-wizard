import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/views/event_page.dart';
import 'package:quiz_wizard/views/general_widgets/appbar.dart';
import 'package:quiz_wizard/views/general_widgets/general_info.dart';
import 'package:quiz_wizard/views/styles.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image(
                  image: const AssetImage("assets/bear.png"),
                  color: greyColor,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      image: AssetImage("assets/smily.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text("Score 4/5",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.8,
                  image: const AssetImage("assets/cong.png"),
                ),
              ),
            ),
          ),
          const Text("you cleared the event!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You Earned points",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        )),
                    Text(" 40",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 25,
                        )),
                    const Text(" points",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: mainColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.offAll(const EventPage());
                  },
                  child: Text(
                    "NEXT EVENT",
                    style: buttonText(),
                  ),
                ),
              ),
            ),
          ),
          const GeneralInfo()
        ],
      ),
    );
  }
}
