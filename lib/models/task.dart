class Task {
  final String title;
  final String desc;
  bool state = false;

  Map toJson() => {
        'title': title,
        'desc': desc,
        'state': state,
      };
  Task(this.title, this.desc, this.state);

  void updateStat() {
    state = !state;
  }
}
