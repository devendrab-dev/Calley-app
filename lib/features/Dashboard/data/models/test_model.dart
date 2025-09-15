class Call {
  final String firstName;
  final String lastName;
  final String status;
  final DateTime? calledAt;
  final DateTime? rescheduledAt;
  final int? duration;
  final String? feedback;

  Call({
    required this.firstName,
    required this.lastName,
    required this.status,
    this.calledAt,
    this.rescheduledAt,
    this.duration,
    this.feedback,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      firstName: json["FirstName"],
      lastName: json["LastName"],
      status: json["status"],
      calledAt: json["calledAt"] != null
          ? DateTime.parse(json["calledAt"])
          : null,
      rescheduledAt: json["rescheduledAt"] != null
          ? DateTime.parse(json["rescheduledAt"])
          : null,
      duration: json["duration"],
      feedback: json["feedback"],
    );
  }
}

class CallData {
  final int pending;
  final int called;
  final int rescheduled;
  final List<Call> calls;

  CallData({
    required this.pending,
    required this.called,
    required this.rescheduled,
    required this.calls,
  });

  factory CallData.fromJson(Map<String, dynamic> json) {
    return CallData(
      pending: json["pending"],
      called: json["called"],
      rescheduled: json["rescheduled"],
      calls: (json["calls"] as List).map((c) => Call.fromJson(c)).toList(),
    );
  }
}
