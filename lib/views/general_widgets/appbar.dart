import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/views/settings.dart';
import 'package:quiz_wizard/views/styles.dart';

// TODO: Needs refactoring
AppBar CustomAppBar({
  bool isNotSettingPage = true,
  List<Widget>? actions,
}) {
  return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                    height: 50, // Your Height
                    width: 50, // Your width
                    child: Image(image: AssetImage('assets/logo.png'))),
                Row(children: <Widget>[
                  const SizedBox(
                      height: 40, // Your Height
                      width: 40,
                      child:
                          Image(image: AssetImage('assets/notification.png'))),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                        height: 40, // Your Height
                        width: 40,
                        child: Image(image: AssetImage('assets/coin.png'))),
                  ),
                  const Text("280 Points",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                        height: 40, // Your Height
                        width: 40, // Your width
                        child: Image(image: AssetImage('assets/c3.png'))),
                  ),
                  isNotSettingPage
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: mainColor,
                              size: 40,
                            ),
                            onPressed: () => {Get.to(Settings())},
                          ))
                      : Container()
                ])
                // Your widgets here
              ]),
          const Divider(
            color: Color.fromARGB(255, 98, 97, 97),
          )
        ],
      ));
}
