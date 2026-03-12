enum SessionRating {
  know,
  unsure,
  dontKnow,
}

class SessionStats {
  const SessionStats({
    required this.target,
    required this.completed,
    required this.known,
    required this.unsure,
    required this.again,
    required this.done,
  });

  final int target;
  final int completed;
  final int known;
  final int unsure;
  final int again;
  final bool done;

  static const empty = SessionStats(
    target: 30,
    completed: 0,
    known: 0,
    unsure: 0,
    again: 0,
    done: false,
  );
}
