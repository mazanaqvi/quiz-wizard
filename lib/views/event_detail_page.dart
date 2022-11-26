import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quiz_wizard/models/events.dart';
import 'package:quiz_wizard/models/sub_event.dart';
import 'package:quiz_wizard/views/general_widgets/appbar.dart';
import 'package:quiz_wizard/views/general_widgets/general_info.dart';
import 'package:quiz_wizard/views/login_page.dart';
import 'package:quiz_wizard/views/styles.dart';

class EventDetailPage extends StatefulWidget {
  EventDetailPage({super.key, required this.event});
  Event event;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 190.0),
                  child: Image(
                    image: const AssetImage("assets/ball.png"),
                    color: greyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      image: AssetImage("assets/sport_detail.png"),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text("${widget.event.title} Events",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Divider(
                      indent: MediaQuery.of(context).size.width * 0.4,
                      endIndent: MediaQuery.of(context).size.width * 0.4,
                      color: widget.event.color,
                      thickness: 2,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SizedBox(
                    height: 70,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: const AssetImage("assets/shutter.png"),
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 24.0,
                crossAxisSpacing: 6,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                children: List.generate(
                  widget.event.subEvents.length,
                  (index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 38.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: widget.event.color),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: AssetImage(widget
                                          .event
                                          .subEvents[index]
                                          .subEventPicturePath),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child:
                                      Text(widget.event.subEvents[index].title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                      "Number of Questions: ${widget.event.subEvents[index].noOfQuestions} ",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 12),
                                  child: Text(
                                      "Remaining attempts: ${widget.event.subEvents[index].remainingAttempts} ",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    onPressed: () => {},
                                    child: Text(
                                      "Take Quiz",
                                      style: TextStyle(
                                        color: widget.event.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Stack(
                            children: const [
                              Image(
                                height: 80,
                                image: AssetImage("assets/level_circle.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 28.0, 0, 18),
                                child: SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Level 11",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const GeneralInfo()
          ],
        ));
  }
}
