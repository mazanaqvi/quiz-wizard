import 'dart:ui';

class Event {
  final Color color;
  final String title;
  final String imagePath;
  final int count;

  Event(this.color, this.title, this.imagePath, this.count);

  getDummyList() {
    List<Event> events = [];
    events.add(Event(Color(0xFF6AD5FF), "Sports", "assets/sports.png", 1));
    events.add(Event(Color(0xFFF16602), "Mathematics", "assets/math.png", 2));
    events.add(Event(Color(0xFFEDC224), "General Knowledge",
        "assets/general_knowledge.png", 3));
    events
        .add(Event(Color(0xFF73FF6B), "Astronomy", "assets/astronomy.png", 4));
    events.add(Event(Color(0xFF2B3CDD), "English", "assets/english.png", 5));
    return events;
  }
}
