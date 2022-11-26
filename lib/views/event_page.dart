import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/models/events.dart';
import 'package:quiz_wizard/views/general_widgets/appbar.dart';
import 'package:quiz_wizard/views/login_page.dart';
import 'package:quiz_wizard/views/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Event event =
        Event(const Color(0xFF6AD5FF), "Sports", "assets/sports.png", 1);
    List<Event> events = event.getDummyList();
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 190.0),
                  child: Image(
                    image: const AssetImage("assets/bear.png"),
                    color: greyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      image: AssetImage("assets/events.png"),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text("Looking forward events",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Divider(
              indent: MediaQuery.of(context).size.width * 0.4,
              endIndent: MediaQuery.of(context).size.width * 0.4,
              color: const Color(0xFFedc224),
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 24.0,
                crossAxisSpacing: 6,
                childAspectRatio: 0.6,
                shrinkWrap: true,
                children: List.generate(
                  5,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: events[index].color,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: AssetImage(events[index].imagePath),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(events[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text("${events[index].count} Events",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
