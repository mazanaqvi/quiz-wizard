import 'dart:ui';

import 'package:quiz_wizard/models/sub_event.dart';

class Event {
  final Color color;
  final String title;
  final String imagePath;
  final String detailPageimagePath;
  final int count;
  final List<SubEvent> subEvents;

  Event(this.color, this.title, this.imagePath, this.detailPageimagePath,
      this.count, this.subEvents);

  getDummyList() {
    List<Event> events = [];
    List<SubEvent> subEvents = getSubEvents();

    events.add(Event(const Color(0xFF6AD5FF), "Sports", "assets/sports.png",
        "assets/sport_detail.png", 1, subEvents));
    events.add(Event(const Color(0xFFF16602), "Mathematics", "assets/math.png",
        "assets/sports.png", 2, subEvents));
    events.add(Event(const Color(0xFFEDC224), "General Knowledge",
        "assets/general_knowledge.png", "assets/sports.png", 3, subEvents));
    events.add(Event(const Color(0xFF73FF6B), "Astronomy",
        "assets/astronomy.png", "assets/sports.png", 4, subEvents));
    events.add(Event(const Color(0xFF2B3CDD), "English", "assets/english.png",
        "assets/sports.png", 5, subEvents));
    return events;
  }

  getSubEvents() {
    List<SubEvent> subEvents = [];
    subEvents.add(SubEvent("Swimming", "assets/sport_detail.png", 10, 1));
    subEvents.add(SubEvent("Cricket", "assets/sport_detail.png", 10, 2));
    subEvents
        .add(SubEvent("Track and Field", "assets/sport_detail.png", 10, 3));
    subEvents.add(SubEvent("Swimming", "assets/sport_detail.png", 10, 4));
    subEvents.add(SubEvent("Cricket", "assets/sport_detail.png", 10, 5));
    subEvents
        .add(SubEvent("Track and Field", "assets/sport_detail.png", 10, 2));

    return subEvents;
  }
}
