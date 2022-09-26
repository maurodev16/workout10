class PlanModel {
  final int start;
  final String dateTime;

  PlanModel({
    required this.start,
    required this.dateTime,
  });
  Map<String, dynamic> toMap() {
    return {
      'start': this.start,
      'dateTime': this.dateTime,
    };
  }

  factory PlanModel.fromMap(Map map) {
    return PlanModel(
      start: map['start'],
      dateTime: map['dateTime'],
    );
  }
  String toString() {
    return 'start: $start dateTime: $dateTime';
  }
}
