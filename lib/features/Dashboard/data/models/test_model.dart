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
  final int calls;

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
      calls: (json["calls"] as List).map((c) => Call.fromJson(c)).toList().length,
    );
  }
}

// class CallData {
//   late int pending;
//   late int called;
//   late int rescheduled;
//   late List<Calls> calls;

//   CallData({
//     required this.pending,
//     required this.called,
//     required this.rescheduled,
//     required this.calls,
//   });

//   CallData.fromJson(Map<String, dynamic> json) {
//     pending = json['pending'];
//     called = json['called'];
//     rescheduled = json['rescheduled'];
//     if (json['calls'] != null) {
//       calls = <Calls>[];
//       json['calls'].forEach((v) {
//         calls.add(Calls.fromJson(v));
//       });
//     }
//   }
// }

// class Calls {
//   String? firstName;
//   String? lastName;
//   String? title;
//   int? phone;
//   int? otherPhone1;
//   int? otherPhone2;
//   int? otherPhone3;
//   int? otherPhone4;
//   String? email;
//   String? address;
//   String? company;
//   int? age;
//   int? zip;
//   String? maritalStatus;
//   String? notes;
//   String? calledAt;
//   String? rescheduledAt;
//   String? createdAt;
//   String? status;
//   String? agentName;
//   String? agentId;
//   int? duration;
//   String? feedback;

//   Calls({
//     this.firstName,
//     this.lastName,
//     this.title,
//     this.phone,
//     this.otherPhone1,
//     this.otherPhone2,
//     this.otherPhone3,
//     this.otherPhone4,
//     this.email,
//     this.address,
//     this.company,
//     this.age,
//     this.zip,
//     this.maritalStatus,
//     this.notes,
//     this.calledAt,
//     this.rescheduledAt,
//     this.createdAt,
//     this.status,
//     this.agentName,
//     this.agentId,
//     this.duration,
//     this.feedback,
//   });

//   Calls.fromJson(Map<String, dynamic> json) {
//     firstName = json['FirstName'];
//     lastName = json['LastName'];
//     title = json['Title'];
//     phone = json['Phone'];
//     otherPhone1 = json['Other Phone 1'];
//     otherPhone2 = json['Other Phone 2'];
//     otherPhone3 = json['Other Phone 3'];
//     otherPhone4 = json['Other Phone 4'];
//     email = json['Email'];
//     address = json['Address'];
//     company = json['Company'];
//     age = json['Age'];
//     zip = json['Zip'];
//     maritalStatus = json['MaritalStatus'];
//     notes = json['Notes'];
//     calledAt = json['calledAt'];
//     rescheduledAt = json['rescheduledAt'];
//     createdAt = json['createdAt'];
//     status = json['status'];
//     agentName = json['agentName'];
//     agentId = json['agentId'];
//     duration = json['duration'];
//     feedback = json['feedback'];
//   }
// }
