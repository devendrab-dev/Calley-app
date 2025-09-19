class GetListModel {
  late String sId;
  late String name;
  late List agents;
  late String clientId;

  GetListModel({
    required this.sId,
    required this.name,
    required this.agents,
    required this.clientId,
  });

  GetListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['agents'] != null) {
      agents = <Null>[];
      json['agents'].forEach((v) {
        [];
      });
    }
    clientId = json['clientId'];
  }
}
