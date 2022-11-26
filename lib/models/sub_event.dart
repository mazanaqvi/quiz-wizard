class SubEvent {
  final String subEventPicturePath;
  final String title;

  final int noOfQuestions;
  final int remainingAttempts;

  SubEvent(this.title, this.subEventPicturePath, this.noOfQuestions,
      this.remainingAttempts);
}
