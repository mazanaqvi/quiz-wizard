import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/controllers/avatar_controller.dart';
import 'package:quiz_wizard/views/event_page.dart';
import 'package:quiz_wizard/views/settings.dart';
import 'package:quiz_wizard/views/styles.dart';

// TODO: Needs refactoring
// ignore: non_constant_identifier_names
AppBar CustomAppBar({
  bool isNotSettingPage = true,
  bool isNotHomePage = true,
  List<Widget>? actions,
}) {
  final AvatarController avatarController = Get.find(tag: 'avatarController');

  return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: SizedBox(
                        height: MediaQuery.of(Get.context!).size.height *
                            0.043, // Your Height
                        width: MediaQuery.of(Get.context!).size.width *
                            0.1, // Your width
                        child:
                            const Image(image: AssetImage('assets/logo.png'))),
                    onTap: () => {
                      if (isNotHomePage) {Get.to(const EventPage())}
                    },
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                        height: MediaQuery.of(Get.context!).size.height *
                            0.04, // Your Height
                        width: MediaQuery.of(Get.context!).size.width * 0.1,
                        child: const Image(
                            image: AssetImage('assets/notification.png'))),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                          height: MediaQuery.of(Get.context!).size.height *
                              0.04, // Your Height
                          width: MediaQuery.of(Get.context!).size.width * 0.1,
                          child: const Image(
                              image: AssetImage('assets/coin.png'))),
                    ),
                    const Text("280 Points",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Obx(
                        () => SizedBox(
                            height: MediaQuery.of(Get.context!).size.height *
                                0.04, // Your Height
                            width: MediaQuery.of(Get.context!).size.width *
                                0.1, // Your width
                            child: Image(
                                image: AssetImage(
                                    avatarController.avatarProfile.value))),
                      ),
                    ),
                    isNotSettingPage
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: mainColor,
                                size: MediaQuery.of(Get.context!).size.width *
                                    0.1, // Your Height
                              ),
                              onPressed: () => {Get.to(const Settings())},
                            ))
                        : Container()
                  ])
                  // Your widgets here
                ]),
          ),
          const Divider(
            color: Color.fromARGB(255, 98, 97, 97),
          )
        ],
      ));
}
