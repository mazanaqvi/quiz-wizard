import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/views/event_page.dart';
import 'package:quiz_wizard/views/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mainColor,
          image: const DecorationImage(
            image: AssetImage(
              "assets/character.png",
            ),
          )),
      child: Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Image(
                    height: MediaQuery.of(context).size.height * 0.5,
                    image: const AssetImage(
                      "assets/login_back.png",
                    ),
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeatY,
                    color: whiteColor),
                Image(
                    height: MediaQuery.of(context).size.height * 0.5,
                    image: const AssetImage(
                      "assets/login_back.png",
                    ),
                    color: whiteColor),
              ],
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center, // use aligment

                      child: Image.asset('assets/character.png',
                          height: 180, width: 180, fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center, // use aligment

                        child: Column(
                          children: [
                            Image.asset('assets/logo.png', fit: BoxFit.fill),
                            const Text("Hey,",
                                style: TextStyle(
                                    color: Color(0xFF232751),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Let's get you started,",
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Choose your avatar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(14.0, 0, 14, 0),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c1.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c2.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c3.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c4.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c5.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c1.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c2.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c3.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c4.png")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Image(
                                          image: AssetImage("assets/c5.png")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFE5E5E5),
                                  hintText: "Please enter your username",
                                  hintStyle: regularText(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFE5E5E5),
                                  hintText: "Password",
                                  hintStyle: regularText(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Forgot your Password?",
                                    style: regularText(),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Reset Password ",
                                      style: regularText().copyWith(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                width: double.infinity,
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
                                    "Login",
                                    style: buttonText(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: regularText(),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Create One",
                                      style: regularText().copyWith(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
